library(tidyverse)
library(broom)

power_sims <- function(std, N, difference) {
  trump_vote <- sample(c(FALSE, FALSE, TRUE), N, replace = T)
  treatment <- sample(1:6, N, replace = T)
  outcome <- rnorm(N, 0, std) + ifelse(trump_vote & treatment == 6, difference, 0)

  data <- tibble(trump_vote, treatment, outcome)

  model <- lm(outcome ~ trump_vote * as.factor(treatment))

  return(tidy(model)[12, ] %>% select(-term))
}


sims <- expand_grid(effect_size = seq(0, .9, .05), sim_n = 1:500) %>%
  mutate(data = map(effect_size, ~ power_sims(2, 3816, .x))) %>%
  unnest() %>%
  nest(-effect_size) %>%
  mutate(
    prop_significant = map_dbl(data, ~ mean(.x$p.value < .05)),
    significant_sims = map(data, ~ .x %>% filter(p.value < .05)),
    prop_negative = map_dbl(significant_sims, ~ mean(.x$estimate < 0)),
    exaggeration_factor = map2_dbl(significant_sims, effect_size, ~ mean(abs(.x$estimate)) / .y)
  )

sample_size_sims <- expand_grid(sample_size = seq(400,30000,500), sim_n = 1:500) %>%
  mutate(data = map(sample_size, ~ power_sims(2, .x, .3))) %>%
  unnest()

sample_size_sims <- sample_size_sims %>%
    nest(-sample_size) %>%
    mutate(
        prop_significant = map_dbl(data, ~ mean(.x$p.value < .05)),
    ) %>%
    select(-data)


rep_sims <- sims %>% select(-significant_sims, -data)

save(rep_sims, sample_size_sims, file = "../data/monte_carlo_results.Rdata")

