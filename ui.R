library(shiny)
data("mtcars")

shinyUI(
  fluidPage(
    titlePanel("Predicting Fuel Consumption (Miles per Gallon)"),
    
    sidebarLayout(
      sidebarPanel(
        p(paste("To use the app, simply choose the variables you wish to use in the regression model.",
                "The data comes from the mtcars dataset included in the base R distribution.",
                "Keep in mind that the Transmission variable is dicotomous with a value of 1 for automatic transmission and 0 for manual."
        ),
        br(),
        strong(paste("Due to compatibility issues, Mozilla or Chrome browser are recommended")),
      checkboxInput("cyl", "Cylinders", value = TRUE),
      checkboxInput("am", "Transmission", value = TRUE),
      checkboxInput("gear", "Gears", value = TRUE),
      checkboxInput("wt", "Weight", value = TRUE),
      checkboxInput("carb", "Carburators", value = TRUE),
      checkboxInput("hp", "Horsepower", value = TRUE)
        )
      ),
    mainPanel(
      h3("Model Results"),
      tableOutput("data"),
      plotOutput("plot")
      
    )
    )
  )
)
