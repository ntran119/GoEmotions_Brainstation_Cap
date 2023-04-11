# server logic
server <- function(input, output) {
  
  output$model_chosen <- renderText( {
    paste0('Model: ', input$model_choice)
  })
  
  output$Plot_bar <- renderPlot({
    model <- input$model_choice
    
    dota_comments %>% 
      ggplot(aes(x = eval(parse(text = input$model_choice)))) +
      geom_bar(aes(y = (..count..)/sum(..count..), 
                   fill = factor(..x..))) +
      geom_text(aes(y = ((..count..)/sum(..count..)), 
                    label = scales::percent((..count..)/sum(..count..))), 
                    stat = "count", 
                    vjust = -0.25) +
      scale_y_continuous(labels = scales::percent) +
      theme(legend.position="none") +
      labs(x = 'Sentiment',
           y = 'Proportion',
           title = 'Proportion of Sentiment') +
      theme(plot.title = element_text(size=18)) +
      theme(axis.title.x=element_blank())
    
    })

  output$Plot_scatter <- renderPlotly({
    
    p <- dota_comments %>% 
          ggplot(aes(PCA1, PCA3,
                 color = as.factor(eval(parse(text = input$model_choice))), 
                 alpha = 0.5,
                 text = paste("Comment ID:", ID))) + 
      geom_point() +
      theme(legend.position="none") +
      labs(x = 'Component 1',
           y = 'Component 2',
           title = 'PCA Projection')
    
    ggplotly(p, tooltip = "text")
    
  })
  output$data_table <- renderDataTable(dota_comments %>% 
                                         select('ID', 'text', input$model_choice))
  }
