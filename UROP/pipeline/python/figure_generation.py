import csv
import os
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap

PROMPT_TYPES = ["zero-shot", "schema-based", "one-shot"]
CATEGORIES = ["dirt", "agent", "empty"]
CHECKS = ["partition", "bounds", "coverage", "implies_grid",
          "wall_count", "no_interior_walls", "cell_wall_counts", "all_directions"]

GRIDLINE = "#e1e0d9"
AXIS_LINE = "#c3c2b7"
TICK_INK = "#898781"
SECONDARY_INK = "#52514e"
PRIMARY_INK = "#0b0b0b"

DATASETS = {
    "large": dict(
        csv_dir="UROP/pipeline/results/large_llm_results/csv",
        fig_dir="UROP/pipeline/results/large_llm_results/figures",
        model_colors={
            "claude-sonnet-4.6":     "#2a78d6",  # blue
            "gemini-2.5-flash":      "#1baf7a",  # aqua
            "gemini-3.1-flash-lite": "#eda100",  # yellow
            "deepseek-V3":    "#008300",  # green
            "gemma-4-31b":           "#4a3aa7",  # violet
        },
        samples=range(1, 6),
        label="Large Models",
    ),
    "small": dict(
        csv_dir="UROP/pipeline/results/small_llm_results/csv",
        fig_dir="UROP/pipeline/results/small_llm_results/figures",
        model_colors={
            "gemma2-9b":   "#2a78d6",  # blue
            "qwen2.5-7b":  "#1baf7a",  # aqua
        },
        samples=range(1, 21),
        label="Small Models",
    ),
}


def style_axis(ax):
    ax.grid(axis="y", color=GRIDLINE, linewidth=1, zorder=0)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color(AXIS_LINE)
    ax.spines["bottom"].set_color(AXIS_LINE)
    ax.tick_params(colors=TICK_INK)


def shared_legend(fig, axes, models):
    handles, labels = axes[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=len(models),
               bbox_to_anchor=(0.5, -0.05), frameon=False)


# ---- Figure 1: wall-rule F1 vs grid size -------------------------------------

def load_f1_by_n(csv_dir, samples, prompt_type, model):
    f1_by_n = {}
    for n in samples:
        path = f"{csv_dir}/f1_N/{prompt_type}-{model}-sample_{n}.csv"
        with open(path, newline="") as f:
            for row in csv.DictReader(f):
                if row["F1"] == "ERROR":
                    continue
                f1_by_n.setdefault(int(row["N"]), []).append(float(row["F1"]))
    ns = sorted(f1_by_n)
    means = [sum(f1_by_n[n]) / len(f1_by_n[n]) for n in ns]
    return ns, means


def is_flat_and_uniform(series_by_model):
    values = {round(v, 4) for means in series_by_model.values() for v in means}
    return len(values) == 1


def overlapping_groups(series_by_model):
    groups = {}
    for model, means in series_by_model.items():
        key = tuple(round(v, 4) for v in means)
        groups.setdefault(key, []).append(model)
    return [models for models in groups.values() if len(models) > 1]


def plot_wall_f1_vs_grid_size(csv_dir, fig_dir, model_colors, samples, label):
    models = list(model_colors)
    fig, axes = plt.subplots(1, 3, figsize=(15, 4.5), sharey=True)

    for ax, prompt_type in zip(axes, PROMPT_TYPES):
        series_by_model = {}
        for model in models:
            ns, means = load_f1_by_n(csv_dir, samples, prompt_type, model)
            series_by_model[model] = means
            ax.plot(ns, means, color=model_colors[model], linewidth=2,
                     marker="o", markersize=6, label=model)

        if is_flat_and_uniform(series_by_model):
            flat_value = next(iter(series_by_model.values()))[0]
            ax.text(0.5, 0.5, f"All models: F1 = {flat_value:.2f}\nfor every grid size",
                     transform=ax.transAxes, ha="center", va="center",
                     fontsize=10, color=SECONDARY_INK)
        else:
            note_y = 0.94
            for group in overlapping_groups(series_by_model):
                ax.text(0.98, note_y, "overlapping: " + ", ".join(group),
                         transform=ax.transAxes, ha="right", va="top",
                         fontsize=8, color=SECONDARY_INK, style="italic")
                note_y -= 0.06

        ax.set_title(prompt_type, fontsize=12, fontweight="semibold", color=PRIMARY_INK)
        ax.set_xlabel("Grid size (N)", color=SECONDARY_INK)
        ax.set_xticks(range(3, 14))
        ax.set_ylim(-0.05, 1.05)
        style_axis(ax)

    axes[0].set_ylabel(f"Wall-rule F1 (mean of {len(samples)} samples)", color=SECONDARY_INK)
    shared_legend(fig, axes, models)
    fig.suptitle(f"Wall-Rule Generalization: F1 vs Grid Size ({label})", fontsize=14, fontweight="bold")
    fig.tight_layout(rect=[0, 0.05, 1, 0.95])

    out_path = f"{fig_dir}/f1_vs_grid_size.png"
    fig.savefig(out_path, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"Saved: {out_path}")


# ---- Figure 2: content F1 by category (dirt / agent / empty) ----------------

