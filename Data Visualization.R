library(tidyverse)
library(here)

influencers <- read.csv(here("activity_data","updated_instagram.csv"))
view(influencers)

ggplot(data = influencers, aes(x = influencer_insta_name, y = followers)) +
  geom_col()

influencers_small <- influencers %>%
  filter(followers > 300000000)

influencers_small %>% View()

ggplot(data = influencers_small, aes(x = influencer_insta_name, y = followers)) +
  geom_col()

ggplot(data = influencers, aes(x = authentic_engagement, y = followers)) +
  geom_point()

influencers %>%
  group_by(category_1) %>%
  summarize(average = sum(followers)) %>%
  filter(average > 50000000) %>%
  ggplot(aes(x=category_1, y = average)) + geom_col()