
series1_df <- spl_df %>% 
  select(CheckoutYear, Checkouts, Title, Creator) %>% 
  filter(str_detect(Title, "Throne of Glass")) 

series1_df$Title[str_detect(series1_df$Title, "(?i)Crown")] <- "Crown of Midnight"
series1_df$Title[str_detect(series1_df$Title, "(?i)Heir")] <- "Heir of Fire"
series1_df$Title[str_detect(series1_df$Title, "(?i)Queen")] <- "Queen of Shadows"
series1_df$Title[str_detect(series1_df$Title, "(?i)Empire")] <- "Empire of Storms"
series1_df$Title[str_detect(series1_df$Title, "(?i)Dawn")] <- "Tower of Dawn"
series1_df$Title[str_detect(series1_df$Title, "(?i)Kingdom")] <- "Kingdom of Ash"
series1_df$Title[str_starts(series1_df$Title, "(?i)Throne of Glass")] <- "Throne of Glass"
series1_df$Title[str_starts(series1_df$Title, "(?i)The Assassin")] <- "The Assassin"

tog_df <- series1_df %>% 
  mutate(Title = na_if(series1_df$Title, "The Assassin")) %>% 
  drop_na(Title)
  
checkouts_per_year <- tog_df %>% 
  group_by(Title, CheckoutYear) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = T))

# Make x-axis easier to see
tog_chart <- ggplot(data = checkouts_per_year) +
  geom_line(mapping = aes(x = CheckoutYear, 
                y = total_checkouts,
                group = Title,
                color = Title,
                text = paste0("Title:", Title, ", ", total_checkouts))) +
  labs(title = "Throne of Glass Series Checkouts",
       x = "Dates",
       y = "Checkouts",
       color = "Books") +
  scale_x_continuous(breaks = seq(2012, 2025, 1))

ggplotly(tog_chart, tooltip = "text")

