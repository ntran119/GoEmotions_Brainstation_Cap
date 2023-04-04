library(tidyverse)

df <- read_csv("GitHub/GoEmotions_Brainstation_Cap/GoEmotions_cleaned_ekman.csv")

df_simple <- read_csv("GitHub/GoEmotions_Brainstation_Cap/GoEmotions_Sentiment_simple.csv")


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

# count without ambiguous observations
df_simple %>% 
  filter(Sentiment < 3) %>%
  count()
