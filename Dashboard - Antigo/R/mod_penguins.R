library(shiny)

# shinymod -> rascunho de um módulo shiny com o básico - Jeito antigo
mod_penguins_UI <- function(id) {

  ns <- NS(id)

  vars_num <- palmerpenguins::penguins %>%
    select(where(is.numeric)) %>%
    names()

  tagList(
    h1("Base penguins"),
    fluidRow(
      column(
        width = 4,
        selectInput(
          inputId = ns("variavel"),
          label = "Selecione uma variável",
          choices = vars_num
        )
      ),
      column(
        width = 8,
        plotOutput(ns("grafico"))
      )
    )
  )
}

mod_penguins_server <- function(input, output, session) {


  output$grafico <- renderPlot({

    hist(palmerpenguins::penguins[,input$variavel,
                                  drop = TRUE])

  })

}
