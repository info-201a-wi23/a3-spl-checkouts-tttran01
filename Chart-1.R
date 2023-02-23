
series1_df <- spl_df %>% 
  drop_na(Checkouts) %>% 
  group_by(Title) %>% 
  filter(str_detect(Title, "Throne of Glass"))

ggplot(data = series1_df) +
  geom_line(aes(x = x_values, 
                y = y_values,
                color = Title))
