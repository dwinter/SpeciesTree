
#library("rentrez")
#NCBI = c(Epichloe_taxa$rep_seq)
#identity = Epichloe_taxa$tag_name
#all_recs <- entrez_fetch(db="nuccore", id = Epichloe_taxa$rep_seq, rettype="fasta", stringsAsFactors=FALSE)
#class(all_recs)
#cat(strwrap(substr(all_recs, 1, 500)), sep="\n")
#write(all_recs, file="unaligned.fasta")


library(ggplot2)
library(ggtree)
library(ape)


tree <- read.tree("RAxML_bestTree.tree")
plot.phylo(tree)
rooted_tree <- root(tree, "JX083460.1")
name_map <- c(L78276.1="glyceriae", 
              L78290.1="bromicola", 
              AF250743.1="elymi", 
              GQ421707.1="sibirica", 
              EF422757.1="ganuensis", 
              AF457494.1="ganuensis_inebrian", 
              JX083460.1="C_purpurea", 
              L78271.1="brachyelyti", 
              AF323371.1="aotearoae", 
              AF250757.1="typhina_poae", 
              AF176266.1="typhina_poae_canariensis", 
              AY707694.1="typhina_poae_aonikenkana", 
              AF457493.1="typhina_poae_huerfana", 
              KC936108.1="sylvatica_sylvatica", 
              L78281.1="typhina_clarkii", 
              L78288.1="typhina_typhina", 
              JF718439.1="sylvatica_pollinensis", 
              L06961.1="baconii", 
              EU526824.1="stromatolonga", 
              KC936144.1="festucae_lolli", 
              L06955.1="festucae", 
              AF457469.1="mollis", 
              L06958.1="amarillans")
tree$tip.labels <-  name_map[tree$tiplabels]
plot.phylo(rooted_tree, x.lim = 0.6)
#tiplabels(new_names, adj = c(-0.1), frame = "none")

#updated <- drop.tip(rooted_tree, tip = "JX083460.1")
#plot.phylo(updated, show.tip.label = FALSE, x.lim = 0.6)
#tiplabels(new_names, adj = c(-0.1), frame = "none")
#not liking the drop.tip labels




"""
old code

d1 = tree$tip.label
d2 = tipnames$Code

new_names<-d2[match(tree$tip.label, d1)]
tree$tip.label <- as.character(new_names)
print(tree$tip.label)
need as characters for plotting but won't let me do this function with character vector ahhhh

old_names <- as.character(tipnames$x)
name_map <- c(tipnames$x = as.character(tipnames$Code))

"""
