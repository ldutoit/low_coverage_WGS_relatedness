## Working pipeline 

This document is meant as a rough guide to estimating relatedness in a population using low-coverage whole-genome resequencing data. After outlining the issue with low coverage, I provide the reader with common solutions and examples of the classis coutputs of those existing pipelines.

Low-coverage whole-genome resequencing data is quickly becoming popular in evolutionary genomics, maximising the maximum number of individuals that can be sequenced by spreading sequencing efforts over as many individuals as possible ((Lou et al., 2021)[https://onlinelibrary.wiley.com/doi/full/10.1111/mec.16077?casa_token=45yrJURA9_sAAAAA%3ATtiPTr-hOKZK3rsfwuRqpQhT__4TWP-EL6_zP_nZVx8yf7lU9-QG2Kwj85wpit2RzBkV6n5wFDuduVaeYg])
This approach has considerable merit. Ultimately, the first read covering a specific genomic location always provides the most information about the genotype. The subsequent reads can only confirm the information provided by the first read, uncover a polymorphism, or, much more rarely, reveal a sequencing error.

Yet, there are issues with low coverage data. Importantly, it is possible to miss  alleles. In conservation, that is a key issue to estimate inbreeding as missing alleles lead to overestimating homozygosity and inbreeding. From a relatedness point of view,  missing alleles leads to understimating allele sharing and relatedness



These problem only exists because we assume the assigned genotype is true after doing some filtering. If we account for the uncertainty in the genotype, then we can easily obtain much better estimates of relatedness.

Fortunately, pipeline working with genotypes likelihood instead of assigned genotypes are implemented in the ANGSD software (CIT) and the attached NGSRelate...

Those estimates can also be computed.

