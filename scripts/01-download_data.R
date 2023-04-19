#### Preamble ####
# Purpose: Downloads and saves the data from Spotify API
# Author: Joyce Xuan
# Data: 30 March 2023
# Contact: joyce.xuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Any other information needed? 


#### Workspace setup ####
library(tidyverse)
library(spotifyr)
library(usethis)

# Getting Data about Kpop Groups from Spotify

#### Download data ####
# Getting data about BTS, the #1 ranked Kpop Boy Group
BTS <- get_artist_audio_features("BTS")



#### Save data ####
# Saving BTS data
saveRDS(BTS, "inputs/data/BTS.rds")


         