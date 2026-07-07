import re
import matplotlib.pyplot as plt

FIG_DIR = "UROP/pipeline/results/small_llm_results/figures"
TRUE_N = 8  # actual grid size of the percept log shown to the model

GRIDLINE = "#e1e0d9"
AXIS_LINE = "#c3c2b7"
TICK_INK = "#898781"
SECONDARY_INK = "#52514e"
PRIMARY_INK = "#0b0b0b"
BAR_COLOR = "#2a78d6"
TRUE_COLOR = "#0ca30c"

MODELS = ["gemma3-4b", "qwen2.5-3b"]


def analyze_model(model):
    pl_dir = f"UROP/pipeline/prolog/result/{model}/schema-based"
    literal_ns = []
    no_literal = []

    for n in range(1, 21):
        path = f"{pl_dir}/schema_based_sample_{n}.pl"
        with open(path) as f:
            text = f.read()
        match = re.search(r"grid_size\((\d+)\)", text)
        if match:
            literal_ns.append(int(match.group(1)))
        else:
            no_literal.append(n)

    print(f"\n=== {model} ===")
    print("Literal grid_size(N) values found:", sorted(literal_ns))
    print(f"No literal constant (unbound/parameterized): samples {no_literal}")

    counts = {}
    for n in literal_ns:
        counts[n] = counts.get(n, 0) + 1

    xs = sorted(counts)
    heights = [counts[x] for x in xs]
    colors = [TRUE_COLOR if x == TRUE_N else BAR_COLOR for x in xs]

    fig, ax = plt.subplots(figsize=(8, 5.5))
    ax.bar([str(x) for x in xs], heights, color=colors, width=0.6, zorder=3)

    for x, h in zip(xs, heights):
        ax.text(str(x), h + 0.3, str(h), ha="center", va="bottom", fontsize=10, color=PRIMARY_INK)

    ax.set_xlabel("Hardcoded literal grid_size(N) value", color=SECONDARY_INK)
    ax.set_ylabel("Number of samples (of 20)", color=SECONDARY_INK)
    ax.set_ylim(0, max(heights) + 3 if heights else 5)
    ax.grid(axis="y", color=GRIDLINE, linewidth=1, zorder=0)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color(AXIS_LINE)
    ax.spines["bottom"].set_color(AXIS_LINE)
    ax.tick_params(colors=TICK_INK)

    ax.text(0.03, 0.95, f"true grid size = {TRUE_N} (green)\n{len(no_literal)}/20 samples: no literal constant\n(unbound N or fully parameterized)",
            transform=ax.transAxes, ha="left", va="top", fontsize=9, color=SECONDARY_INK, style="italic")

    ax.set_title(f"{model} (schema-based): hardcoded grid_size(N) per sample",
                 fontsize=13, fontweight="semibold", color=PRIMARY_INK, wrap=True)
    fig.tight_layout()

    slug = model.replace(".", "").replace("-", "_")
    out_path = f"{FIG_DIR}/{slug}_schema_hardcoded_n_hist.png"
    fig.savefig(out_path, dpi=150, bbox_inches="tight")
    plt.close(fig)
    print(f"Saved: {out_path}")


for model in MODELS:
    analyze_model(model)
