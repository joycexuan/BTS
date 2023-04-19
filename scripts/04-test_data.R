#### Preamble ####
# Purpose: Tests the data from BTS_mean dataset
# Author: Joyce Xuan
# Date: 20 April 2023
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

BTS <- read_csv(here::here("inputs/data/BTS_mean.csv"), show_col_types = FALSE)

BTS$album_release_year |> 
  min() == 2013

BTS$album_release_year |> 
  max() == 2022

BTS$album_name |>
  class() == "character"








