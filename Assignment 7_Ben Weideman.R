#Library and Functions
library(tidyverse)
library(data.table) ## For the fread function
library(lubridate)
library(tictoc)
library(googledrive)

source("sepsis_monitor_functions.R")

#Task 2

# Test n = 50
tic()
sepsis50.fread.df <- makeSepsisDataset(n = 50, read_fn = "fread")
toc()

tic()
sepsis50.read_delim.df <- makeSepsisDataset(n = 50, read_fn = "read_delim")
toc()

# Test n = 100
tic()
sepsis100.fread.df <- makeSepsisDataset(n = 100, read_fn = "fread")
toc()

tic()
sepsis100.read_delim.df <- makeSepsisDataset(n = 100, read_fn = "read_delim")
toc()

# Test n = 150
tic()
sepsis150.fread.df <- makeSepsisDataset(n = 150, read_fn = "fread")
toc()

tic()
sepsis150.read_delim.df <- makeSepsisDataset(n = 150, read_fn = "read_delim")
toc()

#Task 3

df <- makeSepsisDataset()

# We have to write the file to disk first, then upload it
df %>% write_csv("sepsis_data_temp.csv")

# Uploading happens here
sepsis_file <- drive_put(media = "sepsis_data_temp.csv", 
                         path = "https://drive.google.com/drive/folders/1WKN5yNphFKZoxmvl8TqSUleLr97BLu_a",
                         name = "sepsis_data.csv")

# Set the file permissions so anyone can download this file.
sepsis_file %>% drive_share_anyone()



