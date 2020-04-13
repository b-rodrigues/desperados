#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_plot_of_data_server, "plot_of_data_ui_1")
  callModule(mod_data_df_server, "data_df_ui_1")
}
