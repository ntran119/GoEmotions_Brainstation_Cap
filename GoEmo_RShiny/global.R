# import libraries
library(shiny)
library(tidyverse)
library(plotly)

# set to current directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# read in data
dota_comments <- read_csv("dota_comments_BERT.csv")
dota_comments <- tibble::rowid_to_column(dota_comments, "ID")

dota_comments %>% 
  ggplot(aes(PCA1, PCA3,
             color = as.factor(Logistic_Regression),
             alpha = 0.5)) + 
  geom_point()

dota_comments %>% 
  ggplot(aes(x = BERT)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = factor(..x..))) +
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25) +
  scale_y_continuous(labels = scales::percent) +
  theme(legend.position="none") +
  labs(x = 'Sentiment',
       y = 'Proportion',
       title = 'Proportion of Sentiment')


dota_comments %>% 
  ggplot(
    aes(x = eval(parse(text = input$model_choice)))) + 
  geom_bar(aes(y= ..prop.., fill = factor(..x..)), stat= "count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), 
            stat= "count", vjust = -.5) +
  theme(legend.position="none") +
  scale_y_continuous(labels = scales::percent) +
  labs(x = 'Sentiment',
       y = 'Proportion')
