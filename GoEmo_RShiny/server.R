# server logic
server <- function(input, output) {
  
  output$model_chosen <- renderText( {
    paste0('Model: ', input$model_choice)
  })
  
  output$Bar_graph <- renderPlot({
    
    dota_comments %>% ggplot(
      aes(x = eval(parse(text = input$model_choice)), fill = as.factor(eval(parse(text = input$model_choice))))) + geom_bar()
    
    })
  
  }
