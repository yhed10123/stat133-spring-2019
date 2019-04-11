#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(reshape2)
library(shiny)

future_value <- function(amount, rate, year) {
  
  a <- amount
  r <- rate
  y <- year
  
  a*(1+r)^y
}
annuity <- function(contrib, rate, year){
  
  c <- contrib 
  r <- rate
  y <- year
  
  c*(((1+r)^y-1)/r)
}
growing_annuity <- function(contrib, rate, growth, year){
  
  c <- contrib 
  r <- rate
  y <- year
  g <- growth
  
  c*((1+r)^y-(1+g)^y)/(r-g)
}

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Saving Simulator Application"),

  # Sidebar with a slider input for number of bins 
  fluidRow(column(3,
      sliderInput(inputId ="amount1",
                  "Initial Amount",
                  min = 0,
                  max = 100000,
                  value = 1000,
                  pre = "$",
                  step = 500),
      sliderInput(inputId = "contribution",
                  "Annual Contrilbution",
                  min = 0,
                  max = 50000,
                  value = 2000,
                  pre = "$",
                  step = 500)),
  column(4,
      sliderInput(inputId = "rrate",
                  "Return Rate( in %)",
                  min = 0,
                  max = 20,
                  value = 5,
                  step = 0.1),
      sliderInput(inputId = "grate",
                  "Growth Rate (in %)",
                  min = 0,
                  max = 20,
                  value = 2,
                  step = 0.1)),
  column(5,
      sliderInput(inputId = "year1",
                  "Years",
                  min = 0,
                  max = 50,
                  value = 20,
                  step = 1),
      selectInput(inputId = "fc",
                  label = "Fecet?",
                  choices = c("Yes","No"),
                  selected = "No"
                  )))
    ,
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      h3('Balances'),
      dataTableOutput("dataframe")
    ))
  


# Define server logic required to draw a histogram
server <- function(input, output) {
  output$distPlot <- renderPlot(width = 900, height = "auto",{
    if(input$fc == "Yes"){
    for (i in 0:input$year1) {
      year <- c()
      no_contrib <- c()
      fixed_contrib <- c()
      growing_contrib <- c()
      
      year = 0:input$year1
      
      no_contrib = future_value(amount = input$amount1, rate = input$rrate/100, year = year)
      fixed_contrib = no_contrib + annuity(contrib = input$contribution, rate = input$rrate/100, year = year)
      growing_contrib = no_contrib + growing_annuity(contrib = input$contribution, rate = input$rrate/100, growth = input$grate/100, year = year)
      
      modalities <- data.frame(year,no_contrib,fixed_contrib,growing_contrib)
    }
      
      df <- melt(modalities,id.vars = "year")
      ggplot(df, aes(year, value, colour = variable)) + geom_line()+ geom_area(aes(fill=variable),alpha = 0.5,linetype="blank")+theme_bw()+labs(title = "Timelines",subtitle = "Three models of investing")+facet_grid(~variable)+geom_point()+ theme(plot.title = element_text(color="black", size=17,face = "bold",hjust = 0.5))
  }
  else if(input$fc == "No"){
    for (i in 0:input$year1){
    year <- c()
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    
    year = 0:input$year1
    
    no_contrib = future_value(amount = input$amount1, rate = input$rrate/100, year = year)
    fixed_contrib = no_contrib + annuity(contrib = input$contribution, rate = input$rrate/100, year = year)
    growing_contrib = no_contrib + growing_annuity(contrib = input$contribution, rate = input$rrate/100, growth = input$grate/100, year = year)
    
    modalities <- data.frame(year,no_contrib,fixed_contrib,growing_contrib)
  }
  
  df <- melt(modalities,id.vars = "year")
  ggplot(df, aes(year, value, colour = variable)) + geom_line()+labs(title = "Timelines" ,subtitle = "Three models of investing")+geom_point()+theme(plot.title = element_text(color="black", size=17,face = "bold",hjust = 0.5))
    
  }})
  
  output$dataframe <- renderDataTable({
    
    for (i in 0:input$year1) {
      year <- c()
      no_contrib <- c()
      fixed_contrib <- c()
      growing_contrib <- c()
      
      year = 0:input$year1
      
      no_contrib = future_value(amount = input$amount1, rate = input$rrate/100, year = year)
      fixed_contrib = no_contrib + annuity(contrib = input$contribution, rate = input$rrate/100, year = year)
      growing_contrib = no_contrib + growing_annuity(contrib = input$contribution, rate = input$rrate/100, growth = input$grate/100, year = year)
    }
      modalities <- data.frame(year,no_contrib,fixed_contrib,growing_contrib)
    
  })
}

shinyApp(ui = ui, server = server)


