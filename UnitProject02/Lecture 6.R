install.packages("tidyverse")
install.packages("palmerpenguins")
library("tidyverse")
library("palmerpenguins")
penguins <- penguins %>%
  drop_na(flipper_length_mm, body_mass_g, bill_length_mm, bill_depth_mm, sex)

#Q1
ggplot(penguins, aes(x = island)) +
  geom_bar(fill = "steelblue") +
  labs(x = "Island", y = "Count")
#Biscoe has the most penguins
ggplot(penguins, aes(x = island)) +
  geom_bar(fill = "steelblue") +
  labs(x = "Island", y = "Count") +
  theme_minimal(base_size = 16)
#Adding theme_minimal() makes the graph look cleaner/more visually sound.

#Q2
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 60,
                 fill = "mediumpurple3",
                 color = "mediumpurple1") +
  labs(x = "body mass (g)",
       y = "Count") +
  theme_minimal(base_size = 15)
#the general shape of the distribution is normal with a right skew.
#changing bin number changes the range of the x-axis, or body mass.

#Q3
ggplot(penguins,
       aes(x = species,
           y = flipper_length_mm,
           color = species)) +
  geom_boxplot() +
  labs(x = "Species", y="Flipper Length (mm)")+
  theme_minimal()+
  scale_color_brewer(palette = "Paired")+
  theme(legend.position = "none")
#Gentoo have longest flippers (~216 mm average)

ggplot(penguins,
       aes(x = sex,
           y = body_mass_g,
           color = sex)) +
  geom_boxplot() +
  labs(x = "Sex", y="Body Mass (g)")+
  theme_minimal()+
  scale_color_brewer(palette = "Accent")+
  theme(legend.position = "none")
#Males have on average a higher body mass.

ggplot(penguins,
       aes(x = species,
           y = flipper_length_mm,
           fill = species)) +
  geom_boxplot() +
  labs(x = "Species", y="Flipper Length (mm)")+
  theme_minimal()+
  theme(legend.position = "none")

#Q4
ggplot(penguins,
       aes(x = bill_length_mm,
           y = bill_depth_mm)) +
  geom_point(size = 2)+
  geom_point(color = "mediumpurple1")+
  labs(x = "Bill Length (mm)",
       y = "Bill Depth (mm)")+
    theme_minimal()
#The relationship of the scatterplot is unclear.
#Adding a color makes the scatterplot slightly more readable, however overall still unclear.
ggplot(penguins,
       aes(x = bill_length_mm,
           y = bill_depth_mm)) +
  geom_point(size = 2)+
  geom_point(color = "mediumpurple1")+
  labs(x = "Bill Length (mm)",
       y = "Bill Depth (mm)")+
  theme_minimal()+
  geom_smooth(method="lm", na.rm=TRUE)
#Adding the line of best fit shows a slight negative relationship between Bill Length and Depth
#Overall, however, the line does not fit the data well.

#Q5
ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g,
           color = species)) +
  geom_point(size = 1)+
  facet_wrap(~species)+
  labs(x = "Flipper Length (mm)",
       y = "Body Mass (g)")+
  theme_minimal()+
  scale_color_brewer(palette="Set2")
#The Gentoo species shows the strongest relationship with Body mass and Flipper length.

ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g,
           color = species)) +
  geom_point(size = 1)+
  facet_wrap(sex~species)+
  labs(x = "Flipper Length (mm)",
       y = "Body Mass (g)")+
  theme_minimal()+
  scale_color_brewer(palette="Set2")
#The pattern indicates that male Gentoo penguins have the highest body mass.
#Additionally, body mass is generally higher among males, and Gentoo penguins are larger for both sexes.

ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g,
           color = species)) +
  geom_point(size = 1)+
  facet_wrap(~species)+
  facet_wrap(~sex)+
  labs(x = "Flipper Length (mm)",
       y = "Body Mass (g)")+
  theme_minimal()+
  scale_color_brewer(palette="Set2")

#Q6
library(nycflights13)
view(weather)
ggplot(weather,
       aes(x = temp,
           y = humid,
           color = hour)) +
  geom_point(size = 1)+
  facet_wrap(~hour)+
  labs(x = "Temperature (degree F)",
       y = "Humidity (RH)")+
  theme_dark()+
  geom_smooth(method="lm", na.rm=TRUE)
#The above is my attempt at creating a plot for a new dataset... it is a little incomprehensible...

files<-ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g,
           color = island)) +
  geom_point(size = 1)+
  facet_wrap(sex~island)+
  labs(x = "Flipper Length (mm)",
       y = "Body Mass (g)")+
  theme_dark()+
  scale_color_brewer(palette="Blues")
files

#Q7
#The most fun part of the exercise was being able to customize the colors of different graphs.
#The most confusing part of the exercise was determining the parameters format for each type of graph.


