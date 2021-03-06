# The main entry point of your workflow.
# After configuring, running snakemake -n in a clone of this repository should successfully execute a dry-run of the workflow.
import pandas as pd

configfile: "config.yaml"

samples = pd.read_table(config["samples"], index_col="sample")

rule all:
	input:
	# The first rule should define the default target files
	# Subsequent target rules can be specified below. They should start with all_*.
		config["folders"]["output_folder"] + "/sleuth_output.tsv"
		


include: "rules/sleuth.smk"
include: "rules/formats.smk"
include: "rules/trim.smk"
include: "rules/kallisto.smk"
