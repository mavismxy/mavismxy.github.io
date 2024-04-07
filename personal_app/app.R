library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("US Interest Rate"),
  sidebarLayout(
    sidebarPanel(
      p("text on sidebar")
    ),
    mainPanel(
      p("text on main panel")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$samplesize),col='darkorchid',xlab="Sample",main="Standard Normally Distributed Sample")},
    height=300
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
