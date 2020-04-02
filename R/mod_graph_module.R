#' graph_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_graph_module_ui <- function(id){
  ns <- NS(id)
  tagList(
      h2("A Random Plot"),
      plotOutput(ns("plot"))
  )
}

#' graph_module Server Function
#'
#' @noRd
mod_graph_module_server <- function(input, output, session){
  ns <- session$ns
  output$plot <- renderPlot({
      shinipsum::random_ggplot()
  })
}

## To be copied in the UI
# mod_graph_module_ui("graph_module_ui_1")

## To be copied in the server
# callModule(mod_graph_module_server, "graph_module_ui_1")

