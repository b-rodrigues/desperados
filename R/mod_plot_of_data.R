#' plot_of_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @importFrom dygraphs dygraphOutput renderDygraph
#' @importFrom shiny NS tagList
mod_plot_of_data_ui <- function(id){
  ns <- NS(id)
tagList(
#h2("My random histogram"),
#dygraphOutput(ns("my_histogram"))
box(title = "Controls",
    sliderInput(ns("slider"), "Number of obs:", 1,500,100),
    width = 2 ),
box(dygraphOutput(ns("my_histogram")))
)
}

#' plot_of_data Server Function
#' @importFrom shinipsum random_ggplot random_dygraph
#' @importFrom dygraphs dygraph renderDygraph
#' @noRd
mod_plot_of_data_server <- function(input, output, session){
  ns <- session$ns
  output$my_histogram <- renderDygraph({
      trash <- c(input$slider)
      random_dygraph("histogram")
      })
}

## To be copied in the UI
# mod_plot_of_data_ui("plot_of_data_ui_1")

## To be copied in the server
# callModule(mod_plot_of_data_server, "plot_of_data_ui_1")

