library("tidyverse")
library("haven")
library("lubridate")
library("broom")

data <- read_spss("../data/UCL_Palestine_US_client.sav")

data2 <- data %>%
  mutate(
    # Attentiveness Variables
    time_spent = starttime %--% endtime,
    seconds_spent = time_spent / dseconds(1),
    # female_variable
    female = gender == 2,
    ideo5_dbl = na_if(ideo5, 6) - 3
  ) %>%
  # Mutating labelled double responses to character
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
    UCLsplit2 = UCLsplit2 %>%
      dplyr::recode(
        `1` = "Control",
        `2` = "National security",
        `3` = "Prevent humanitarian crisis",
        `4` = "Uphold international law",
        `5` = "Counter racial injustice"
      ),
    presvote20post = presvote20post %>%
        dplyr::recode(
        "Howie Hawkins" = "Other",
        "Jo Jorgensen" = "Other"
                      )
  ) %>%
  rename(
    treat = UCLsplit2,
    support = UCL_1,
    american_interests = UCL_2,
    american_values = UCL_3
  )

outcome_pca <- data2 %>%
  select(support, american_values, american_interests) %>%
  prcomp()

data2 <- outcome_pca %>%
  augment(data2)

# Check no observations were lost
stopifnot(nrow(data) == nrow(data2))

attentive <- data2 %>%
  filter(seconds_spent > 10, seconds_spent < 300)

# check that pruning was performed
stopifnot(nrow(attentive) < nrow(data2))

cleaned_data <- data2

save(cleaned_data,outcome_pca, attentive, file = "../data/cleaned_data.Rdata")

