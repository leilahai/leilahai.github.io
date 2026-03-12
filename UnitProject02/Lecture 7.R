library("palmerpenguins")
library("dplyr")
library("tidyverse")
penguins_messy <- read.csv("./BIOL101_/penguins_messy.csv")
penguins_messy

#Q1:
str_detect(penguins_messy$species_messy, "adelie")
?str_detect
#Detects matching values,or if any values contain "adelie"
str_replace_all(penguins_messy$sex_messy, "\\?", "")
?str_replace_all
#Replaces matching pneguin sex values with a new text
str_squish(penguins_messy$island_messy)
?str_squish
#Removes whitespace, or sapces or line breaks, in the island category.

#Q2:
penguins_messy<-penguins_messy %>%
  mutate(valid_id = str_detect(sample_id, "PAL-[0-9]{3}"))

penguins_messy %>%
  pull(valid_id) %>%
  sum

#Q3:
penguins_messy<- penguins_messy %>%
  filter(valid_id)
penguins_messy

#Q4:
penguins_messy<-penguins_messy %>%
  mutate(
    file_date = str_extract(file_name, "^[0-9]{4}-[0-9]{2}-[0-9]{2}"),
    file_id = str_extract(sample_id, "PAL-[0-9]{3}"))

penguins_messy %>%
  filter(row_number() <= 10) %>%
  pull(file_date)
penguins_messy %>%
  filter(row_number() <= 10) %>%
  pull(file_id)

#Q5:
penguins_messy<-penguins_messy %>%
  mutate(island=
  str_squish(island_messy))

unique(penguins_messy$island)

#Q6: 
penguins_messy<-penguins_messy %>%
  mutate(sex=
  str_replace_all(sex_messy,"\\?","") %>% str_to_upper)
#OR
penguins_messy<-penguins_messy %>%
  mutate(sex=
  str_replace_all(sex_messy,"\\?",""))%>%
  mutate(sex=
  str_to_upper(sex))

unique(penguins_messy$sex)

#Q7:
penguins_messy<-penguins_messy %>%
  mutate(bill_mm=
  str_replace_all(notes,"\\.*bill=|mm",""))

unique(penguins_messy$bill_mm)

#Q8
#Most fun/interesting part of exercise? Most confusing or difficult?
#the most interesting part was finally figuring out how to use the different str functions in the mutate funct.
#the most confusing/difficult part was also figuring out how to use the different str functions in the mutate funct.

#Do you feel you have a general idea of how regular expressions are used?
#yes, though I will likely practice more because I only started to understand it towards the last question.
