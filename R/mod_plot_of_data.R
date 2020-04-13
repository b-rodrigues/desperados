#' plot_of_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#' @importFrom dygraphs dygraphOutput renderDygraph
#' @importFrom shiny NS tagList
#' @importFrom echarts4r echarts4rOutput
mod_plot_of_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(title = "Controls",
        sliderInput(ns("slider"), "Number of obs:", 1,500,100),
        width = 2 ),
    box(echarts4rOutput(ns("my_histogram")))
)
}

#' plot_of_data Server Function
#' @importFrom shinipsum random_ggplot random_dygraph
#' @importFrom dygraphs dygraph renderDygraph
#' @importFrom dplyr mutate count sample_n
#' @importFrom tidyr pivot_wider
#' @importFrom forcats fct_lump
#' @importFrom echarts4r renderEcharts4r e_charts e_bar
#' @noRd
mod_plot_of_data_server <- function(input, output, session){
  ns <- session$ns
  gss_cat <- forcats::gss_cat

  counts_marital_race <- reactive({
      gss_cat %>%
      sample_n(size =  as.numeric(input$slider)) %>%
      mutate(marital = fct_lump(marital, prop = 0.1)) %>%
      count(marital, race)
  })

  output$my_histogram <- renderEcharts4r({
    #trash <- c(input$slider)
    counts_marital_race() %>%
                           pivot_wider(names_from = race, values_from = n) %>%
                           e_charts(marital) %>%
                           e_bar(Other, stack = "grp") %>%
                           e_bar(Black, stack = "grp") %>%
                           e_bar(White, stack = "grp")
      #random_dygraph("histogram")
      })
}

## To be copied in the UI
# mod_plot_of_data_ui("plot_of_data_ui_1")

## To be copied in the server
# callModule(mod_plot_of_data_server, "plot_of_data_ui_1")



