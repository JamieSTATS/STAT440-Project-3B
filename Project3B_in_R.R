library(corrplot)
library(reshape2)
library(ggplot2)


X_merged <- read.csv('Xraw_clean.csv', header=TRUE)
M<-cor(X_merged, use= 'complete.obs')

#http://www.sthda.com/english/wiki/ggplot2-quick-correlation-matrix-heatmap-r-software-and-data-visualization
#https://www.datanovia.com/en/blog/ggplot-axis-labels/

melted_M <- melt(M)
head(melted_M)

Mplot <-ggplot(data = melted_M, aes( x=Var1, y=Var2, fill=value)) +geom_tile() 
  
Mplot + theme(axis.title.x = element_blank())
#ggsave(filename= 'Corrplot.png', plot = M_plot, device='png', res = 300 )