series1_df <- spl_df %>%
  select(date, Checkouts, Title) %>%
  filter(str_detect(Title, "Throne of Glass"))

series1_df$Title[str_detect(series1_df$Title, "(?i)Crown")] <- "Book 2: Crown of Midnight"
series1_df$Title[str_detect(series1_df$Title, "(?i)Heir")] <- "Book 3: Heir of Fire"
series1_df$Title[str_detect(series1_df$Title, "(?i)Queen")] <- "Book 4: Queen of Shadows"
series1_df$Title[str_detect(series1_df$Title, "(?i)Empire")] <- "Book 5: Empire of Storms"
series1_df$Title[str_detect(series1_df$Title, "(?i)Dawn")] <- "Book 6: Tower of Dawn"
series1_df$Title[str_detect(series1_df$Title, "(?i)Kingdom")] <- "Book 7: Kingdom of Ash"
series1_df$Title[str_starts(series1_df$Title, "(?i)Throne of Glass")] <- "Book 1: Throne of Glass"
series1_df$Title[str_starts(series1_df$Title, "(?i)The Assassin")] <- "The Assassin"

tog_df <- series1_df %>%
  mutate(Title = na_if(series1_df$Title, "The Assassin")) %>%
  drop_na(Title)

tog_checkouts_per_month <- tog_df %>%
  group_by(Title, date) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = T))

tog_chart <- ggplot(tog_checkouts_per_month) +
  geom_line(mapping = aes(
    x = date,
    y = total_checkouts,
    group = Title,
    color = Title,
    text = paste0("Title:", Title, ", ", total_checkouts),
    text2 = date
  )) +
  labs(
    title = "Throne of Glass Series Checkouts",
    x = "Dates",
    y = "Checkouts",
    color = "Books"
  ) +
  scale_x_date(NULL,
    breaks = scales::breaks_width("2 years"),
    labels = scales::label_date("'%y")
  )

ggplotly(tog_chart, tooltip = c("text", "text2"))
