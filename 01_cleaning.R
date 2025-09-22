## 302 Data Visualization Final Project
## data cleaning

# load packages
library(tidyverse)
library(here)

# load in data
responses_raw <- read_csv(here("data/responses.csv")) 

# ==========
# Cleaning
# ==========
responses_clean <- responses_raw |> 
  # standardize names
  janitor::clean_names() |>
  # turn character vars back to factor bc csv doesn't preserve typing
  mutate_if(is.character, as.factor) |> 
  # variables of interest
  select(smoking, alcohol, healthy_eating, 
         parents_advice, spending_on_healthy_eating, 
         energy_levels, entertainment_spending, 
         number_of_friends, health, ageing, 
         gender, village_town, age) |> 
  # take out NA observations; still have 954 obs total
  drop_na() |>
  mutate(# I live a very healthy lifestyle
         healthy_eating = factor(healthy_eating),
         healthy_eating = fct_collapse(healthy_eating,
                            "Very\n Healthy" = c("4", "5"),
                            "Moderate" = "3",
                            "Very\n Unhealthy" = c("1", "2")),
         alcohol = factor(alcohol, 
                          levels = c("never", 
                                     "social drinker", 
                                     "drink a lot"), 
                          labels = c("Never", 
                                     "Socially", 
                                     "A Lot")),
         smoking = factor(smoking, 
                          levels = c("never smoked", 
                                     "tried smoking", 
                                     "former smoker", 
                                     "current smoker"), 
                          labels = c("Never\n Smoked", 
                                     "Tried\n Smoking", 
                                     "Former\n Smoker", 
                                     "Current\n Smoker")), 
         # I listen to my parents' advice
         parents_advice = factor(parents_advice, 
                                 levels = c("1", "2", "3", "4", "5"), 
                                 labels = c("Never", 
                                            "Rarely", 
                                            "Sometimes", 
                                            "Often", 
                                            "Always")), 
         # I am full of life and energy
         energy_levels = factor(energy_levels, 
                                levels = c("1", "2", "3", "4", "5"), 
                                labels = c("Never", 
                                            "Rarely", 
                                            "Sometimes", 
                                            "Often", 
                                            "Always")),
         # I have a lot of friends
         number_of_friends = factor(number_of_friends), 
         number_of_friends = fct_collapse(number_of_friends,
                                          "Agree" = c("4", "5"),
                                          "Disagree" = c("1", "2"), 
                                          "Unsure" = "3"), 
         # I spend a lot of money on partying/socializing
         entertainment_spending = factor(entertainment_spending), 
         entertainment_spending = fct_collapse(entertainment_spending,
                                          "Agree" = c("4", "5"),
                                          "Disagree" = c("1", "2"), 
                                          "Unsure" = "3"), 
         # I will hapilly pay more money for good quality, healthy food
         spending_on_healthy_eating = factor(spending_on_healthy_eating), 
         spending_on_healthy_eating = fct_collapse(spending_on_healthy_eating,
                                 "Agree" = c("4", "5"),
                                 "Disagree" = c("1", "2"), 
                                 "Unsure" = "3"), 
         # I worry about my health
         health = factor(health, 
                         levels = c("1", "2", "3", "4", "5"), 
                         labels = c("Never", 
                                    "Rarely", 
                                    "Sometimes", 
                                    "Often", 
                                    "Always")),
         # I am afraid of ageing
         ageing = factor(ageing), 
         ageing = fct_collapse(ageing, 
                               "Yes" = c("3", "4", "5"), 
                               "No" = c("1", "2")), 
         age = factor(age), 
         age = fct_collapse(age, 
                            "15-19" = c("15", "16", "17","18","19"), 
                            "20-24" = c("20", "21", "22", "23", "24"), 
                            "25-30" = c("25", "26", "27", "28", "29", "30")), 
         gender = factor(gender, 
                         levels = c("female", "male"), 
                         labels = c("Women", "Men")), 
         village_town = factor(village_town, 
                               levels = c("city", "village"), 
                               labels = c("Urban", "Rural"))
         ) 

save(responses_clean, file = here("data/responses_clean.csv"))

