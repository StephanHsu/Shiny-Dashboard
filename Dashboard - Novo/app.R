library(shiny)
library(dplyr)

# shinyapp -> rascunho de um app shiny com o básico (ui + server)
ui <- fluidPage(

    mod_mtcars_UI("parte_mtcars"),
    mod_penguins_UI("parte_penguins")

)

server <- function(input, output, session) {

    mod_mtcars_server("parte_mtcars")
    mod_penguins_server("parte_penguins")
}

shinyApp(ui, server)
