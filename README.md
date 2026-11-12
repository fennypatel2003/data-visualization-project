# data-visualization-project
Car MPG Prediction App – Machine Learning with R
Project Overview
This project builds and deploys a machine learning model in R to predict a vehicle's fuel efficiency, measured in miles per gallon (MPG). It uses the built-in mtcars dataset and a linear regression model to estimate MPG based on two vehicle characteristics:
- Horsepower (hp)
- Weight (wt), measured in 1,000 pounds
The trained model is saved as an RDS file and used in a simple interactive web application built with Shiny.
Project Objectives
1. Train a linear regression model to predict vehicle MPG.
2. Evaluate the model using the model summary.
3. Test the model with a sample vehicle.
4. Save the trained model so it can be reused.
5. Create a prediction function.
6. Deploy an interactive Shiny application that accepts horsepower and weight and displays a predicted MPG.
Dataset
The project uses R's built-in mtcars dataset. No separate dataset download is required.
Item	Description
Dataset	mtcars
Target variable	mpg – miles per gallon
Predictor 1	hp – horsepower
Predictor 2	wt – weight (1,000 lbs)
Model	Multiple linear regression


Technologies Used
- R – programming language and statistical computing
- RStudio – development environment
- Shiny – interactive web application framework
- RDS – saving and loading the trained model
Project Workflow
1. Train the Model
The script loads mtcars and fits a multiple linear regression model:
data(mtcars)

car_model <- lm(mpg ~ hp + wt, data = mtcars)

summary(car_model)
A sample prediction is made for a vehicle with 120 horsepower and a weight of 2.8 thousand pounds:
new_car <- data.frame(
  hp = 120,
  wt = 2.8
)

prediction <- predict(car_model, newdata = new_car)
print(prediction)
2. Save the Model
The trained model is saved so it can be loaded again without retraining:
saveRDS(car_model, "car_model.rds")
3. Create a Prediction Function
The predict_mpg() function loads the saved model, accepts horsepower and weight as inputs, and returns a predicted MPG value:
predict_mpg <- function(horsepower, weight) {
  model <- readRDS("car_model.rds")

  new_data <- data.frame(
    hp = horsepower,
    wt = weight
  )

  prediction <- predict(model, newdata = new_data)

  return(prediction)
}

# Example
predict_mpg(120, 2.8)
4. Deploy with Shiny
The Shiny application provides:
- A numeric input for horsepower.
- A numeric input for vehicle weight (in 1,000 pounds).
- A Predict MPG button.
- An output area displaying the predicted MPG, rounded to two decimal places.
The app uses the saved car_model.rds file to generate predictions.
How to Run the Project
1. Install R and RStudio.
2. Download or clone this repository.
3. Open unit7project.R in RStudio.
4. Run the model-training section first so that car_model.rds is created in your working directory.
5. Run the remaining code to define the prediction function and launch the Shiny app.
6. In the Shiny app, enter horsepower and weight, then select Predict MPG.
If Shiny is not installed, install it in R:
install.packages("shiny")
To launch the app independently after the model has been saved, place the Shiny app code in an app.R file in the same directory as car_model.rds, then run:
shiny::runApp()
Example Input
Input	Value
Horsepower	120
Weight (1,000 lbs)	2.8


The model returns a predicted MPG value. The exact result is generated when the R script runs.
Project Files
File	Description
unit7project.R	R script containing model training, saving, prediction function, and Shiny app code
car_model.rds	Saved trained model, generated when the script is run


Notes
- The mtcars dataset is included with R.
- The model is a multiple linear regression model, not a classification model.
- The prediction is an estimate based on horsepower and weight; it is not a guarantee of real-world fuel economy.
- The R script includes the deployment code. A separate app.R file is optional if you want to run the Shiny application independently.
Author
Fenny Patel
This project was completed as part of a machine learning course project on training, saving, and deploying a model in R.
