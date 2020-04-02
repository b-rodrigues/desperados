#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_disclaimer_module_server, "disclaimer_module_ui_1")
  callModule(mod_about_module_server, "about_module_ui_1")
  callModule(mod_graph_module_server, "graph_module_ui_1")
}
