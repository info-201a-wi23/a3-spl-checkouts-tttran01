library(dplyr)


trend3_df <- spl_df %>% 
  

y_values <- seq(1,3)

ggplot(data = trend3_df) +
  geom_line(aes(x=x_values, y = y_values))
