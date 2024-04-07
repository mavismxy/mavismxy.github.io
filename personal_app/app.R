library(shiny)

library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("US Interest Rate"),
  sidebarLayout(
    sidebarPanel(
      p("text on sidebar"),
      sliderInput("year_data",
                  label = "User Input: ",
                  min = 1, 
                  max = 98,
                  value = 30),
      selectInput("input1", "Choose colour: ",
                  choices = c("red", "blue", "white"))
    ),
    mainPanel(
      p("text on main panel"),
      plotOutput("inflation_data")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$inflation_data <- renderPlot({
    ggplot(project_data) + geom_histogram(aes(x = inflation),
                                          bins = input$year_data,
                                          fill = input$input1)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