def load_content_f1(csv_dir, samples, prompt_type, model):
    f1_by_category = {c: [] for c in CATEGORIES}
    for n in samples:
        path = f"{csv_dir}/content_f1/{prompt_type}-{model}-sample_{n}.csv"
        with open(path, newline="") as f:
            for row in csv.DictReader(f):
                if row["F1"] == "ERROR":
                    continue
                f1_by_category[row["category"]].append(float(row["F1"]))
    return {c: (sum(v) / len(v) if v else 0.0) for c, v in f1_by_category.items()}


def plot_content_f1(csv_dir, fig_dir, model_colors, samples, label):
    models = list(model_colors)
    fig, axes = plt.subplots(1, 3, figsize=(15, 4.5), sharey=True)

    n_models = len(models)
    group_width = 0.8
    bar_width = group_width / n_models
    x_base = range(len(CATEGORIES))

    for ax, prompt_type in zip(axes, PROMPT_TYPES):
        for i, model in enumerate(models):
            means = load_content_f1(csv_dir, samples, prompt_type, model)
            offsets = [x + (i - (n_models - 1) / 2) * bar_width for x in x_base]
            values = [means[c] for c in CATEGORIES]
            ax.bar(offsets, values, width=bar_width * 0.9, color=model_colors[model],
                   label=model, zorder=3)

        ax.set_title(prompt_type, fontsize=12, fontweight="semibold", color=PRIMARY_INK)
        ax.set_xticks(list(x_base))
        ax.set_xticklabels(CATEGORIES)
        ax.set_ylim(0, 1.05)
        style_axis(ax)

    axes[0].set_ylabel(f"Content F1 (mean of {len(samples)} samples)", color=SECONDARY_INK)
    shared_legend(fig, axes, models)
    fig.suptitle(f"Content Translation F1: Dirt / Agent / Empty ({label})", fontsize=14, fontweight="bold")
    fig.tight_layout(rect=[0, 0.05, 1, 0.95])

    out_path = f"{fig_dir}/content_f1.png"
    fig.savefig(out_path, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"Saved: {out_path}")


# ---- Figure 3: constraint check pass rate heatmap ----------------------------

def load_check_pass_rates(csv_dir, samples, prompt_type, model):
    pass_counts = {c: 0 for c in CHECKS}
    totals = {c: 0 for c in CHECKS}
    for n in samples:
        path = f"{csv_dir}/checks/{prompt_type}-{model}-sample_{n}.csv"
        with open(path, newline="") as f:
            for row in csv.DictReader(f):
                check = row["check"]
                if check not in totals:
                    continue
                totals[check] += 1
                if row["result"] == "pass":
                    pass_counts[check] += 1
    return [pass_counts[c] / totals[c] if totals[c] else 0.0 for c in CHECKS]


def plot_checks_heatmap(csv_dir, fig_dir, model_colors, samples, label):
    models = list(model_colors)
    cmap = LinearSegmentedColormap.from_list("blue_seq", ["#fcfcfb", "#2a78d6", "#0d366b"])

    fig, axes = plt.subplots(1, 3, figsize=(15, 5.5), sharey=True)

    for idx, (ax, prompt_type) in enumerate(zip(axes, PROMPT_TYPES)):
        matrix = [load_check_pass_rates(csv_dir, samples, prompt_type, model) for model in models]
        # rows = checks, cols = models -> transpose
        matrix_t = list(zip(*matrix))

        im = ax.imshow(matrix_t, cmap=cmap, vmin=0, vmax=1, aspect="auto")

        for i in range(len(CHECKS)):
            for j in range(len(models)):
                value = matrix_t[i][j]
                text_color = "#ffffff" if value > 0.6 else PRIMARY_INK
                ax.text(j, i, f"{value:.2f}", ha="center", va="center",
                         fontsize=8, color=text_color)

        ax.set_xticks(range(len(models)))
        ax.set_xticklabels(models, rotation=45, ha="right", fontsize=8, color=SECONDARY_INK)
        ax.set_yticks(range(len(CHECKS)))
        if idx == 0:
            ax.set_yticklabels(CHECKS, fontsize=8, color=SECONDARY_INK)
        ax.set_title(prompt_type, fontsize=12, fontweight="semibold", color=PRIMARY_INK)
        for spine in ax.spines.values():
            spine.set_visible(False)

    fig.subplots_adjust(left=0.1, right=0.9, top=0.85, bottom=0.22, wspace=0.1)
    cbar_ax = fig.add_axes([0.92, 0.22, 0.015, 0.63])
    fig.colorbar(im, cax=cbar_ax, label="Pass rate")
    fig.suptitle(f"Constraint Check Pass Rate ({label})", fontsize=14, fontweight="bold")

    out_path = f"{fig_dir}/checks_heatmap.png"
    fig.savefig(out_path, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"Saved: {out_path}")


if __name__ == "__main__":
    for dataset in DATASETS.values():
        os.makedirs(dataset["fig_dir"], exist_ok=True)
        args = (dataset["csv_dir"], dataset["fig_dir"], dataset["model_colors"],
                dataset["samples"], dataset["label"])
        plot_wall_f1_vs_grid_size(*args)
        plot_content_f1(*args)
        plot_checks_heatmap(*args)
