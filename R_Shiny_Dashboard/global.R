# import libraries
library(shiny)
library(tidyverse)
library(plotly)

# read in data
dota_comments <- read_csv("www/dota_comments_BERT.csv")
dota_comments <- tibble::rowid_to_column(dota_comments, "ID")
