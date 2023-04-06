# UI
ui <-  fluidPage(    
    
    # Give the page a title
    titlePanel("Classification Models"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("model_choice", "Choose a Model:", 
                    choices=c("Logistic_Regression","SVM","Decision_Tree","KNN",'BERT'),
                    selected = 'Logistic_Regression'
      )),
      
      # Create a spot for the barplot
      mainPanel(
        splitLayout(cellWidths = c("50%", "50%"), 
                    plotOutput("Plot_bar"), 
                    plotlyOutput("Plot_scatter")),
        dataTableOutput('data_table')
      
      )# end of mainpanel
    ) # end of sidebarlayout
) # end of fluidpage