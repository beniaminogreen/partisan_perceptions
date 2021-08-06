library(tidyverse)

sessionInfo()


load("../data/cleaned_data.Rdata")

p_import_woke <- lm(personally_imporant ~ woke, data = cleaned_data, weights=weight_1)
p_import_woke <- lm(personally_imporant ~ treat, data = cleaned_data, weights=weight_1)

# Estimate woke on support on measures of support
p_import_woke <- lm(personally_imporant ~ woke, data = cleaned_data, weights=weight_1)
p_import_woke_att <- lm(personally_imporant ~ woke, data = attentive, weights=weight_1)

n_import_woke <- lm(nationally_important ~ woke, data = cleaned_data, weights=weight_1)
n_import_woke_att <- lm(nationally_important ~ woke, data = attentive, weights=weight_1)

support_woke <- lm(support ~ woke, data = cleaned_data, weights=weight_1)
support_woke_att <- lm(support ~ woke, data = attentive, weights=weight_1)

pca_woke <- lm(.fittedPC1~ woke, data = cleaned_data, weights=weight_1)
pca_woke_att <- lm(.fittedPC1 ~ woke, data = attentive, weights=weight_1)

#Estimate treatment on measures of support
p_import_treat <- lm(personally_imporant ~ treat, data = cleaned_data, weights=weight_1)
p_import_treat_att <- lm(personally_imporant ~ treat, data = attentive, weights=weight_1)

n_import_treat <- lm(nationally_important ~ treat, data = cleaned_data, weights=weight_1)
n_import_treat_att <- lm(nationally_important ~ treat, data = attentive, weights=weight_1)

support_treat <- lm(support ~ treat, data = cleaned_data, weights=weight_1)
support_treat_att <- lm(support ~ treat, data = attentive, weights=weight_1)

pca_treat <- lm(.fittedPC1~ treat, data = cleaned_data, weights=weight_1)
pca_treat_att <- lm(.fittedPC1 ~ treat, data = attentive, weights=weight_1)

# Estimate woke x ideology on measures of support
p_import_woke_x_ideo5_dbl <- lm(personally_imporant ~ woke*ideo5_dbl, data = cleaned_data, weights=weight_1)
p_import_woke_x_ideo5_dbl_att <- lm(personally_imporant ~ woke*ideo5_dbl, data = attentive, weights=weight_1)

n_import_woke_x_ideo5_dbl <- lm(nationally_important ~ woke*ideo5_dbl, data = cleaned_data, weights=weight_1)
n_import_woke_x_ideo5_dbl_att <- lm(nationally_important ~ woke*ideo5_dbl, data = attentive, weights=weight_1)

support_woke_x_ideo5_dbl <- lm(support ~ woke*ideo5_dbl, data = cleaned_data, weights=weight_1)
support_woke_x_ideo5_dbl_att <- lm(support ~ woke*ideo5_dbl, data = attentive, weights=weight_1)

pca_woke_x_ideo5_dbl <- lm(.fittedPC1 ~ woke*ideo5_dbl, data = cleaned_data, weights=weight_1)
pca_woke_x_ideo5_dbl_att <- lm(.fittedPC1 ~ woke*ideo5_dbl, data = attentive, weights=weight_1)

# estimate woke x pvote on measures of support

p_import_woke_x_pvote <- lm(personally_imporant ~ woke*presvote20post, data = cleaned_data, weights=weight_1)
p_import_woke_x_pvote_att <- lm(personally_imporant ~ woke*presvote20post, data = attentive, weights=weight_1)

n_import_woke_x_pvote <- lm(nationally_important ~ woke*presvote20post, data = cleaned_data, weights=weight_1)
n_import_woke_x_pvote_att <- lm(nationally_important ~ woke*presvote20post, data = attentive, weights=weight_1)

support_woke_x_pvote <- lm(support ~ woke*presvote20post, data = cleaned_data, weights=weight_1)
support_woke_x_pvote_att <- lm(support ~ woke*presvote20post, data = attentive, weights=weight_1)

