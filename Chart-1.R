library(dplyr)

trend1_df <- spl_df %>% 
  filter(str_detect(Title, "Throne of Glass"))
  

ggplot(data = trend1_df) +
  geom_line(aes(x=x_values, y = y_values))
