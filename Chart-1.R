library(dplyr)

series1_df <- spl_df %>% 
  select(CheckoutYear, CheckoutMonth, Checkouts, Title, Creator, date) %>% 
  filter(str_detect(Title, "Throne of Glass")) 

series1_df$Title[str_detect(series1_df$Title, "Crown of Midnight")] <- "Crown of Midnight"
series1_df$Title[str_detect(series1_df$Title, "Heir of Fire")] <- "Heir of Fire"
series1_df$Title[str_detect(series1_df$Title, "Queen of Shadows")] <- "Queen of Shadows"
series1_df$Title[str_detect(series1_df$Title, "Empire of Storms")] <- "Empire of Storms"
series1_df$Title[str_detect(series1_df$Title, "Tower of Dawn")] <- "Tower of Dawn"
series1_df$Title[str_detect(series1_df$Title, "Kingdom of Ash")] <- "Kingdom of Ash"
series1_df$Title[str_starts(series1_df$Title, "Throne of Glass")] <- "Throne of Glass"
series1_df$Title[str_starts(series1_df$Title, "The Assassin")] <- "The Assassin"

series1_pt2 <- series1_df %>% 
  mutate(Title = na_if(series1_df$Title, "The Assassin")) %>% 
  drop_na(Title)
  
checkouts_per_month <- series1_pt2 %>% 
  group_by(Title, date) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = T))

ggplot(data = checkouts_per_month) +
  geom_line(mapping = aes(x = date, 
                y = total_checkouts,
                group = Title,
                color = Title))

