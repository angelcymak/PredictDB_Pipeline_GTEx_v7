setwd("/group/im-lab/nas40t2/scott/gtex_v7_imputed_europeans/model_training/scripts/")
source("gtex_v7_nested_cv_elnet.R")
"%&%" <- function(a,b) paste(a,b, sep='')

argv <- commandArgs(trailingOnly = TRUE)
tiss <- argv[1]
chrom <- argv[2]
rundir <- argv[3]

snp_annot_file <-  rundir %&% "/prepare_data/genotype/genotype.anno." %&% chrom %&% ".txt"
gene_annot_file <- rundir %&% "/prepare_data/expression/gencode.v19.genes.patched_contigs.parsed.txt"
genotype_file <- rundir %&% "/prepare_data/genotype/genotype." %&% chrom %&% ".txt.gz"
expression_file <- rundir %&% "/prepare_data/expression/" %&% tiss %&% "_Analysis.expression.txt"
covariates_file <- rundir %&% "/prepare_data/covariates/" %&% tiss %&% "_Analysis.combined_covariates.txt"
prefix <- tiss %&% "_nested_cv"

main(snp_annot_file, gene_annot_file, genotype_file, expression_file, covariates_file, as.numeric(chrom), prefix, null_testing=FALSE)


