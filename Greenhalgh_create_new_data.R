## -----------------------------------------
## load packages, set workspace
## -----------------------------------------

library(tidyverse)
library(here)

## -----------------------------------------
## load old data
## -----------------------------------------

df <- read_csv(here("activity_data","social media influencers - instagram.csv"))

View(df)

## -----------------------------------------
## fix column names
## -----------------------------------------

fix_fake_number <- function(old) {
  
  if(str_detect(old,"K")){
    temp <- old %>%
      str_replace("K","") %>%
      as.double()
    
    new <- temp * 1000
    return(new)
  }
  
  if(str_detect(old,"M")){
    temp <- old %>%
      str_replace("M","") %>%
      as.double()
    
    new <- temp * 1000000
    return(new)
  }
  
  return(old)
}

for(i in 1:length(df$followers)){
  df$followers[i] <- fix_fake_number(df$followers[i])
}

for(i in 1:length(df$authentic_engagement)){
  df$authentic_engagement[i] <- fix_fake_number(df$authentic_engagement[i])
}

for(i in 1:length(df$engagement_avg)){
  df$engagement_avg[i] <- fix_fake_number(df$engagement_avg[i])
  print(i)
}

df %>% write_csv(here("activity_data","updated_Instagram.csv"))



