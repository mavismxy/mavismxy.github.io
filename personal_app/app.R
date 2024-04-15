library(shiny)

library(tidyverse)
library(readxl)

project_data <- read_excel("data.xlsx", sheet = 2)


# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("US Inflation Rate"),
  sidebarLayout(
    sidebarPanel(
      p("text on sidebar"),
      sliderInput("year_data",
                  label = "Year Input:",
                  min = 2016, 
                  max = 2024,
                  sep = "",
                  value = 2020),
      selectInput("input1", "Choose colour: ",
                  choices = c("red", "blue", "white"))
    ),
    mainPanel(
      h1("US Inflation Rate Year-on-Year"),
      p("text on main panel"),
      plotOutput("inflation_data")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$inflation_data <- renderPlot({
    project_data %>%
      filter(Year == input$year_data) %>%
      mutate(Month = as.factor(Month)) %>%
    ggplot() + geom_col(aes(x = Month, y = Inflation, fill = Month)) +
      theme_bw() +
      scale_fill_viridis_d() +
      guides(fill = "none") +
      scale_x_discrete(labels = month.abb)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
