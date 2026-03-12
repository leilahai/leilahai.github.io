penguins <- palmerpenguins::penguins
library("tidyverse")
library("palmerpenguins")

#Q1
penguins_clean <- penguins %>%
  drop_na(bill_length_mm,sex)

nrow(penguins_clean)
nrow(penguins)
#333 rows (oenguins clean) vs 344 (penguins)

#Q2
penguins_dup <- penguins_clean %>%
  bind_rows(slice_sample(penguins_clean, n = 30, replace = TRUE))
nrow(penguins_dup)
penguins_dup %>% distinct %>% nrow

#Q3
penguins_new <- penguins_clean %>%
  select(species, island, sex, where(is.numeric))
length(penguins_new)
#8 total collumns, with 333 rows (penguins_new)

#Q4
penguins_bill <- penguins_clean %>%
  select(starts_with("bill"),ends_with("_mm"))
penguins_bill

penguins_bill <- penguins_clean %>%
  select(matches("bi.*|fli.*"))
penguins_bill

#Q5
penguins_species <- penguins_clean %>%
  drop_na %>%
  group_by(species) %>%
  summarize(across(where(is.numeric),mean))
penguins_species
#across(where(is.numeric), …) is better than typics each column by hand because it is more efficient/faster.

#Q6
penguins_clean<-penguins_clean %>%
  mutate(bill_length=
           case_when(
             bill_length_mm<40~"short",
             bill_length_mm<50~"medium",
             bill_length_mm>=50~"long"))
penguins_clean
penguins_clean$bill_length

#Q7
instrument_meta <- tibble(
  instrument_id = c("caliper_A", "caliper_B", "caliper_C"),
  calibration_mm = c(0.2, 0.5, 1.0),
  manufacturer = c("Mitutoyo", "Fowler", "Generic")
)
instrument_meta

penguins_instrumented<-penguins_clean %>%
  drop_na(bill_length_mm)%>%
  mutate(instrument_id=
         case_when(
           year==2007~"caliper_A",
           year==2008~"caliper_B",
           year==2009~"caliper_C"))
penguins_instrumented

penguins_instrumented<-penguins_instrumented %>%
  select(year,species,island,instrument_id)%>%distinct
penguins_instrumented<-penguins_instrumented %>%
  left_join(penguins_instrumented,instrument_meta,by="instrument_id")
length(penguins_instrumented)
length(penguins_clean)
#75 rows and 7 columns (penguins_instrumented) vs 333 rows and 9 columns (penguins_clean); 

#Q8
#most fun/interesting part of the exercise: I liked making different dataframes and testing the different functions from lecture
#most confusing/difficult part: the second half of number 7, and figuring out how to get left_join to work
#I feel like these general "survival tips" will be useful in future data analyses because they can allow for needed edits in a quick, efficient way
