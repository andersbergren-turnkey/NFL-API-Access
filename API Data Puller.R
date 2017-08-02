library(nflscrapR)
library(tidyverse)
library(lubridate)

games <- season_games(2016)

NFL16 <- games %>%
  mutate(home_outcome = ifelse(homescore>awayscore,"win",
                               ifelse(homescore<awayscore,"lose","tie"))) %>%
  mutate(home_outcome = as.factor(home_outcome)) %>%
  mutate(days_from_start = date - ymd("2016-09-07")) %>%
  mutate(week = ceiling(days(days_from_start) / weeks(1))) %>%
  select(-days_from_start)