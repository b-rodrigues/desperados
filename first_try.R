library(tidyverse)
library(lubridate)
library(tsibble)

corona_data <- data.table::fread("https://raw.githubusercontent.com/RamiKrispin/coronavirus-csv/master/coronavirus_dataset.csv") %>%
  janitor::clean_names()

head(corona_data)

# Ignore regions

corona_data <- corona_data %>%
  group_by(type, country_region, date) %>%
  group_by(country_region, date, type) %>%
  summarise(cases = sum(cases)) 

list_datasets <- c("confirmed", "death", "recovered") %>%
  map(~filter(corona_data, type == .x))

confirmed <- list_datasets[[1]]

ts_corona_confirmed <- confirmed %>%
  group_by(country_region) %>%
  filter(cases != 0) %>%
  mutate(date = ymd(date)) %>%
  select(-type) %>%  
  ungroup() %>%  
  as_tsibble(key = country_region, index = date) %>%
  fill_gaps(cases = 0, .full = FALSE) %>%
  as_tibble() %>%  
  group_by(country_region) %>%
  mutate(id = 1) %>%
  mutate(id = cumsum(id)) %>%
  mutate(id = factor(id, ordered = TRUE))

ts_corona_confirmed %>%  
  filter(country_region %in% c("Italy", "Spain", "France", "Germany", "Belgium", "Luxembourg")) %>% 
  group_by(country_region) %>%
  nest() %>% 
  mutate(cumul_cases = map(data, ~cumsum(.$cases))) %>% 
  unnest(cols = c(data, cumul_cases)) %>% 
  ggplot() + 
  geom_line(aes(y = cumul_cases, x = id, colour = country_region, group = country_region)) +
  scale_y_log10() +
  ylab("Confirmed cases") +
  brotools::theme_blog()


