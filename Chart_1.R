
series1_df <- spl_df %>% 
  select(date, Checkouts, Title) %>% 
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
  
checkouts_per_month <- tog_df %>% 
  group_by(Title, date) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = T))

tog_chart <- ggplot(data = checkouts_per_month) +
  geom_line(mapping = aes(x = date, 
                          y = total_checkouts,
                          group = Title,
                          color = Title,
                          text = paste0("Title:", Title, ", ", total_checkouts),
                          text2 = paste("Date:", date))) +
  labs(title = "Throne of Glass Series Checkouts",
       x = "Dates",
       y = "Checkouts",
       color = "Books") +
  scale_x_date(NULL,
               breaks = scales::breaks_width("2 years"),
               labels = scales::label_date("'%y"))

ggplotly(tog_chart, tooltip = c("text", "text2"))

