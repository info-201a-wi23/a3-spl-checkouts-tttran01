
# - What is the month or year with the most/least checkouts for a book that you're interested in?
# - What is the month or year with the most/least checkouts for ebooks?
# - How has the number of print book checkouts changed over time?
# - How many observations (rows) are in your data?
# - How many features (columns) are in the data?


num_rows <- nrow(spl_df)

num_col <- ncol(spl_df)

sjm_total_checkouts <- spl_df %>% 
  filter(Creator %in% c(
    "Sarah J. Maas", 
    "Maas, Sarah J."
  )) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = T)) %>% 
  pull(total_checkouts)

tbr_year <- spl_df %>% 
  filter(str_detect(Title, "Addie LaRue")) %>% 
  group_by(CheckoutYear) %>% 
  summarize(year_total = sum(Checkouts, na.rm = T)) %>% 
  filter(year_total == max(year_total)) %>% 
  pull(CheckoutYear)

tbr_checkouts <- spl_df %>% 
  filter(str_detect(Title, "Addie LaRue")) %>% 
  group_by(CheckoutYear) %>% 
  summarize(total = sum(Checkouts, na.rm = T)) %>% 
  filter(total == max(total)) %>% 
  pull(total)
