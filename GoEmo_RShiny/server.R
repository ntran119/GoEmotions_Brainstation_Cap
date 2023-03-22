# server logic
server <- function(input, output) {
  
  output$model_chosen <- renderText( {
    paste0('Model: ', input$model_choice)
  })
  
  output$Plot_bar <- renderPlot({
    model <- input$model_choice
    
    dota_comments %>% 
      ggplot(
      aes(x = eval(parse(text = input$model_choice)))) + 
      geom_bar(aes(y= ..prop.., fill = factor(..x..)), stat= "count") +
      geom_text(aes( label = scales::percent(..prop..),
                     y= ..prop.. ), 
                stat= "count", vjust = -.5) +
      theme(legend.position="none") +
      scale_y_continuous(labels = scales::percent)
    
    })

  output$Plot_scatter <- renderPlotly({
    
    p <- dota_comments %>% 
          ggplot(aes(PCA1, PCA3,
                 color = as.factor(eval(parse(text = input$model_choice))), 
                 alpha = 0.5,
                 text = paste("Comment ID:", ID))) + 
      geom_point() +
      theme(legend.position="none")
    
    ggplotly(p, tooltip = "text")
    
  })
  output$data_table <- renderDataTable(dota_comments %>% 
                                         select('ID', 'text', input$model_choice))
  }
