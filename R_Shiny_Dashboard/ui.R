
ui <- navbarPage(
  title = 'GoEmotions Sentiment Prediction',
  tabPanel(title = 'Description',
           h1('About this App'),
           p('I have developed this dashboard to demonstrate my sentiment classification models. 
             These models were trained on the Goemotions dataset provided by Google, which consists of carefully selected Reddit comments that were manually labeled for 27 distinct emotions.'),
           br(),
           p('Training data was vectorized using TF-IDF and optimized models were used to predict sentiment on scraped Reddit data. 
           Comments were scraped from the Dota2 subreddit (patch 7.32e) : https://www.reddit.com/r/DotA2/comments/11kh9ru/the_dead_reckoning_update_hola_muerta_gameplay/.'),
           br(),
           p('Sentiment predictions are used to understand the communities reaction to new the gameplay changes. A pre-trained BERT model from hugging-face was also included: https://huggingface.co/nlptown/bert-base-multilingual-uncased-sentiment'),
           br(),
           p('To view how the models were trained you can visit the repository: https://github.com/ntran119/GoEmotions_Brainstation_Cap')),
  
  tabPanel(
    title = "Classification Models",
           
           # Generate a row with a sidebar
           sidebarLayout(      
             
             # Define the sidebar with one input
             sidebarPanel(
               selectInput("model_choice", "Choose a Model:", 
                           choices=c("Logistic_Regression","SVM","Decision_Tree","KNN",'BERT'),
                           selected = 'Logistic_Regression'
               )),
             
             # Create a spot for the barplot/scatter plot and table
             mainPanel(
               splitLayout(cellWidths = c("50%", "50%"), 
                           plotOutput("Plot_bar"), 
                           plotlyOutput("Plot_scatter")),
               dataTableOutput('data_table')
               
             )# end of mainpanel
           ) # end of sidebarlayout
  )) # end of navbarpage