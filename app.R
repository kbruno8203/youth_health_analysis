# Final Project
# Building a Shiny App for Youth Health Data

# load packages
library(shiny)
library(tidyverse)
library(ggthemes)
library(shinythemes)

# load data
load(here::here("data/responses_clean.csv"))

# ===============
# User Interface
# ===============
data_page <- fluidPage(
  theme = shinytheme("flatly"),
  # title of app
  titlePanel("Youth Health Metrics"), 
  
  # layout for body of app that contains sidebar and main panel
  sidebarLayout(
    position = "right", 
    # inputs
    sidebarPanel(
      
      helpText("Explore the relationship between personal characteristics and 
               various health metrics by selecting from the options below."),
      
      # on the x axis (categories to be filled)
      selectInput(inputId = "dist", 
                  label = "Health Metric",
                  choices = c("Smoking Behavior" = "smoking",
                              "Drinking Behavior" = "alcohol",
                              "Lifestyle Choices" = "healthy_eating")),
   
      br(), # vertical spacing
      
      # what fills in and is in the legend
      radioButtons(
        inputId = "var", 
                   label = "Selected Personal Characteristic",
                   choices = c("Loyalty to Parental Advice" = "parents_advice", 
                               "Food Spending Habits" = "spending_on_healthy_eating", 
                               "Energy Levels" = "energy_levels", 
                               "Social Spending Habits" = "entertainment_spending", 
                               "Number of Friends" = "number_of_friends", 
                               "Nerves About Overall Health" = "health", 
                               "Fear of Ageing" = "ageing"))),
    
    
    # outputs
    mainPanel(
      tags$head(
        tags$style(HTML(".nav-tabs > li > a {
        color: #5283ab;}"))
      ),
    
      # Output: Tabset w/ plot, summary, and references ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plots", 
                           plotOutput("plot")),
                 
                   tabPanel("Smoking", 
                           fluidPage(
                             h4("Key Patterns"),
                             
                             p("The interactive graph reveals an interesting 
                                relationship between smoking behavior and 
                                spending habits that suggests a positive 
                                relationship between spending money on 
                                socializing/partying and smoking at least once. 
                                Note that the bar graph has a similar trend in 
                                spending habits in people who have smoked once 
                                or more, while the group of people who have 
                                never smoked reverses the trend by being more 
                                likely to disagree that they spend a lot of 
                                money socializing. Picking any random current 
                                smoker, former smoker, or attempted smoker is 
                                most likely to yield someone who would agree 
                                that they spend a lot of money socializing. 
                                Furthermore, it was surprising to see that the 
                                group of current smokers had the highest 
                                proportion of people who fear ageing as I 
                                imagine that fear would incentivize someone to 
                                quit smoking."))
                           ),
                  
                  tabPanel("Drinking", 
                           fluidPage(
                             h4("Key Patterns"), 
                             
                             p("In regards to drinking behavior, we see a similar 
                               pattern with spending habits related to 
                               partying/socializing where people who never drink 
                               are likely to disagree with the statement 
                               that they spend a lot of money socializing. The plot
                               also reveals that people who never drink are more
                               likely to report that they are unsure about if 
                               they have a lot of friends than to report that they 
                               definitely do have a lot of friends."),
                             br(),
                             p("Additionally, in the group of young people who 
                               drink socially, the majority are not afraid of ageing.
                               The reverse is demonstrated in people who never drink, 
                               and people who drink a lot.")
                           )),
                  
                  tabPanel("Lifestyle", 
                           fluidPage(
                           h4("Key Patterns"), 
                           
                           p("Participants' self-rated perception of the degree
                               to which they live a healthy lifestyle influences
                               their answers to many of the personal characteristic
                               questions. For example, the distribution within each 
                               group of how many people are full of life and energy
                               is right skewed, but this lean towards more energy
                               is stronger in the healthy lifestyle group.
                               "), 
                           br(),
                           p("Every group has a majority of participants responding
                                that they would happily purchase high quality 
                                healthy foods. However, in the 'unhealthy choices' 
                                group, the distribution is fairly even, suggesting
                                that a willingness to spend money on healthy foods
                                is less common amidst people who report they have
                                an unhealthy lifestyle.")
                           )))
    )
  )
)

info_page <- 
  fluidPage(
  theme = shinytheme("flatly"),
  # title of app
  titlePanel("About the Young People Survey Data"), 
  
  # layout for body of app that contains sidebar and main panel
  sidebarLayout(
    position = "right", 
    # inputs
    sidebarPanel(
      h4("Instructions:"),
      p("The interactive display found in the Data Exploration tab 
               allows users to explore personal characteristics in relation 
               to three health metrics:"),
      tags$ul(tags$li("how frequently a person smokes"),
              tags$li("how often they drink alcohol"), 
              tags$li("to what degree they consider 
               themselves to make healthy lifestyle choices")),
      p("Two widgets in the right side panel allow users to select through
        all combinations of health metrics and personal characteristics.")
              
    ),
    
    mainPanel(
      p("The data used to build this app is a collection of survey 
               responses from students, aged 15-30, in a statistics 
               class at a Slovak university in 2013. The survey 
               itself was presented both in written form and electronically. 
               All participants have Slovak nationality and the original survey 
               was presented in Slovak language. It was later translated into 
               English. Furthermore, the survey was intended to have its items 
               split amongst 8 groups: music preferences (19 items), movie 
               preferences (12 items), hobbies & interests (32 items), phobias 
               (10 items), health habits (3 items) personality traits & 
               opinions (57 items), spending habits (7 items), and 
               demographics (10 items). The focus of the current study is health
               habits and their associations with spending habits, personality
               traits & opinions, and the phobia of ageing. Note that all 
               variables were originally recorded on a scale of 1 to 5, 
               but were caetgorically restructured in the data cleaning process
               based on the methodology and clustering results of Miroslav (2014)
               and Sleziak (2014).")
    )
  )
)

disc_page <- 
  fluidPage(
    theme = shinytheme("flatly"),
    titlePanel("Summary and Notable Results"), 
    
    p("The visualization communicates that there are a variety of 
        factors that determine the health-related decisions of young 
        people. Health data is often looked at in respect to race, 
        socioeconomic status, sex, or ethnicity. However, the Youth 
        Survey data provides the unique opportunity to look at how 
        health is affected by personal characteristics such as spending 
        habits, fears/anxieties, social networks, and emotional disposition. 
        Such variables are under-explored in their influence on how young 
        people maintain their health, but nevertheless provide new insights 
        about categorical associations."),
    
    br(),

    h2("References"),
  
        p("Miroslav, Sabo 2013. Young People Survey: Explore the preferences, 
          interests, habits, opinions, and fears of young people. Faculty of 
          Social and Economic Sciences: Comenius University Bratislava. 
          Accessed 1 March 2024. https://www.kaggle.com/datasets/miroslavsabo\n/young-people-survey?resource=download"), 
        br(),
        p("Sabo, Miroslav. Multivariate Statistical Methods with Applications. Diss. Slovak
    University of Technology in Bratislava, 2014"),
        br(),
       
    p("Sleziak, P. & Sabo, M. Gender differences in the prevalence of specific
    phobias. Forum Statisticum Slovacum. 2014, Vol. 10, No. 6.")
    )

ui <- navbarPage(title = "Stat 302 Final Project",
                 tabPanel(title = "Introduction", 
                          info_page),
                 tabPanel(title = "Data Exploration",
                          data_page),
                 tabPanel(title = "Discussion",
                          disc_page)
)

server <- function(input, output) {
  
  data <- reactive({
    responses_clean
  })
  
  # Reactive plot for Plot tab
  output$plot <- renderPlot({
    
    legend_label <- switch(
      input$var,
      "parents_advice" = "I listen to my parents' advice", 
      "spending_on_healthy_eating" = "I will happily spend money on helathy food", 
      "energy_levels" = "I am full of life and energy", 
      "entertainment_spending" = "I spend lots of money on partying/socializing", 
      "number_of_friends" = "I have a lot of friends", 
      "ageing" = "I am afraid of ageing", 
      "health" = "I worry about my health"
    )
    
    title_label_1 <- switch(
      input$dist,
      "smoking" = "Smoking Behavior",
      "alcohol" = "Drinking Behavior",
      "healthy_eating" = "Lifestyle Choices"
    )
    
    title_label_2 <- switch(
      input$var,
      "parents_advice" = "Loyalty to Parental Advice", 
      "spending_on_healthy_eating" = "Food Spending Habits", 
      "energy_levels" = "Energy Levels", 
      "entertainment_spending" = "Social Spending Habits", 
      "number_of_friends" = "Number of Friends", 
      "ageing" = "Fear of Ageing", 
      "health" = "Nerves About Overall Health"
    )
    
    ggplot(data(), 
           aes_string(x = input$dist, 
                      fill = input$var)) +
      geom_bar(position = "dodge", stat = "count") +
      labs(title = paste(title_label_1, "vs. ", title_label_2),
           x = NULL,
           y = "Frequency", 
           caption = "Source: Young People Survey Data") +
      theme_light() +
      coord_flip() +
      scale_fill_manual(name = legend_label, 
                        values = c('#eaac8b',"#e56b6f", "#b56576", 
                                   "#6d597a", "#355070")) +
      theme(plot.title = element_text(size = 24, 
                                      hjust = .5,
                                      margin = margin(t = 15, b = 10),
                                      face = "bold", 
                                      family = "Times New Roman"), 
            legend.position = "top", 
            legend.box = "horizontal", 
            legend.title = element_text(size = 14, 
                                        family = "Times New Roman"), 
            legend.text = element_text(size = 12, 
                                       face = "italic", 
                                       family = "Times New Roman"), 
            axis.title = element_text(size = 12,
                                      family = "Arial", 
                                      face = "bold"), 
            axis.text = element_text(size = 10,
                                     family = "Arial"), 
            axis.text.y = element_text(size = 12, 
                                       face = "bold", 
                                       hjust = 0.5)) +
      guides(fill = guide_legend(nrow = 1, 
                                 title.position = "top", 
                                 title.hjust = 0.5))
  })
  
  # Generate a summary of the data ----
  output$summary <- renderPrint({
    
    "hello"
    
    
    
  })
  
  # Generate an HTML table view of the data ----
  output$references <- renderPrint({
   
  })
  
}

# Create the app object
shinyApp(ui = ui, server = server)
