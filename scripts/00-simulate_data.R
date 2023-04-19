#### Preamble ####
# Purpose: Simulates the album name, average danceability, and album release year of BTS dance dataset
# Author: Joyce Xuan
# Data: 20 April 2023
# Contact: joyceruoxuan@gmail.com
# License: MIT
# Pre-requisites: Spotify API Account


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
album_name <- dance$album_name
set.seed(44)

#Simulating three columns from the dance dataset
bts_avg_data <- tibble(
  album_name = c(sample(album_name, 100, TRUE, NULL)),
  avg_dance = c(runif(100, 0, 1)),
  album_release_year = c(sample(2013:2022, 100, TRUE))
)
