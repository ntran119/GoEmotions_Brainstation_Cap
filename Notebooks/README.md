Notebooks for Data Processing and Modeling
- These notebooks display my AGILE approach for building and optimizing a language model

The order of notebooks:

GoEmo_Week1_Wrangling.ipynb
- Exploring/cleaning the raw dataset to prepare it for modeling purposes

GoEmo_Week1_BaselineModel.ipynb
- Creating a simple sentiment model of Positive vs Non-positive comments
- Observed most frequently used words with bag-of-words model

GoEmo_Week2_Multiclass.ipynb
- Tested different word vectorizors (TF-IDF/Ngrams)
- Optimized C for baseline model
- Tried Multiclass Classification and Dimentionality Reduction

GoEmo_Week2_RedditScraper.ipynb
- Scraping Reddit comments to test model sentiment predictions
- https://www.reddit.com/r/DotA2/comments/11kh9ru/the_dead_reckoning_update_hola_muerta_gameplay/

GoEmo_Week3_ Optimization.ipynb
- Logistic Regression hyperparameter optimization for multiclass model
- Advanced metrics of multiclass model (precision/recall)
- Baseline model predictions of scraped Reddit comments

GoEmo_Week4_GridSearch.ipynb
- Optimized classification models using GridSearch
- Optimized model predictions of scraped Reddit comments

GoEmo_Week5_HuggingFace.ipynb
- Utilized a pre-trained BERT model for sentiment predictions
- nlptown/bert-base-multilingual-uncased-sentiment
