#### Preamble ####
# Purpose: Tests the data from BTS_mean dataset
# Author: Joyce Xuan
# Date: 20 April 2023
# Contact: joyceruoxuan@gmail.com [
# License: MIT



#### Workspace setup ####
library(tidyverse)

#Reading in the data

BTS <- read_csv(here::here("inputs/data/BTS_mean.csv"), show_col_types = FALSE)


#Checking earliest releast year
BTS$album_release_year |> 
  min() == 2013

#Checking last release year
BTS$album_release_year |> 
  max() == 2022

#Checking that the album names are alphabetical characters
BTS$album_name |>
  class() == "character"








