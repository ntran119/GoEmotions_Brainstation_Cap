
ui <- navbarPage(
  title = 'GoEmotions Sentiment',
  tabPanel(title = 'Description',
           h2('About this App'),
           p('This dashboard was developed to showcase my sentiment classification models. 
           The language models were trained using the Goemotions dataset from Google. 
           This is a dataset of curated Reddit comments that were manually annotated for 27 emotions.'),
           br(),
           p('The models trained were used for sentiment analysis on scraped Reddit data. 
           The Reddit comments were scraped from a post for Dota2 patch 7.32e : https://www.reddit.com/r/DotA2/comments/11kh9ru/the_dead_reckoning_update_hola_muerta_gameplay/. 
           Sentiment predictions were used to understand the communities reaction to the gameplay changes'),
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