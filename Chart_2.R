series2_df <- spl_df %>%
  filter(str_detect(Title, "Harry Potter")) %>%
  filter(str_detect(Creator, "Rowling"))

series2_df$Title[str_detect(series2_df$Title, "(?i)Stone")] <- "Sorcerer's Stone"
series2_df$Title[str_detect(series2_df$Title, "(?i)Philo")] <- "Sorcerer's Stone"
series2_df$Title[str_detect(series2_df$Title, "(?i)Hallow")] <- "Deathly Hallows"

hp_df <- series2_df %>%
  filter(Title %in% c("Sorcerer's Stone", "Deathly Hallows")) %>%
  group_by(Title, date) %>%
  summarise(total_checkouts = sum(Checkouts, na.rm = T))

hp_chart <- ggplot(hp_df) +
  geom_col(aes(
    x = date,
    y = total_checkouts,
    fill = Title
  )) +
  labs(
    title = "Harry Potter Sorcerer's Stone vs Deathly Hallows",
    x = "Date",
    y = "Checkouts",
    fill = "Book"
  )

ggplotly(hp_chart)
