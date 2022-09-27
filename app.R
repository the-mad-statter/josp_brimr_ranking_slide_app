library(shiny)

shinyApp(
  ui = fluidPage(
    selectInput(
      "year",
      "Year",
      max(josp::brimr_table_3$year):(min(josp::brimr_table_3$year) + 1)
    ),
    downloadButton("slide", "Generate Slide")
  ),
  
  server = function(input, output) {
    output$slide <- downloadHandler(
      filename = function() { sprintf("BRIMR_Department_Rankings_%s.pptx", input$year) },
      
      content = function(file) {
        josp::brimr_ranking_slide(as.numeric(input$year), file)
      },
      
      contentType = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    )
  }
)
