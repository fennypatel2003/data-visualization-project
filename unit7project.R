#Unit 7: Project Instructions
#Unit 6 Mini-Project: Deploy Your First Machine Learning Model



#The Dataset
#I will use the built-in mtcars dataset (comes with R), so nothing needs to be downloaded.
#Dataset: mtcars
#Prediction: Miles per gallon (mpg)
#Predictors: Horsepower (hp) & Weight (wt)


#1. Train a Model
# Load built-in dataset
data(mtcars)

# View first few rows
head(mtcars)

# Build regression model
# Predict MPG using horsepower and weight
car_model <- lm(mpg ~ hp + wt, data = mtcars)

# Display model summary
summary(car_model)

# Test the model with new data
new_car <- data.frame(
  hp = 120,
  wt = 2.8
)

prediction <- predict(car_model, newdata = new_car)

print(prediction)







#2.  Save the Model

saveRDS(car_model, "car_model.rds")

cat("Model saved successfully!\n")


#3.  Create a Prediction Function

predict_mpg <- function(horsepower, weight){
  
  # Load saved model
  model <- readRDS("car_model.rds")
  
  # Create new data
  new_data <- data.frame(
    hp = horsepower,
    wt = weight
  )
  
  # Make prediction
  prediction <- predict(model, newdata = new_data)
  
  return(prediction)
  
}

# Example
predict_mpg(120, 2.8)


#4. Deploy the Model
install.packages("shiny")
library(shiny)

# Load saved model
model <- readRDS("car_model.rds")

ui <- fluidPage(
  
  titlePanel("Car MPG Prediction App"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      numericInput(
        "hp",
        "Horsepower",
        value = 120
      ),
      
      numericInput(
        "wt",
        "Weight (1000 lbs)",
        value = 2.8
      ),
      
      actionButton(
        "predict",
        "Predict MPG"
      )
      
    ),
    
    mainPanel(
      
      h3("Prediction"),
      
      verbatimTextOutput("result")
      
    )
    
  )
  
)

server <- function(input, output){
  
  observeEvent(input$predict,{
    
    new_data <- data.frame(
      
      hp = input$hp,
      wt = input$wt
      
    )
    
    prediction <- predict(model, newdata = new_data)
    
    output$result <- renderText({
      
      paste("Predicted MPG:", round(prediction,2))
      
    })
    
  })
  
}

shinyApp(ui = ui, server = server)


#5. Test Your Deployment
#Provide a screenshot (for shiny) or sample API response (for plumber) that demonstrates your deployment is functional.




























