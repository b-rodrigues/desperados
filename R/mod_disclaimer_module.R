#' disclaimer_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_disclaimer_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    h3(textOutput("this is the text from the disclaimer module"))
 
  )
}
    
#' disclaimer_module Server Function
#'
#' @noRd 
mod_disclaimer_module_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_disclaimer_module_ui("disclaimer_module_ui_1")
    
## To be copied in the server
# callModule(mod_disclaimer_module_server, "disclaimer_module_ui_1")
 
