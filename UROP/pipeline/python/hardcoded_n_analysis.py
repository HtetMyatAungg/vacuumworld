import csv
import glob
import re
import matplotlib.pyplot as plt

TRUE_N = 8  # actual grid size of the percept log shown to the model

GRIDLINE = "#e1e0d9"
AXIS_LINE = "#c3c2b7"
TICK_INK = "#898781"
SECONDARY_INK = "#52514e"
PRIMARY_INK = "#0b0b0b"
BAR_COLOR = "#2a78d6"
TRUE_COLOR = "#0ca30c"

SMALL_MODELS = ["gemma3-4b", "qwen2.5-3b"]
LARGE_MODELS = ["claude-sonnet-4.6", "deepseek-V3", "gemini-2.5-flash", "gemini-3.1-flash-lite", "gemma-4-31b"]
MODELS = SMALL_MODELS + LARGE_MODELS

PROMPT_TYPES = ["zero-shot", "one-shot", "schema-based"]


def csv_dir_for(model):
    base = "small_llm_results" if model in SMALL_MODELS else "large_llm_results"
    return f"UROP/pipeline/results/{base}/csv/f1_N"


def fig_dir_for(model):
    base = "small_llm_results" if model in SMALL_MODELS else "large_llm_results"
    return f"UROP/pipeline/results/{base}/figures"


def expected_sample_ns(model, prompt_type):
    pl_dir = f"UROP/pipeline/prolog/result/{model}/{prompt_type}"
    prefix = prompt_type.replace("-", "_")
    paths = glob.glob(f"{pl_dir}/{prefix}_sample_*.pl")
    return sorted(int(re.search(r"sample_(\d+)\.pl$", p).group(1)) for p in paths)


def sample_peak_n(csv_path):
    """Read a sample's F1-vs-N sweep and return its argmax N, or "flat" if F1
    is identical across every N (the wall rule generalizes/fails uniformly
    rather than peaking at one hardcoded grid size)."""
    rows = []
    with open(csv_path, newline="") as f:
        for row in csv.DictReader(f):
            try:
                rows.append((int(row["N"]), float(row["F1"])))
            except ValueError:
                continue  # per-N eval error (e.g. "ERROR"), skip just that row
    if not rows:
        return None
    f1_values = {f1 for _, f1 in rows}
    if len(f1_values) <= 1:
        return "flat"
    best_n, _ = max(rows, key=lambda r: (r[1], -r[0]))
    return best_n


def collect_counts(model, prompt_type):
    csv_dir = csv_dir_for(model)
    sample_ns = expected_sample_ns(model, prompt_type)
    total = len(sample_ns)

    peak_ns = []
    n_flat = 0
    missing_ns = []

    for n in sample_ns:
        path = f"{csv_dir}/{prompt_type}-{model}-sample_{n}.csv"
        try:
            peak = sample_peak_n(path)
        except FileNotFoundError:
            peak = None
        if peak is None:
            missing_ns.append(n)
        elif peak == "flat":
            n_flat += 1
        else:
            peak_ns.append(peak)

    print(f"\n=== {model} ({prompt_type}) ===")
    print("Per-sample argmax-N (peak F1 grid size):", sorted(peak_ns))
    print(f"Flat F1 across all N (no single peak): {n_flat}/{total}")
    print(f"Missing/empty F1 sweep (e.g. timeout): samples {missing_ns}")

    counts = {}
    for n in peak_ns:
        counts[n] = counts.get(n, 0) + 1

    return counts, n_flat, len(missing_ns), total


def plot_model(model):
    fig, axes = plt.subplots(1, len(PROMPT_TYPES), figsize=(18, 5.5))

    for ax, prompt_type in zip(axes, PROMPT_TYPES):
        counts, n_flat, n_missing, total = collect_counts(model, prompt_type)

        xs = sorted(counts)
        heights = [counts[x] for x in xs]
        colors = [TRUE_COLOR if x == TRUE_N else BAR_COLOR for x in xs]

        ax.bar([str(x) for x in xs], heights, color=colors, width=0.6, zorder=3)

        for x, h in zip(xs, heights):
            ax.text(str(x), h + 0.3, str(h), ha="center", va="bottom", fontsize=10, color=PRIMARY_INK)

        ax.set_xlabel("Grid size N with peak wall-rule F1", color=SECONDARY_INK)
        ax.set_ylabel(f"Number of samples (of {total})", color=SECONDARY_INK)
        ax.set_ylim(0, max(heights) + 3 if heights else 5)
        ax.grid(axis="y", color=GRIDLINE, linewidth=1, zorder=0)
        ax.set_axisbelow(True)
        ax.spines["top"].set_visible(False)
        ax.spines["right"].set_visible(False)
        ax.spines["left"].set_color(AXIS_LINE)
        ax.spines["bottom"].set_color(AXIS_LINE)
        ax.tick_params(colors=TICK_INK)

        annotation = f"true grid size = {TRUE_N} (green)\n{n_flat}/{total} samples: flat F1 across all N\n(generalizes or fails uniformly)"
        if n_missing:
            annotation += f"\n{n_missing}/{total} samples: missing F1 sweep"
        ax.text(0.03, 0.95, annotation, transform=ax.transAxes, ha="left", va="top",
                 fontsize=9, color=SECONDARY_INK, style="italic")

        ax.set_title(prompt_type, fontsize=13, fontweight="semibold", color=PRIMARY_INK)

    fig.suptitle(f"{model}: grid size with peak wall-rule F1, per sample", fontsize=15, fontweight="semibold", color=PRIMARY_INK)
    fig.tight_layout()

    slug = model.replace(".", "").replace("-", "_")
    out_path = f"{fig_dir_for(model)}/{slug}_hardcoded_n_hist.png"
    fig.savefig(out_path, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"Saved: {out_path}")


for model in MODELS:
    plot_model(model)
