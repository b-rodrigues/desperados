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
    box(title = "Model",
        radioButtons(ns("model"), "Choose model to run", c("Linear Regression", "Gamma Model")),
        width = 2 ),
    box(title = "Result",
        DT::dataTableOutput(ns("my_model")),
        width = 5)
  )
}

#' data_df Server Function
#'
#' @noRd
mod_data_df_server <- function(input, output, session){
    ns <- session$ns
    chosen_model_fun <- reactive({
      if(input$model == "Linear Regression"){
        lm(formula = mpg ~ hp + cyl, data = mtcars)
      } else {
        glm(formula = mpg ~ hp + cyl, data = mtcars, family = Gamma(link = "log"))
      }
    })

  output$my_model <- DT::renderDataTable({
      #shinipsum::random_DT(ncol = 4, nrow = 199)
    DT::datatable(broom::tidy(chosen_model_fun()), extensions = "Responsive")
  })
}

## To be copied in the UI
# mod_data_df_ui("data_df_ui_1")

## To be copied in the server
# callModule(mod_data_df_server, "data_df_ui_1")

