#!/usr/bin/env Rscript

library(tidyverse)

sessionInfo()

load("../data/cleaned_data.Rdata")

# create subsets of respondents and attentive respondents that were exposed to
# each issue

latino_communities_issue <- cleaned_data %>%
  filter(issue == "Latino communities")

latino_communities_issue_att <- attentive %>%
  filter(issue == "Latino communities")

blm_protests_issue <- cleaned_data %>%
  filter(issue == "BLM / racial equality protests ")

blm_protests_issue_att <- attentive %>%
  filter(issue == "BLM / racial equality protests ")

racial_equality_issue <- cleaned_data %>%
  filter(issue == "Racial equality")

racial_equality_issue_att <- attentive %>%
  filter(issue == "Racial equality")

# Model the effect of the different treatment assignments
sum_treat <- lm(sum ~ treat, data = cleaned_data, weights = weight_1)
sum_treat_att <- lm(sum ~ treat, data = attentive, weights = weight_1)

sum_woke <- lm(sum ~ woke, data = cleaned_data, weights = weight_1)
sum_woke_att <- lm(sum ~ woke, data = attentive, weights = weight_1)

sum_woke_x_ideo5_dbl <- lm(sum ~ woke * ideo5_dbl, data = cleaned_data, weights = weight_1)
sum_woke_x_ideo5_dbl_att <- lm(sum ~ woke * ideo5_dbl, data = attentive, weights = weight_1)

sum_woke_x_pvote <- lm(sum ~ woke * presvote20post, data = cleaned_data, weights = weight_1)
sum_woke_x_pvote_att <- lm(sum ~ woke * presvote20post, data = attentive, weights = weight_1)

sum_woke_x_pid3 <- lm(sum ~ woke * pid3, data = cleaned_data, weights = weight_1)
sum_woke_x_pid3_att <- lm(sum ~ woke * pid3, data = attentive, weights = weight_1)

# sum of all responses by woke or not for only respondents asked about latino
# community issues.

sum_woke_latino <- lm(sum ~ woke, data = latino_communities_issue, weights = weight_1)
sum_woke_ideo5_latino <- lm(sum ~ woke + ideo5_dbl, data = latino_communities_issue, weights = weight_1)
sum_woke_x_ideo5_latino <- lm(sum ~ woke * ideo5_dbl, data = latino_communities_issue, weights = weight_1)

# sum of all responses by woke or not among only respondents given BLM
# question
sum_woke_blm <- lm(sum ~ woke, data = blm_protests_issue, weights = weight_1)
sum_woke_ideo5_blm <- lm(sum ~ woke + ideo5_dbl, data = blm_protests_issue, weights = weight_1)
sum_woke_x_ideo5_blm <- lm(sum ~ woke * ideo5_dbl, data = blm_protests_issue, weights = weight_1)

# sum of all responses by woke or not among only respondents given racial
# equality question
sum_woke_racial <- lm(sum ~ woke, data = racial_equality_issue, weights = weight_1)
sum_woke_ideo5_racial <- lm(sum ~ woke + ideo5_dbl, data = racial_equality_issue, weights = weight_1)
sum_woke_x_ideo5_racial <- lm(sum ~ woke * ideo5_dbl, data = racial_equality_issue, weights = weight_1)

save(sum_treat, sum_treat_att, sum_woke_x_ideo5_dbl, sum_woke, sum_woke_att,
  sum_woke_x_ideo5_dbl_att, sum_woke_x_pvote, sum_woke_x_pvote_att,
  sum_woke_x_pid3, sum_woke_x_pid3_att, sum_woke_latino,
  sum_woke_ideo5_latino, sum_woke_x_ideo5_latino, sum_woke_blm,
  sum_woke_ideo5_blm, sum_woke_x_ideo5_blm, sum_woke_racial,
  sum_woke_ideo5_racial, sum_woke_x_ideo5_racial,
  file = "../data/estimated_models.Rdata"
)
