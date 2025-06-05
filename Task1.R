#Task 1
#Load library
library(tidyverse)
library(kableExtra)

#Load data
users <- read_csv("users.csv")
reviews <- read_csv("reviews.csv")

#Convert 'member_since' to date
users <- users %>%
  mutate(member_since = as.Date(member_since))

#Group users by join date
user <- user %>%
mutate(member_since = as.Date(member_since)) %>%
  mutate(user_group = case_when(
    is.na(member_since) ~ "Unknown",
member_since < as.Date("2017-01-01") ~ "Veteran",
member_since <= as.Date("2022-12-31") ~ "Intermediate",
member_since > as.Date("2022-12-31") ~ "New"
))

#Merge user and review data
joined_df <- reviews_df %>%
  left_join(users_df, by = "user_id") %>%
  filter(!is.na(stars), !is.na(user_group))

#Create summary statistics
summary.tbl <- joined_df %>%
  group_by(user_group) %>%
  summarise(
    num_users = n_distinct(user_id),
    avg_review_stars = round(mean(stars), 2),
    avg_reviews_per_user = round(n() / num_users, 2),
    .groups = "drop"
  )

#Print the summary table
summary_tbl %>%
  kable(col.names = c("User Group", "Number of Users", "Avergae Stars", "Review per User")) %>%
  kable_styling(bootstrap_options = c("stripped", "hover"), full_width = FALSE)

#Visualise the average review stars by user group
ggplot(summary_tbl, aes(x = user_group, y = avg_review_stars, fill = user_group))+
  geom_col()+
  labs(
    title = "Average Review Stars by Users Group",
    x = "User Group", 
    y = "Average Stars") +
  theme_minimal()
 
