library("tidyverse")
library("haven")
library("lubridate")

load("../data/cleaned_data.Rdata")

# Estimate support
# Support on treatment
support_treat <- lm(support ~ treat, data = cleaned_data, weights=weight_1)
support_treat_att <- lm(support ~ treat, data = attentive, weights=weight_1)

# Support on treatment + numeric ideology
support_treat_ideo5_dbl <- lm(support ~ treat+ideo5_dbl, data = cleaned_data, weights=weight_1)
support_treat_ideo5_dbl_att <- lm(support ~ treat+ideo5_dbl, data = attentive, weights=weight_1)

# Support on treatment * numeric ideology
support_treat_x_ideo5_dbl <- lm(support ~ treat*ideo5_dbl, data = cleaned_data, weights=weight_1)
support_treat_x_ideo5_dbl_att <- lm(support ~ treat*ideo5_dbl, data = attentive, weights=weight_1)

# Support on treatment + party id
support_pid3_dbl <- lm(support ~ treat+pid3, data = cleaned_data, weights=weight_1)
support_pid3_dbl_att <- lm(support ~ treat+pid3, data = attentive, weights=weight_1)

# Support on treatment * party id
support_x_pid3_dbl <- lm(support ~ treat*pid3, data = cleaned_data, weights=weight_1)
support_x_pid3_dbl_att <- lm(support ~ treat*pid3, data = attentive, weights=weight_1)

# Support on treatment + presidential vote in 2020
support_treat_pvote <- lm(support ~ treat+presvote20post, data = cleaned_data, weights=weight_1)
support_treat_pvote_att <- lm(support ~ treat+presvote20post, data = attentive, weights=weight_1)

# Support on treatment * presidential vote in 2020
support_treat_x_pvote <- lm(support ~ treat*presvote20post, data = cleaned_data, weights=weight_1)
support_treat_x_pvote_att <- lm(support ~ treat*presvote20post, data = attentive, weights=weight_1)

# Models on American Interests
# Interests on treatment
interests_all <- lm(american_interests ~ treat, data = cleaned_data, weights=weight_1)
interests_att <- lm(american_interests ~ treat, data = attentive, weights=weight_1)

#interests on treatment + numeric ideology
interests_treat_ideo5_dbl <- lm(american_interests ~ treat+ideo5_dbl, data = cleaned_data, weights=weight_1)
interests_treat_ideo5_dbl_att <- lm(american_interests ~ treat+ideo5_dbl, data = attentive, weights=weight_1)

#interests on treatment * numeric ideology
interests_treat_x_ide5_dbl <- lm(american_interests ~ treat*ideo5_dbl, data = cleaned_data, weights=weight_1)
interests_treat_x_ideo5_dbl_att <- lm(american_interests ~ treat*ideo5_dbl, data = attentive, weights=weight_1)

# Interests on treatment + party ID
interests_treat_pid3 <- lm(american_interests ~ treat+pid3, data = cleaned_data, weights=weight_1)
interests_treat_pid3_att <- lm(american_interests ~ treat+pid3, data = attentive, weights=weight_1)

# Interests on treatment * party ID
interests_treat_x_pid3 <- lm(american_interests ~ treat*pid3, data = cleaned_data, weights=weight_1)
interests_treat_x_pid3_att <- lm(american_interests ~ treat*pid3, data = attentive, weights=weight_1)

# Interests on treatment * 2020 presidential vote
interests_treat_pvote <- lm(american_interests ~ treat+presvote20post, data = cleaned_data, weights=weight_1)
interests_treat_pvote_att <- lm(american_interests ~ treat+presvote20post, data = attentive, weights=weight_1)

# Interests on treatment + 2020 presidential vote
interests_treat_x_pvote <- lm(american_interests ~ treat*presvote20post, data = cleaned_data, weights=weight_1)
interests_treat_x_pvote_att <- lm(american_interests ~ treat*presvote20post, data = attentive, weights=weight_1)

# American values on treat
values_treat_all <- lm(american_values ~ treat, data = cleaned_data, weights=weight_1)
values_treat_att <- lm(american_values ~ treat, data = attentive, weights=weight_1)

# American values on treat + numeric ideology
values_treat_ideo5_dbl <- lm(american_values ~ treat+ideo5_dbl, data = cleaned_data, weights=weight_1)
values_treat_ideo5_dbl_att <- lm(american_values ~ treat+ideo5_dbl, data = attentive, weights=weight_1)

# American values on treat * numeric ideology
values_treat_x_ideo5_dbl <- lm(american_values ~ treat*ideo5_dbl, data = cleaned_data, weights=weight_1)
values_treat_x_ideo5_dbl_att <- lm(american_values ~ treat*ideo5_dbl, data = attentive, weights=weight_1)

# American values on treat + party id
values_treat_pid3 <- lm(american_values ~ treat+pid3, data = cleaned_data, weights=weight_1)
values_treat_pid3_att <- lm(american_values ~ treat+pid3, data = attentive, weights=weight_1)

