library(tidyverse)
library(readxl)

president_polls <- read_excel("data/president_polls.xlsx", 
                              col_types = c("numeric", "numeric", "numeric", 
                                            "text", "numeric", "text", "numeric", 
                                            "text", "text", "numeric", "text", 
                                            "text", "numeric", "text", "text", 
                                            "text", "text", "numeric", "numeric", 
                                            "date", "date", "date", "text", "numeric", 
                                            "text", "numeric", "numeric", "numeric", 
                                            "date", "text", "text", "text", "numeric", 
                                            "text", "numeric", "text", "text", 
                                            "numeric"))

president_polls %>%
  filter(
    answer %in% c("Biden","Trump") &
    end_date > "2020-03-01"
  ) %>%
  group_by(end_date, state, answer) %>%
  summarise(
    mean_pct = mean(pct)      
  ) %>%
  ggplot(aes(end_date, mean_pct, fill = answer, color = answer)) +
    geom_line() +
    facet_wrap(vars(state))
