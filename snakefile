configfile: "config.yaml"

SAMPLES = config["samples"]

rule all:
    input:
        expand("plots/pandas_plot_{n}.png", n=SAMPLES)


rule make_csv:
    output:
        "data/pandas_out_{n}.csv"
    conda:
        "envs/py.yml"
    shell:
        "python scripts/make_data.py --N {wildcards.n} --out {output}"


rule plot_png:
    input:
        "data/pandas_out_{n}.csv"
    output:
        "plots/pandas_plot_{n}.png"
    conda:
        "envs/r.yml"
    shell:
        "Rscript scripts/plot_data.R {input} {output}"