# American values on treat * party id
values_treat_x_pid3 <- lm(american_values ~ treat*pid3, data = cleaned_data, weights=weight_1)
values_treat_x_pid3_att <- lm(american_values ~ treat*pid3, data = attentive, weights=weight_1)

# American values on treat + 2020 presidential vote
values_treat_pvote <- lm(american_values ~ treat+presvote20post, data = cleaned_data, weights=weight_1)
values_treat_pvote_att <- lm(american_values ~ treat+presvote20post, data = attentive, weights=weight_1)

# American values on treat * 2020 presidential vote
values_treat_x_pvote <- lm(american_values ~ treat*presvote20post, data = cleaned_data, weights=weight_1)
values_treat_x_pvote_att <- lm(american_values ~ treat*presvote20post, data = attentive, weights=weight_1)

# Models for PCA
# PCA on treatment
pca_all <- lm(.fittedPC1 ~ treat, data = cleaned_data, weights=weight_1)
pca_att <- lm(.fittedPC1 ~ treat, data = attentive, weights=weight_1)

#PCA on treatment + numeric ideology
pca_treat_ideo5_dbl <- lm(.fittedPC1 ~ treat+ideo5_dbl, data = cleaned_data, weights=weight_1)
pca_treat_ideo5_dbl_att <- lm(.fittedPC1 ~ treat+ideo5_dbl, data = attentive, weights=weight_1)

#PCA on treatment * numeric ideology
pca_treat_x_ideo5_dbl <- lm(.fittedPC1 ~ treat*ideo5_dbl, data = cleaned_data, weights=weight_1)
pca_treat_x_ideo5_dbl_att <- lm(.fittedPC1 ~ treat*ideo5_dbl, data = attentive, weights=weight_1)

# PCA on treatment + party ID
pca_treat_pid3 <- lm(.fittedPC1 ~ treat+pid3, data = cleaned_data, weights=weight_1)
pca_treat_pid3_att <- lm(.fittedPC1 ~ treat+pid3, data = attentive, weights=weight_1)

# PCA on treatment * party ID
pca_treat_x_pid3 <- lm(.fittedPC1 ~ treat*pid3, data = cleaned_data, weights=weight_1)
pca_treat_x_pid3_att <- lm(.fittedPC1 ~ treat*pid3, data = attentive, weights=weight_1)

# PCA on treatment * 2020 presidential vote
pca_treat_pvote <- lm(.fittedPC1 ~ treat+presvote20post, data = cleaned_data, weights=weight_1)
pca_treat_pvote_att <- lm(.fittedPC1 ~ treat+presvote20post, data = attentive, weights=weight_1)

# PCA on treatment + 2020 presidential vote
pca_treat_x_pvote <- lm(.fittedPC1 ~ treat*presvote20post, data = cleaned_data, weights=weight_1)
pca_treat_x_pvote_att <- lm(.fittedPC1 ~ treat*presvote20post, data = attentive, weights=weight_1)

save(support_treat, support_treat_att, support_treat_ideo5_dbl,
	 support_treat_ideo5_dbl_att, support_treat_x_ideo5_dbl,
	 support_treat_x_ideo5_dbl_att, support_pid3_dbl, support_pid3_dbl_att,
	 support_x_pid3_dbl, support_x_pid3_dbl_att, support_treat_pvote,
	 support_treat_pvote_att, support_treat_x_pvote, support_treat_x_pvote_att,
	 interests_all, interests_att, interests_treat_ideo5_dbl,
	 interests_treat_ideo5_dbl_att, interests_treat_x_ide5_dbl,
	 interests_treat_x_ideo5_dbl_att, interests_treat_pid3,
	 interests_treat_pid3_att, interests_treat_x_pid3,
	 interests_treat_x_pid3_att, interests_treat_pvote,
	 interests_treat_pvote_att, interests_treat_x_pvote,
	 interests_treat_x_pvote_att, values_treat_all, values_treat_att,
	 values_treat_ideo5_dbl, values_treat_ideo5_dbl_att,
	 values_treat_x_ideo5_dbl, values_treat_x_ideo5_dbl_att, values_treat_pid3,
	 values_treat_pid3_att, values_treat_x_pid3, values_treat_x_pid3_att,
	 values_treat_pvote, values_treat_pvote_att, values_treat_x_pvote,
	 values_treat_x_pvote_att, pca_all, pca_att, pca_treat_ideo5_dbl,
	 pca_treat_ideo5_dbl_att, pca_treat_x_ideo5_dbl, pca_treat_x_ideo5_dbl_att,
	 pca_treat_pid3, pca_treat_pid3_att, pca_treat_x_pid3,
	 pca_treat_x_pid3_att, pca_treat_pvote, pca_treat_pvote_att,
	 pca_treat_x_pvote, pca_treat_x_pvote_att, file="../data/models.Rdata")


