#Task 3
#Load libaries
library(tidyverse)
library(kableExtra)

#Load data
users_df <- read_csv("users.csv")
reviews_df <- read_csv("reviews.csv")

#Identify top 10 Users by Review Count
top_users <- users_df %>%
  filter(!is.na(review_count)) %>%
  arrange(desc(review_count)) %>%
  slice(1:10)

#Merge top users with reviews
top_user_reviews <- reviews_df %>%
  filter(user_id %in% top_users$user_id) %>%
  left_join(select(users_df, user_id, name, review_count), by = "user_id") %>%
  filter(!is.na(stars))

#Summerise average stars for each top user
top_user_summary <- top_user_reviews %>%
  group_by(user_id, name) %>%
  summarise(
    total_reviews = n(),
    avg_stars = round(mean(stars), 2),
    .groups = "drop"
  ) %>%
  arrange(desc(total_reviews))

#Print summary table
top_user_summary %>%
  kable(col.names = c("User ID", "Name", "Total Reviews", "Average Stars")) %>%
  kable_styling(bootstrap_options = c("striped", "hover"), full_width = FALSE)

#Visualise
ggplot(top_user_reviews, aes(x = reorder(name, -review_count), y = stars, fill = name ))
geom_boxplot()+
  labs(
    title = "Star Rating Distribution of Top 10 Users",
    x = "User",
    y = "Review Stars"
  )+
  theme_minimal()+
 
