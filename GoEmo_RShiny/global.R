# import libraries
library(shiny)
library(tidyverse)
library(plotly)

# set to current directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# read in data
dota_comments <- read_csv("dota_comments.csv")
dota_comments <- tibble::rowid_to_column(dota_comments, "ID")

dota_comments %>% 
  ggplot(aes(PCA1, PCA3,
             color = as.factor(Logistic_Regression),
             alpha = 0.5)) + 
  geom_point()


dota_comments %>% ggplot(
  aes(x = Logistic_Regression)) + 
  geom_bar(aes(y= ..prop.., fill = factor(..x..)), stat= "count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  theme(legend.position="none")+
  scale_y_continuous(labels = scales::percent)
