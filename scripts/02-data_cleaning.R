#### Preamble ####
# Purpose: Cleans
# Author: Joyce Xuan
# Data: 30 March 2023
# Contact: joyce.xuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to Spotift API

#### Workspace setup ####
library(tidyverse)
library(here)
library(dplyr)

#### Clean data ####

#Retrieving data
BTS <- readRDS("inputs/data/BTS.rds")

#Removing duplicate tracks
BTS <- BTS[order(BTS$album_release_year),]
BTS <- BTS[!duplicated(BTS$track_name),]
BTS <- BTS %>% 
  filter(!grepl('Japanese', track_name)) %>% 
  filter(!grepl('Mix', track_name)) %>% 
  filter(!grepl('Remix', track_name))

#Removing duplicate Japanese language tracks and only keeping unique ones
library(cld3)
korean <- subset(BTS, detect_language(BTS$track_name) == "ko")
japanese <- subset(BTS, detect_language(BTS$track_name) == "ja")

japanese <- japanese[-c(3:4),]

BTS <- BTS[!(BTS$track_name %in% korean$track_name),]
BTS <- BTS[!(BTS$track_name %in% japanese$track_name),]

#Manually removing the duplicate tracks that were not taken out
BTS <- BTS %>% 
  filter(!grepl('시차', track_name)) %>% 
  filter(!grepl("6aIJhrO0Y4zeDLxLkj2NXk", track_id)) %>% 
  filter(!grepl("7lrqvdivAYRGEiO8JFP31G", track_id)) %>% 
  filter(!grepl("0aE3V0zgSD2YwkEHW42gxG", track_id)) %>% 
  filter(!grepl("Dimple", track_name)) %>% 
  filter(!grepl("FOR YOU", track_name)) %>% 
  filter(!grepl("INTRODUCTION : YOUTH", track_name)) %>% 
  filter(!grepl("Wishing on a star", track_name)) %>% 
  filter(!grepl("Boy In Luv", track_name)) %>% 
  filter(!grepl("RUN", track_name)) %>% 
  filter(!grepl("Burning Up (FIRE)", track_name)) %>% 
  filter(!grepl("Good Day", track_name)) %>% 
  filter(!grepl("INTRO.", track_name)) %>% 
  filter(!grepl("THE STARS", track_name)) %>% 
  filter(!grepl("WAKE UP", track_name)) %>% 
  filter(!grepl("OUTRO.", track_name)) 

#Renaming album names to be more simple 
BTS <- BTS |> mutate(
  album_name =
    recode(
      album_name,
      "MAP OF THE SOUL : 7 ~ THE JOURNEY ~" = "MOTS_Journey",
      "MAP OF THE SOUL : 7" = "MOTS_7",
      "MAP OF THE SOUL : PERSONA" = "MOTS_Persona",
      "Love Yourself 結 'Answer'" = "LY_Answer",
      "Love Yourself 轉 'Tear'" = "LY_Tear",
      "Love Yourself 承 'Her'" = "LY_Her",
      "You Never Walk Alone" = "You_Never_Walk_Alone",
      "화양연화 Young Forever" = "Young_Forever",
      "화양연화 Pt.2" = "HYYH2",
      "The Most Beautiful Moment in Life Pt.2" = "HYYH2",
      "화양연화 Pt.1" = "HYYH",
      "The Most Beautiful Moment in Life Pt.1" = "HYYH",
      "Wake Up (Standard Edition)" = "Wake_Up",
      "Skool Luv Affair (Special Addition)" = "Skool_Luv_Affair",
      "2 Cool 4 Skool" = "2_Cool_4_Skool",
      "FACE YOURSELF" = "Face_Yourself",
      "Dark & Wild" = "Dark_Wild",
      "O!RUL8,2?" = "ORUL"
    )
  )
  

#Finding the average danceability of BTS albums
dance <- BTS %>%  
  group_by(album_name, album_release_date, album_release_year) %>%  
  summarise(avg_dance = mean(danceability))

dance <- dance[order(dance$album_release_date),]

#Finding the average energy of BTS albums
energy <- BTS %>%  
  group_by(album_name, album_release_date, album_release_year) %>%  
  summarise(avg_energy = mean(energy))

energy <- energy[order(energy$album_release_date),]

#Finding the average speechiness of BTS albums 
speechiness <- BTS %>%  
  group_by(album_name, album_release_date, album_release_year) %>%  
  summarise(avg_speechiness = mean(speechiness))

speechiness <- speechiness[order(speechiness$album_release_date),]

#### Save data ####

#Saving the cleaned data
write_csv(dance, "inputs/data/dance_mean.csv")
write_csv(energy, "inputs/data/energy_mean.csv")
write_csv(speechiness, "inputs/data/speechiness_mean.csv")
write_csv(BTS, "inputs/data/BTS_mean.csv")


