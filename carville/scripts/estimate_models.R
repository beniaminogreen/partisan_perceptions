load("../data/cleaned_data.Rdata")
library(tidyverse)

load("../data/cleaned_data.Rdata")

p_import_woke <- lm(personally_imporant ~ woke, data = cleaned_data, weights=weight_1)

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

save(pca_treat, file="../data/estimated_models.Rdata")
