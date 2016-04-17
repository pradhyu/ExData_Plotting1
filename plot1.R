source("load_project_data.R")

# Above script load_project_data.R loads the summary data to data.loaded
# data.loaded only contains data from the dates 2007-02-01 and 2007-02-02.


plot1 <- paste(getwd(), "/plot1.png", sep = "")
png(plot1, width = 480, height = 480)
hist(
  data.loaded$Global_active_power,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  col = "red"
)
dev.off()

