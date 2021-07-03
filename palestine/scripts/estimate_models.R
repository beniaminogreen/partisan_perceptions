library("tidyverse")
library("haven")
library("lubridate")

data <- read_spss("../data/UCL_Palestine_US_client.sav")

data2 <- data %>%
	mutate(
		# Attentiveness Variables
		time_spent = starttime %--% endtime,
		seconds_spent = time_spent / dseconds(1),
		# female_variable
		female = gender == 2,
		ideo5_dbl = na_if(ideo5, 6) -3
		) %>%
	# Mutating labelled double responses to character
	mutate_at(c("race", "educ", "ideo5", "pid3", "profile_gross_household", "profile_gross_household_r", "marital_stat", "presvote20post", "region"),
			  ~ .x  %>% as_factor() %>% as.character) %>%
	# Mutating responses so positive is agreement
	mutate_at(c("UCL_1", "UCL_2", "UCL_3"),  ~ 4 - as.numeric(.x)) %>%
	mutate(
	   UCLsplit2  = UCLsplit2 %>%
	   dplyr::recode(
			`1` = "Control",
			`2` = "National security",
			`3` = "Prevent humanitarian crisis",
			`4` = "Uphold international law",
			`5` = "Counter racial injustice"
	   )) %>%
	rename(
		   treat = UCLsplit2,
		   support = UCL_1,
		   american_interests = UCL_2,
		   american_values = UCL_3)

# Check no observations were lost
stopifnot(nrow(data)==nrow(data2))

attentive <- data2 %>%
	filter(seconds_spent > 10, seconds_spent < 300)

# check that pruning was performed
stopifnot(nrow(attentive) < nrow(data2))


## ________
##< MODELS >
## --------
##      \                    / \  //\
##       \    |\___/|      /   \//  \\
##            /0  0  \__  /    //  | \ \
##           /     /  \/_/    //   |  \  \
##           @_^_@'/   \/_   //    |   \   \
##           //_^_/     \/_ //     |    \    \
##        ( //) |        \///      |     \     \
##      ( / /) _|_ /   )  //       |      \     _\
##    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
##  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
## (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
## (( /// ))      `.   {            }                   /      \  \
##  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
##             ///.----..>        \             _ -~             `.  ^-`  ^-_
##               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
##                                                                  /.-~

# Estimate support
# Support on treatment
support_treat <- lm(support ~ treat, data = data2)
support_treat_att <- lm(support ~ treat, data = attentive)

# Support on treatment + numeric ideology
support_treat_ideo5_dbl <- lm(support ~ treat+ideo5_dbl, data = data2)
support_treat_ideo5_dbl_att <- lm(support ~ treat+ideo5_dbl, data = attentive)

# Support on treatment * numeric ideology
support_treat_x_ideo5_dbl <- lm(support ~ treat*ideo5_dbl, data = data2)
support_treat_x_ideo5_dbl_att <- lm(support ~ treat*ideo5_dbl, data = attentive)

# Support on treatment + party id
support_pid3_dbl <- lm(support ~ treat+pid3, data = data2)
support_pid3_dbl_att <- lm(support ~ treat+pid3, data = attentive)

# Support on treatment * party id
support_x_pid3_dbl <- lm(support ~ treat*pid3, data = data2)
support_x_pid3_dbl_att <- lm(support ~ treat*pid3, data = attentive)

# Support on treatment + presidential vote in 2020
support_treat_pvote <- lm(support ~ treat+presvote20post, data = data2)
support_treat_pvote_att <- lm(support ~ treat+presvote20post, data = attentive)

# Support on treatment * presidential vote in 2020
support_treat_x_pvote <- lm(support ~ treat*presvote20post, data = data2)
support_treat_x_pvote_att <- lm(support ~ treat*presvote20post, data = attentive)

# Models on American Interests
# Interests on treatment
interests_all <- lm(american_interests ~ treat, data = data2)
interests_att <- lm(american_interests ~ treat, data = attentive)

#interests on treatment + numeric ideology
interests_treat_ideo5_dbl <- lm(american_interests ~ treat+ideo5_dbl, data = data2)
interests_treat_ideo5_dbl_att <- lm(american_interests ~ treat+ideo5_dbl, data = attentive)

#interests on treatment * numeric ideology
interests_treat_x_ide5_dbl <- lm(american_interests ~ treat*ideo5_dbl, data = data2)
interests_treat_x_ideo5_dbl_att <- lm(american_interests ~ treat*ideo5_dbl, data = attentive)

# Interests on treatment + party ID
interests_treat_pid3 <- lm(american_interests ~ treat+pid3, data = data2)
interests_treat_pid3_att <- lm(american_interests ~ treat+pid3, data = attentive)

# Interests on treatment * party ID
interests_treat_x_pid3 <- lm(american_interests ~ treat*pid3, data = data2)
interests_treat_x_pid3_att <- lm(american_interests ~ treat*pid3, data = attentive)

# Interests on treatment * 2020 presidential vote
interests_treat_pvote <- lm(american_interests ~ treat+presvote20post, data = data2)
interests_treat_pvote_att <- lm(american_interests ~ treat+presvote20post, data = attentive)

# Interests on treatment + 2020 presidential vote
interests_treat_x_pvote <- lm(american_interests ~ treat*presvote20post, data = data2)
interests_treat_x_pvote_att <- lm(american_interests ~ treat*presvote20post, data = attentive)

# American values on treat
values_treat_all <- lm(american_values ~ treat, data = data2)
values_treat_att <- lm(american_values ~ treat, data = attentive)

# American values on treat + numeric ideology
values_treat_ideo5_dbl <- lm(american_values ~ treat+ideo5_dbl, data = data2)
values_treat_ideo5_dbl_att <- lm(american_values ~ treat+ideo5_dbl, data = attentive)

# American values on treat * numeric ideology
values_treat_x_ideo5_dbl <- lm(american_values ~ treat*ideo5_dbl, data = data2)
values_treat_x_ideo5_dbl_att <- lm(american_values ~ treat*ideo5_dbl, data = attentive)

# American values on treat + party id
values_treat_pid3 <- lm(american_values ~ treat+pid3, data = data2)
values_treat_pid3_att <- lm(american_values ~ treat+pid3, data = attentive)

# American values on treat * party id
values_treat_x_pid3 <- lm(american_values ~ treat*pid3, data = data2)
values_treat_x_pid3_att <- lm(american_values ~ treat*pid3, data = attentive)

# American values on treat + 2020 presidential vote
values_treat_pvote <- lm(american_values ~ treat+presvote20post, data = data2)
values_treat_pvote_att <- lm(american_values ~ treat+presvote20post, data = attentive)

# American values on treat * 2020 presidential vote
values_treat_x_pvote <- lm(american_values ~ treat*presvote20post, data = data2)
values_treat_x_pvote_att <- lm(american_values ~ treat*presvote20post, data = attentive)


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
	 values_treat_x_pvote_att, data2, attentive, file="../data/models.Rdata")

