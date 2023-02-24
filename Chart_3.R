author_df <- spl_df %>%
  select(date, Checkouts, Creator) %>%
  filter(Creator %in% c(
    "Victoria Aveyard", "Aveyard, Victoria",
    "Sarah J. Maas", "Maas, Sarah J."
  ))


author_df$Creator[str_detect(author_df$Creator, "Aveyard")] <- "Victoria Aveyard"
author_df$Creator[str_detect(author_df$Creator, "Sarah")] <- "Sarah J. Maas"


author_checkouts_per_month <- author_df %>%
  group_by(date, Creator) %>%
  summarise(checkouts = sum(Checkouts, na.rm = T))

author_chart <- ggplot(data = author_checkouts_per_month) +
  geom_line(aes(
    x = date,
    y = checkouts,
    color = Creator
  )) +
  labs(
    title = "Author Checkouts",
    x = "Date",
    y = "Checkouts",
    color = "Authors"
  )

ggplotly(author_chart)
