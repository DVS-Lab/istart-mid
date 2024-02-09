# set working directory
setwd("~/Desktop")
maindir <- getwd()
datadir <- file.path("~/Desktop/")

# load packages
library("readxl")
library("ggplot2")
library("ggpubr")

# import data
data <- read_excel("~/Desktop/istart-mid_scatterplot.xlsx")

# Histogram of RS
histRS <- ggplot(data,aes(x=Composite_Reward)) + 
  geom_histogram() + scale_color_grey() + scale_fill_grey() + theme_classic() + #
  labs(x="Composite Reward Sensitivity (demeaned)",y="count") +
  xlim(-5,5)
histRS

# Histogram of VBeta
histRS <- ggplot(data,aes(x=VBeta_demean)) + 
  geom_histogram() + scale_color_grey() + scale_fill_grey() + theme_classic() +
  labs(x="VBeta (i.e., RT Fit; demeaned)",y="count")
histRS

# RS * VBeta
scatter <- ggplot(data,aes(x=Composite_Reward,y=VBeta_demean))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE, linetype="dashed", colour="gray")+
  labs(x="Composite Reward Sensitivity (demeaned)",y="VBeta (i.e., RT Fit; demeaned)")+
  stat_cor(method="pearson") +
  xlim(-5,5)
scatter + scale_color_grey() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                     panel.background = element_blank(), axis.line = element_line(colour = "black"))
