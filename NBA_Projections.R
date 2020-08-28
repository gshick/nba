
### Objective: Predict whether or not LeBron James will break the all time 
### NBA career point record and if so, when he will break the record

library(rvest)
library(dplyr)
library(ggplot2)

# year <- "2004"
player <- "jamesle01"

for (year in c("2004", "2005"))

{
url <- paste0("https://www.basketball-reference.com/players/j/", player, 
              "/gamelog/",year)

webpage <- read_html(url)

player <- webpage %>% 
  html_nodes("#pgl_basic") %>% 
  html_table()

datalist[[year]] <- player 

player_per_game <- as.data.frame(do.call(rbind, datalist), stringsAsFactors = FALSE)
}