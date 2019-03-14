#title: shots charts
#description: New shots charts 
#input(s): data file "stephen-curry.csv","klay-thompson.csv","kevin-durant.csv","draymond-green.csv","andre-iguodala.csv"
#output(s): data file "make-shot-charts-script.R"


library("jpeg")
library("grid")

court_file <- "./images/nba-court.jpg"

court_image <- rasterGrob(readJPEG(court_file),
                          width = unit(1, "npc"), 
                          height = unit(1, "npc"))

library("ggplot2")
thompson_scatterplot <- ggplot(data = thompson) + geom_point(aes(x = x, y = y, color = shot_made_flag))


thompson_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()

ggsave("./images/klay-thompson-charts.pdf", 
       plot = thompson_shot_chart,
       width = 6.5, height = 5, units = "in")

iguodala_scatterplot <- ggplot(data = iguodala) + geom_point(aes(x = x, y = y, color = shot_made_flag))


iguodala_shot_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart:Andre Iguodala (2016 season)') + theme_minimal()

ggsave("./images/andre-iguodala-shot-chart.pdf",
       plot = iguodala_shot_chart,
       width = 6.5, height = 5, units = "in")

curry_scatterplot <- ggplot(data = curry) + geom_point(aes(x = x, y = y, color = shot_made_flag))


curry_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart:Stephen Curry (2016 season)') + theme_minimal()

ggsave("./images/stephen-curry-shot-chart.pdf",
       plot = curry_shot_chart,
       width = 6.5, height = 5, units = "in")

klay_scatterplot <- ggplot(data = green) + geom_point(aes(x = x, y = y, color = shot_made_flag))


klay_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart:Draymond Green (2016 season)') + theme_minimal()

ggsave("./images/draymond-green-shot-chart.pdf",
       plot = klay_shot_chart,
       width = 6.5, height = 5, units = "in")

durant_scatterplot <- ggplot(data = durant) + geom_point(aes(x = x, y = y, color = shot_made_flag))


durant_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart:Kevin Durant (2016 season)') + theme_minimal()

ggsave("./images/kevin-durant-shot-charts.pdf", 
       plot = durant_shot_chart,
       width = 6.5, height = 5, units = "in")


shot_data_chart <- ggplot(data = shots_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +  facet_wrap(~ name) +
  ggtitle('Shot Chart: GSW (2016 season)') + theme_minimal()+theme(legend.position="top")+theme(legend.title = element_blank())


ggsave("./images/gsw-shot-charts.pdf", 
       plot = shot_data_chart,
       width = 8, height = 7, units = "in")

shot_data_chart <- ggplot(data = shots_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +  facet_wrap(~ name) +
  ggtitle('Shot Chart: GSW (2016 season)') + theme_minimal()+theme(legend.position="top")+theme(legend.title = element_blank())


ggsave("./images/gsw-shot-charts.png", 
       plot = shot_data_chart,
       width = 8, height = 7, units = "in")
