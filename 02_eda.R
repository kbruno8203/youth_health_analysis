## Data Vis Final Project
## Exploring the Data

# load packages and data
library(tidyverse)
library(here)

load(here("data/responses_clean.csv"))
codebook <- read_csv("data/codebook.csv")

# Gender is factor w 2 levels: female (593), male (411)
# Smoking is factor w 4 levels: current smoker, former smoker, never smoked, tried smoking
responses_clean |> 
  filter(gender == "Women") |> 
  group_by(smoking) |> 
  summarize(count = n(), 
            prop = count / 574) |>  
  mutate(labels = scales::percent(prop)) |> 
  ggplot(aes(x="", y=prop, fill=smoking)) +
  geom_bar(stat="identity", width=1, color = "white") +
  geom_text(aes(label = labels), color = "white", position = position_stack(vjust = 0.5))+
  coord_polar("y", start=0) +
  theme_void() +
  scale_fill_manual(values = c('#118ab2', "#ef476f", 
                                    "#ffd166", "#06d6a0")) + 
  theme( legend.position = "top", 
         legend.box = "horizontal", 
         legend.title = element_text(size = 14, 
                                     family = "Times New Roman"), 
         legend.text = element_text(size = 12, 
                                    face = "italic", 
                                    family = "Times New Roman")) +
  guides(fill = guide_legend(nrow = 1, 
                             title.position = "top", 
                             title.hjust = 0.5))

responses_clean |> 
  filter(gender == "Men") |> 
  group_by(smoking) |> 
  summarize(count = n(), 
            prop = count / 574) |>  
  mutate(labels = scales::percent(prop)) |> 
  ggplot(aes(x="", y=prop, fill=smoking)) +
  geom_bar(stat="identity", width=1, color = "white") +
  geom_text(aes(label = labels), color = "white", position = position_stack(vjust = 0.5))+
  coord_polar("y", start=0) +
  theme_void() +
  scale_fill_manual(values = c('#118ab2', "#ef476f", 
                               "#ffd166", "#06d6a0")) + 
  theme( legend.position = "top", 
         legend.box = "horizontal", 
         legend.title = element_text(size = 14, 
                                     family = "Times New Roman"), 
         legend.text = element_text(size = 12, 
                                    face = "italic", 
                                    family = "Times New Roman")) +
  guides(fill = guide_legend(nrow = 1, 
                             title.position = "top", 
                             title.hjust = 0.5))




# I listen to my parents advice by gender
responses_clean |> 
  ggplot(aes(x = smoking, fill = parents_advice)) + 
  facet_wrap(~gender) +
  geom_bar() + 
  theme_minimal() +
  labs(y = "Count", 
       x = NULL, 
       fill = "I listen to my parent's advice")  +
  coord_flip()

# I have a lot of friends by gender
responses_clean |> 
  ggplot(aes(x = smoking, fill = number_of_friends)) + 
  facet_wrap(~gender) +
  geom_bar() + 
  theme_minimal() +
  labs(y = "Count", 
       x = NULL, 
       fill = "I have lots of friends")  +
  coord_flip()

# I spend a lot of money on  partying and socializing.
responses_clean |> 
  ggplot(aes(x = smoking, fill = entertainment_spending)) + 
  facet_wrap(~gender) +
  geom_bar() + 
  theme_minimal() +
  labs(y = "Count", 
       x = NULL, 
       fill = "I spend a lot of money on partying/socializing")  +
  coord_flip()

# I am full of life and energy.
responses_clean |> 
  ggplot(aes(x = smoking, fill = entertainment_spending)) + 
  facet_wrap(~gender) +
  geom_bar() + 
  theme_minimal() +
  labs(y = "Count", 
       x = NULL, 
       fill = "I am full of life and energy")  +
  coord_flip()


# Finding things highly correlated with the 3 health vars
variable_selection <- responses_clean |> 
  mutate(smoking = as.numeric(smoking), 
         alcohol = as.numeric(alcohol), 
         healthy_eating = as.numeric(healthy_eating)) |> 
  select_if(is.numeric) |> 
  drop_na() |> 
  cor() |> 
  as.data.frame() |> 
  select(smoking, alcohol, healthy_eating) |> 
  arrange(desc(abs(healthy_eating)))