pca_woke_x_pvote <- lm(.fittedPC1 ~ woke*presvote20post, data = cleaned_data, weights=weight_1)
pca_woke_x_pvote_att <- lm(.fittedPC1 ~ woke*presvote20post, data = attentive, weights=weight_1)

# estimate woke x party id on measures of support



p_import_woke_x_pid3 <- lm(personally_imporant ~ woke*pid3, data = cleaned_data, weights=weight_1)
p_import_woke_x_pid3_att <- lm(personally_imporant ~ woke*pid3, data = attentive, weights=weight_1)

n_import_woke_x_pid3 <- lm(nationally_important ~ woke*pid3, data = cleaned_data, weights=weight_1)
n_import_woke_x_pid3_att <- lm(nationally_important ~ woke*pid3, data = attentive, weights=weight_1)

support_woke_x_pid3 <- lm(support ~ woke*pid3, data = cleaned_data, weights=weight_1)
support_woke_x_pid3_att <- lm(support ~ woke*pid3, data = attentive, weights=weight_1)

pca_woke_x_pid3 <- lm(.fittedPC1 ~ woke*pid3, data = cleaned_data, weights=weight_1)
pca_woke_x_pid3_att <- lm(.fittedPC1 ~ woke*pid3, data = attentive, weights=weight_1)

sum_treat <- lm(sum~ treat, data = cleaned_data, weights=weight_1)
sum_treat_att <- lm(sum ~ treat, data = attentive, weights=weight_1)
sum_woke <- lm(sum~ woke, data = cleaned_data, weights=weight_1)
sum_woke_att <- lm(sum ~ woke, data = attentive, weights=weight_1)
sum_woke_x_ideo5_dbl <- lm(sum ~ woke*ideo5_dbl, data = cleaned_data, weights=weight_1)
sum_woke_x_ideo5_dbl_att <- lm(sum ~ woke*ideo5_dbl, data = attentive, weights=weight_1)
sum_woke_x_pvote <- lm(sum ~ woke*presvote20post, data = cleaned_data, weights=weight_1)
sum_woke_x_pvote_att <- lm(sum ~ woke*presvote20post, data = attentive, weights=weight_1)
sum_woke_x_pid3 <- lm(sum ~ woke*pid3, data = cleaned_data, weights=weight_1)
sum_woke_x_pid3_att <- lm(sum ~ woke*pid3, data = attentive, weights=weight_1)


save(p_import_woke, p_import_woke, p_import_woke_att, n_import_woke,
     n_import_woke_att, support_woke, support_woke_att, pca_woke, pca_woke_att,
     p_import_treat, p_import_treat_att, n_import_treat, n_import_treat_att,
     support_treat, support_treat_att, pca_treat, pca_treat_att,
     p_import_woke_x_ideo5_dbl, p_import_woke_x_ideo5_dbl_att,
     n_import_woke_x_ideo5_dbl, n_import_woke_x_ideo5_dbl_att,
     support_woke_x_ideo5_dbl, support_woke_x_ideo5_dbl_att,
     pca_woke_x_ideo5_dbl, pca_woke_x_ideo5_dbl_att, p_import_woke_x_pvote,
     p_import_woke_x_pvote_att, n_import_woke_x_pvote,
     n_import_woke_x_pvote_att, support_woke_x_pvote, support_woke_x_pvote_att,
     pca_woke_x_pvote, pca_woke_x_pvote_att, p_import_woke_x_pid3,
     p_import_woke_x_pid3_att, n_import_woke_x_pid3, n_import_woke_x_pid3_att,
     support_woke_x_pid3, support_woke_x_pid3_att, pca_woke_x_pid3,
     pca_woke_x_pid3_att, sum_treat, sum_treat_att, sum_woke_x_ideo5_dbl,
     sum_woke, sum_woke_att, sum_woke_x_ideo5_dbl_att, sum_woke_x_pvote,
     sum_woke_x_pvote_att, sum_woke_x_pid3, sum_woke_x_pid3_att,
     file = "../data/estimated_models.Rdata")
