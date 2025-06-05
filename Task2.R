#Task 2
#Load libaries
library(tidyverse)
library(kableExtra)

#Load data
businesses_df <- read_csv("businesses.csv")
reviews_df <- read_csv("reviews.csv")

#Merge review data with business data on business_id
review_state_df <- reviews_df %>%
  left_join(businesses_df, by = "business_id") %>%
  filter(!is.na(stars), !is.na(state))

#Group by state and summerise
summary_state <- review_state_df %>%
  group_by(state) %>%
  summarise(
    avg_review_stars = round(mean(stars), 2),
    total_reviews = n(),
    unique_users = n_distinct(user_id),
    .groups = "drop"
  ) %>%
  arrange(desc(avg_review_stars))

#Print the summary table
summary_state %>%
  kable(col.names = c("State", "Average Stars", "Total Reviews", "Unique Users")) %>%
  kable_styling(bootstrap_options = c("striped", "hover"), full_width = FALSE)

#Visualise
ggplot(summary_state, aes(x = reorder(state, -avg_review_stars), y = avg_review_stars, fill = state)) +
  geom_col(show.legend = FALSE) +
  labs(
    title = "Average Review Stars by State",
    x = "State",
    y = "Average Review Stars"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


