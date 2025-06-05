#Task 4
#Load libaries
library(tidyverse)
library(kableExtra)

#Load data
users_df <- read_csv("users.csv")
reviews_df <- read_csv("reviews.csv")

#Convert join date and group users
users_df <- users_df %>%
  mutate(member_since = as.Date(member_since)) %>%
  mutate(group_2020 = case_when(
    is.na(member_since) ~ "Unknown",
    member_since < as.Date("2020-01-01") ~ "Before 2020",
    TRUE ~ "From 2020"
  ))

#Join reviews and calculate review length
reviews_joined <- reviews_df %>%
  left_join(users_df, by = "user_id") %>%
  filter(!is.na(stars), !is.na(text), !is.na(group_2020)) %>%
  mutate(review_length = nchar(text))

#Summarise average stars and review length per group
summary_2020 <- reviews_joined %>%
  group_by(group_2020) %>%
  summarise(
    avg_stars = round(mean(stars), 2),
    avg_review_length = round(mean(review_length), 2),
    .groups = "drop"
  )

#Print summary table
summary_2020 %>%
  kable(col.names = c("User Group", "Average Stars", "Average Review Length")) %>%
  kable_styling(bootstrap_options = c("striped", "hover"), full_width = FALSE)

#Visualise
ggplot(summary_2020, aes(x = group_2020, y = avg_review_length, fill + group_2020)) +
  geom_col(show.legend = FALSE) +
  labs(
    title= "Average Review Length by User Group (Before vs After 2020)",
    x = "User Group",
    y = "Average Review Length (characters)"
  )+
  theme_minimal()

