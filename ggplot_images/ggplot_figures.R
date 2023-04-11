library(tidyverse)

df_simple <- read_csv("GoEmotions_Sentiment_simple.csv")


df_simple %>% 
  group_by(Sentiment) %>%
  summarize(Per = (n()/nrow(df_simple))*100) %>%
  ggplot(aes(Sentiment, Per, fill = as.factor(Sentiment))) + 
  geom_col() +
  geom_text(aes(label = paste(round(Per,1), '%'), vjust = -0.3)) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank() ) +
  scale_fill_discrete(name = "Sentiment", 
                      labels = c("Positive", "Neutral", "Negative", 'Ambiguous')) +
  labs(x = NULL,
       y = NULL,
       color=NULL,
       title = 'Balance of Sentiment')


df_simple %>% 
  filter(Sentiment < 3) %>%
  group_by(Sentiment) %>%
  summarize(Per = (n()/51683)*100) %>%
  ggplot(aes(Sentiment, Per, fill = as.factor(Sentiment))) + 
  geom_col() +
  geom_text(aes(label = paste(round(Per), '%'), vjust = -0.3)) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank() ) +
  scale_fill_discrete(name = "Sentiment", 
                      labels = c("Positive", "Neutral", "Negative")) +
  labs(x = NULL,
       y = NULL,
       color=NULL,
       title = 'Balance of Sentiment',
       subtitle = "Without Ambiguous Observations")


# read in data
dota_comments <- read_csv("dota_comments_BERT.csv")
dota_comments <- tibble::rowid_to_column(dota_comments, "ID")

# BERT graph
dota_comments %>% 
  ggplot(aes(x = BERT)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = factor(..x..))) +
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25) +
  scale_y_continuous(labels = scales::percent) +
  theme(legend.position="none") +
  labs(x = 'Sentiment',
       y = 'Proportion',
       title = 'Proportion of Sentiment')


# LogReg graph
dota_comments %>% 
  ggplot(aes(x = Logistic_regression)) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill = factor(..x..))) +
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25) +
  scale_y_continuous(labels = scales::percent) +
  theme(legend.position="none") +
  labs(x = 'Sentiment',
       y = 'Proportion',
       title = 'Proportion of Sentiment')