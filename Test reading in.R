setwd("~/Documents/Haplotypes Lab Project/Junk/TestHaps")

install.packages("reshape")

require("haplotypes")
require("bioconductor")

test2<-import("PCR product of COXII.fasta") #somehow read in file

summary(test2)

test3<-as.data.frame.data.frame(test2)
head(test3)

as.matrix(test2)

#infer haplotypes
h<-haplotypes::haplotype(test2,indels="m")

# length(h) gives the total number of haplotypes #
length(h)
#no direct method is available for calculating haplotype diversity in the current version. However you can calculate it as follows:
#suppose 'pops' gives the populations where samples are collected.
pops<-c("pop1","pop1","pop2","pop3")
g<-grouping(h, pops)
sz<-apply(g$hapmat,2,sum)
# hdiv gives the total haplotype diversity #
hdiv<-(sum(sz)/(sum(sz)-1))*(1-sum((sz/sum(sz))^2))
hdiv