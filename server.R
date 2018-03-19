library(shiny)
data("mtcars")

shinyServer(function(input,output){
  
  model <- reactive({
    #model <- lm(formula = paste("mpg ~ ",input$variable,sep = ""), data = mtcars)
    variables <- ""
    if(input$cyl){variables <- paste(variables,"cyl+", sep=" ")}
    if(input$am){variables <- paste(variables,"am+", sep=" ")}
    if(input$gear){variables <- paste(variables,"gear+", sep=" ")}
    if(input$wt){variables <- paste(variables,"wt+", sep=" ")}
    if(input$carb){variables <- paste(variables,"carb+", sep=" ")}
    texto <- paste("mpg~",(variables))
    form <- substr(texto,1,nchar(texto)-1)
    model <- lm(formula=form, data=mtcars)
    model
  })
  
  output$data <- renderTable(coef(summary(model())), rownames = TRUE)
  
  output$plot <- renderPlot({
    plot(model()$fitted, model()$model$mpg, xlab = "Fitted Values", 
         ylab="Real Values")
    title("Model Results")
  })
  
  
})