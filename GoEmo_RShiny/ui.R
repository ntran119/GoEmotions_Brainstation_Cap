# UI
ui <-  fluidPage(    
    
    # Give the page a title
    titlePanel("Classification Models"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("model_choice", "Model:", 
                    choices=c('logpred', "SVM_pred", "DT_pred",  "KNN_pred"),
                    selected = 'DiH-2'
      )),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("Bar_graph")  
      )
      
    )
  )