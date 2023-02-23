
series2_df <- spl_df %>% 
  drop_na(Checkouts) %>% 
  group_by(Title) %>% 
  filter(str_detect(Title, "Harry Potter")) 

# For faster filtering
series2_df <- series2_df %>% 
  filter(str_detect(Creator, "Rowling"))


ggplot(data = series2_df) +
  geom_line(aes(x=x_values,
                y = y_values))
