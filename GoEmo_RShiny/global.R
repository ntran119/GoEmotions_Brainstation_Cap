# import libraries
library(shiny)
library(tidyverse)

# set to current directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# read in data
dota_comments <- read_csv("dota_comments.csv")


dota_comments %>% ggplot(
                          aes(
                            x = eval(parse(text = 'logpred')), )) + 
                    geom_bar()


dota_comments %>% 
  group_by(logpred) %>% 
  summarize(n()) %>% 
  ggplot(aes(logpred, `n()`, fill= as.factor(logpred))) + geom_col()


colnames(dota_comments)


dota_comments %>% ggplot(
  aes(x = eval(parse(text = input$model_choice)), color = eval(parse(text = input$model_choice)))) + geom_bar()
