#' plot_of_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_plot_of_data_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' plot_of_data Server Function
#'
#' @noRd 
mod_plot_of_data_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_plot_of_data_ui("plot_of_data_ui_1")
    
## To be copied in the server
# callModule(mod_plot_of_data_server, "plot_of_data_ui_1")
 
