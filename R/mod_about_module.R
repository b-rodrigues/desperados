#' about_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_about_module_ui <- function(id){
  ns <- NS(id)
  tagList(
      h2("A Random Text"),
      tableOutput(ns("text"))
  )
}

#' about_module Server Function
#'
#' @noRd
mod_about_module_server <- function(input, output, session){
  ns <- session$ns
  output$text <- renderText({
      shinipsum::random_text(nwords = 50)
  })
}

## To be copied in the UI
# mod_about_module_ui("about_module_ui_1")

## To be copied in the server
# callModule(mod_about_module_server, "about_module_ui_1")

