## A quick guide to estimating relatedness from low-coverage WGS data

### Objective 

This document serves as a very quick guide to estimating relatedness in a population using low-coverage whole-genome resequencing data. After outlining the main issue with low coverage in the context of relatedness estimation, I provide two solutions and examples of the classic outputs of those existing pipelines. The code used to generate the figures is provided, yet they  are intended as conceptual illustrations and do not represent empirical data. 

### Introduction

Low-coverage whole-genome resequencing data is quickly becoming popular in evolutionary genomics, maximising the maximum number of individuals that can be sequenced by spreading sequencing output over as many individuals as possible, reducing the costs ([Lou et al., 2021](https://onlinelibrary.wiley.com/doi/full/10.1111/mec.16077?casa_token=45yrJURA9_sAAAAA%3ATtiPTr-hOKZK3rsfwuRqpQhT__4TWP-EL6_zP_nZVx8yf7lU9-QG2Kwj85wpit2RzBkV6n5wFDuduVaeYg)).

This approach has considerable merit. Ultimately, the first read covering a specific genomic location provides the most information about the genotype at a single position. The subsequent reads can only confirm the information provided by the first read, uncover a polymorphism, or, much more rarely, reveal a sequencing error.

....

### The issue

Low-coverage sequencing yields less information per genomic location within an individual. The primary issue with low-coverage sequencing data is that it is possible to miss alleles, as genotypes are only informed by a limited number of reads at each position. 

One read only carries one allele. At a depth of one, a heterozygote position cannot be identified, and all heterozygotes are missed. At a depth of two, half of the heterozygous position samples display the same allele twice. In our quick sampling [simulations](missingalleles.R), assuming random sampling and no sequencing errors, heterozygous positions have a 6.3% chance of being missed at a depth of 5 and only a 0.2% chance at a depth of 10. 



<p align="center">
  <img width="515" height="350" alt="missingalleles"
       src="https://github.com/user-attachments/assets/bed1857e-2d4b-4308-96cc-19a5e9f42fa1" />
</p>


In conservation, this is a key issue to consider, as missing alleles can lead to overestimating homozygosity and inbreeding, leading to a spurious relationship between individual coverage and inbreeding. In the conceptual visualisation below, individuals with less coverage are inferred to have more inbreeding as more heterozygotes are missed.


<p align="center">

  <img width="515" height="350" alt="corcoverageinbreeding" src="https://github.com/user-attachments/assets/c8585607-c961-4930-a283-2524f0bc9ef1" />

</p>


### The solution(s)


These problems only exist because we assume the assigned genotypes are true after doing some. Filtering low-coverage positions is one way to avoid genotyping errors. The visualisation below shows what happens when filtering out low-overage positions in an individual sequenced at an average coverage of 5 and another at a mean coverage of 20.  While filtering out reads with fewer than 8-10 reads might provide datasets with high confidence in the genotypes, it discards a significant amount of information in low-coverage datasets.
<p align="center">
  
  <img width="515" height="350" alt="image" src="https://github.com/user-attachments/assets/8c305955-f231-4fd1-949d-1aa079b02064" />

</p>


We saw earlier that even with a handful of reads, we already have a lot of information about the genotype. If we account for the uncertainty in the genotype, then we can easily obtain much better estimates of relatedness.

Fortunately, pipelines working with genotype likelihood instead of assigned genotypes are implemented in the [ANGSD](https://www.popgen.dk/angsd/index.php/ANGSD) software ([Korneliussen et al., 2014](https://link.springer.com/article/10.1186/s12859-014-0356-4)) and the attached [NGSRelate](https://github.com/ANGSD/NgsRelate) package. ([Korneliussen et al., 2014](https://academic.oup.com/bioinformatics/article/31/24/4009/198242?login=false)). 

The key idea...

Those estimates can also be computed.

### Outputs

Outputs... stats... heatmap, network... correlates..

