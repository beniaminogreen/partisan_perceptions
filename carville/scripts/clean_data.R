library("haven")
library("tidyverse")
library("lubridate")
library("broom")

sessionInfo()

data <- read_spss("../data/UCL_Carville_June_21_US_Client.sav")

data2 <- data %>%
  mutate(
    # Attentiveness Variables
    time_spent = starttime %--% endtime,
    seconds_spent = time_spent / dseconds(1),
    # female_variable
    female = gender == 2,
    ideo5_dbl = na_if(ideo5, 6) - 3
  ) %>%
  mutate_at(
    c(
      "race", "educ", "ideo5", "pid3", "profile_gross_household",
      "profile_gross_household_r", "marital_stat", "presvote20post", "region"
    ),
    ~ .x %>%
      as_factor() %>%
      as.character()
  ) %>%
  mutate_at(c("UCL_1", "UCL_2", "UCL_3"), ~ 4 - as.numeric(.x)) %>%
  mutate(
    woke = UCLsplit %in% c(1, 3, 5),
    UCLsplit = UCLsplit %>%
      dplyr::recode(
        `1` = "Latinx",
        `2` = "Hispanic/Latino",
        `3` = "Communities of color",
        `4` = "Racial minorities",
        `5` = "BLM",
        `6` = "Racial equality"
      )
  ) %>%
  rename(
    treat = UCLsplit,
    support = UCL_1,
    personally_imporant = UCL_2,
    nationally_important = UCL_3
  ) %>%
  mutate(
    issue = case_when(
      treat %in% c("Latinx", "Hispanic/Latino") ~ "Hispanic issues",
      treat %in% c("BLM", "Racial equality") ~ "Racial justice issues",
      treat %in% c("Racial minorities", "Communities of color") ~ "Racial
      Equality issues"
    ),
    sum = support + nationally_important + personally_imporant
  )

# Check no observations were lost
stopifnot(nrow(data) == nrow(data2))

pca <- prcomp(data2 %>% select(
  support, nationally_important,
  personally_imporant
))

data2 <- pca %>%
  augment(data2)

attentive <- data2 %>%
  filter(seconds_spent > 5, seconds_spent < 300)

# check that pruning was performed
stopifnot(nrow(attentive) < nrow(data2))

cleaned_data <- data2

save(cleaned_data,pca,attentive, file = "../data/cleaned_data.Rdata")
