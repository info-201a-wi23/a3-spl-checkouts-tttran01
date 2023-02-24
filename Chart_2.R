
series2_df <- spl_df %>% 
  filter(str_detect(Title, "Harry Potter")) %>% 
  filter(str_detect(Creator, "Rowling"))

series2_df$Title[str_detect(series2_df$Title, "(?i)Stone")] <- "Sorcerer's Stone"
series2_df$Title[str_detect(series2_df$Title, "(?i)Secrets")] <- "Chamber of Secrets"
series2_df$Title[str_detect(series2_df$Title, "(?i)Azkaban")] <- "Prisoner of Azkaban"
series2_df$Title[str_detect(series2_df$Title, "(?i)Goblet")] <- "Goblet of Fire"
series2_df$Title[str_detect(series2_df$Title, "(?i)Phoenix")] <- "Order of the Phoenix"
series2_df$Title[str_detect(series2_df$Title, "(?i)Prince")] <- "Half-Blood Prince"
series2_df$Title[str_detect(series2_df$Title, "(?i)Hallows")] <- "Deathly Hallows"



# For faster rendering



ggplot(data = series2_df) +
  geom_line(aes(x=x_values,
                y = y_values))
