#' data_df UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_data_df_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' data_df Server Function
#'
#' @noRd 
mod_data_df_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_data_df_ui("data_df_ui_1")
    
## To be copied in the server
# callModule(mod_data_df_server, "data_df_ui_1")
 
