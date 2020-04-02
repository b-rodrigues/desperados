#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function() {
    tagList(
        # Leave this function for adding external resources
        golem_add_external_resources(),
        # List the first level UI elements here
        tagList(
            nav_(
                "#TidyTuesday 2019-10-15",
                c(
                    "disclaimer_module" = "Disclaimer",
                    "graph_module" = "Visualisation",
                    "about_module" = "About"
                )
            )
            ,
            tags$div(
                class="container",
                fluidRow(
                    id = "disclaimer_module",  mod_disclaimer_module_ui("disclaimer_module_ui_1")
                ) %>% tagAppendAttributes(
                    style = "display:none"
                ),
                fluidRow(
                    id = "graph_module",  mod_graph_module_ui("graph_module_ui_1")
                ) %>% tagAppendAttributes(
                    style = "display:none"
                ),
                fluidRow(
                    id = "about_module", mod_about_module_ui("about_module_ui_1")
                ) %>% tagAppendAttributes(
                    style = "display:none"
                )
            )

        )
    )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'desperados'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

