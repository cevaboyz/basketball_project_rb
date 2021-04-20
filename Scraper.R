## Scraping Stats 

require(polite)
library(polite)
library(rvest)
library(dplyr)

url <- "https://fip-web.azurewebsites.net/PlayerStats.aspx?Type=T&id=252&rg=LO"

session <- bow(url, user_agent = "cevaboyz")

totalstat2020 <- scrape(session) %>% html_nodes("table.ElencoGiocatori")

test <- html_table(totalstat2020)

test2 <- as.data.frame(test)


test2 <- test2 %>% rename(Player=X1)
test2 <- test2 %>% rename(Player_Name_Compact=X2)
test2 <- test2 %>% rename(Team=X3)
test2 <- test2 %>% rename(City=X4)
test2 <- test2 %>% rename(Game_Started=X5)
test2 <- test2 %>% rename(Games_Played=X6)
test2 <- test2 %>% rename(Minutes=X7)
test2 <- test2 %>% rename(Points=X8)
test2 <- test2 %>% rename(Two_Point_Made=X9)
test2 <- test2 %>% rename(Two_Point_Attempted=X10)
test2 <- test2 %>% rename(Two_Point_Percentage=X11)
test2 <- test2 %>% rename(Three_Point_Made=X12)
test2 <- test2 %>% rename(Three_Point_Attempted=X13)
test2 <- test2 %>% rename(Three_Point_Percentage=X14)
test2 <- test2 %>% rename(Free_Throws_Made=X15)
test2 <- test2 %>% rename(Free_Throws_Attempted=X16)
test2 <- test2 %>% rename(Free_Throws_Percentage=X17)
test2 <- test2 %>% rename(Defensive_Rebounds=X18)
test2 <- test2 %>% rename(Offensive_Rebounds=X19)
test2 <- test2 %>% rename(Total_Rebounds=X20)
test2 <- test2 %>% rename(Turnovers=X21)
test2 <- test2 %>% rename(Steals=X22)
test2 <- test2 %>% rename(Blocks_against=X23)
test2 <- test2 %>% rename(Blocks=X24)
test2 <- test2 %>% rename(Assists=X25)
test2 <- test2 %>% rename(Personal_Fouls=X26)
test2 <- test2 %>% rename(Personal_Fouls_Drawn=X27)
test2 <- test2 %>% rename(Efficiency=X28)

test2 <- subset(test2, select = -c(29,30,31))

test2 <- test2[3:nrow(test2),]

write.csv(test2, file = "stats2019_2020")