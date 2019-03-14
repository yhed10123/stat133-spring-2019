#title: shots data 
#description: New shots data 
#input(s): data file "stephen-curry.csv","klay-thompson.csv","kevin-durant.csv","draymond-green.csv","andre-iguodala.csv"
#output(s): data file "make-shots-data-script.R"

curry <- read.csv("./data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("./data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("./data/kevin-durant.csv", stringsAsFactors = FALSE)
green <- read.csv("./data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("./data/andre-iguodala.csv", stringsAsFactors = FALSE)

library("dpylr")
curry <- mutate(curry, name = "Stephen Curry")
thompson <- mutate(thompson, name = "Klay Thompson")
durant <- mutate(durant, name = "Kevin Durant")
green <- mutate(green, name = "Graymond Green")
iguodala <- mutate(iguodala, name = "Andre Iguodala")

curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"

durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"

green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"

curry <- mutate(curry, minute = period*12 - minutes_remaining)
thompson <- mutate(thompson, minute = period*12 - minutes_remaining)
durant <- mutate(durant, minute = period*12 - minutes_remaining)
green <- mutate(green, minute = period*12 - minutes_remaining)
iguodala <- mutate(iguodala, minute = period*12 - minutes_remaining)


sink(file = './output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = './output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = './output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = './output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = './workout01/output/draymond-green-summary.txt')
summary(green)
sink()

shots_data <- rbind(curry,thompson,durant,green,iguodala)

write.csv(shots_data, file = "./data/shots-data.csv")

sink(file = './output/shots-data-summary.txt')
summary(shots_data)
sink()
