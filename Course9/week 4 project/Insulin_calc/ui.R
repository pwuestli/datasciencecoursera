library(shiny)

shinyUI(fluidPage(
  titlePanel("Insulin calculator"),
  sidebarLayout(
    sidebarPanel(
          numericInput("cu", "How many grams of carbohydrate are one carbohydrate unit (CU)?", 
                       value = 10, min = 1, max = 20, step = 1),   
          
          numericInput("fac", "What is your carbohydrate unit to insulin units factor?", 
                       value = 3, min = 1, max = 10, step = 1)  
       
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs", 
            tabPanel("Introduction", 
                  br(),
                  p("More and more people are suffering from diabtes. While it is possible to recover from 
                     type 2 diabetes, people affected by type 1 have to live with it for the rest of their lives. 
                     This invovles injecting themselves with insulin every time they eat something which contains carbohydrate. 
                     The amount of insulin is dependent of the amount of carbohydrate in the food. This calculator 
                     helps to determine how much insuline needs to be injected."),
                  h4("Paramters on the side panel"),
                  p("In the panel on the left hand side are two important parameters. The first one shows how many grams
                     of carbohydrate are one carbohydrate unit (CU). The amount can vary, it is normally between 10 and 15. 
                     The second parameter displays the insulin factor. This factor is highly individual for each person and is 
                     determined together with the doctor. It is used to calculate the amount of insulin. A factor of 3 means that 
                     for each CU you have to inject 3 units of insulin."),
                  h4("The other tabs"),
                  p("The other two tabs will help to calculate the amount of insulin dependent on the paramters on the side panel."),
                  p("The first tab is used to calculate the amount of insulin if you know how many grams of carbohydrate you are goingt to eat."),
                  p("The second tab is an alternative if you don't know. Most of the food is labeled with the grams of carbohydrate per
                    100 gram of the food. Here you can calculate the insulin units depending on how much you eat and the amount of carbohydrate 
                    per 100 gram in the food."),
                  h4("Important notice"),
                  p("This is a highly complex topic because many factors need to be considered. 
                     Too many for this project. Other possible factor, which are not considered, could be:"),
                  p("- The time of the last injection. Is still some insulin present in the system? How much? 
                     This would reduce the amount "),
                  p("- What is my current blood sugar? Is it maybe too high or too low?")
            ),
            
            tabPanel("The amount of carbohydrate is known", 
                           sliderInput("sliderCarb", "How many carbohydrates are you going to eat?",
                                       0, 150, value = 50),
                           textOutput("calc1"),
                           submitButton("Calculate insulin units!")
            ), 
            
            tabPanel("Use carbohydrate per 100 gram", 
                     sliderInput("sliderCarbPer100", "How many carbohydrates per 100 gram are in the food?",
                                 0, 150, value = 50),
                     sliderInput("sliderFood", "How much are you going to eat (in gram)?",
                                 0, 1500, value = 500),
                     textOutput("calc2"),
                     submitButton("Calculate insulin units!")
            )
      )
    )
  )
))
