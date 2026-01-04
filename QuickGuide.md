## Working pipeline 

### Objective 

This document serves as a very quick guide to estimating relatedness in a population using low-coverage whole-genome resequencing data. After outlining the main issue with low coverage in the context of relatedness estimation, I provide the reader with common solutions and examples of the classic outputs of those existing pipelines. The code used to generate the figure is provided. The figures are intended as conceptual illustrations and do not represent empirical data. GLOSSARY

### Introduction

Low-coverage whole-genome resequencing data is quickly becoming popular in evolutionary genomics, maximising the maximum number of individuals that can be sequenced by spreading sequencing efforts over as many individuals as possible, reducing the costs ([Lou et al., 2021](https://onlinelibrary.wiley.com/doi/full/10.1111/mec.16077?casa_token=45yrJURA9_sAAAAA%3ATtiPTr-hOKZK3rsfwuRqpQhT__4TWP-EL6_zP_nZVx8yf7lU9-QG2Kwj85wpit2RzBkV6n5wFDuduVaeYg)).

This approach has considerable merit. Ultimately, the first read covering a specific genomic location always provides the most information about the genotype at a single position. The subsequent reads can only confirm the information provided by the first read, uncover a polymorphism, or, much more rarely, reveal a sequencing error.

### The issue

The primary issue with low-coverage sequencing data is that it is possible to miss alleles, as genotypes are only informed by a few reads at each position.

...

One read only carries one allele. At a depth of one, a heterozygote position cannot be identified, and all heterozygotes are missed. At a depth of two, half of the heterozygous position samples display the same allele twice. In our simulations, assuming random sampling and no sequencing errors, alleles have a 6.3% chance of being missed at a depth of 5 and only a 0.2% chance at a depth of 10. 

In conservation, this is a key issue to consider in conservation, as missing alleles can lead to overestimating homozygosity and inbreeding. From a relatedness point of view,  missing alleles lead to underestimating allele sharing and relatedness

...

### The solution(s)


These problem only exists because we assume the assigned genotype is true after doing some filtering. The quick simulation above shows that filtering out positions with fewer than 8-10 reads might provide datasets with high confidence in the genotypes. In large genomes or polymorphic species, this approach may be effective, but it discards a significant amount of information in low-coverage datasets.

...

We saw earlier that even with a few reads, we already have a lot of information about the genotype. If we account for the uncertainty in the genotype, then we can easily obtain much better estimates of relatedness.

Fortunately, pipelines working with genotype likelihood instead of assigned genotypes are implemented in the ANGSD software (CIT) and the attached NGSRelate (CIT).

The key idea...

Those estimates can also be computed.

### 

Outputs... stats... heatmap, network... correlates..

