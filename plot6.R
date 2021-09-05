library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

BAL_LA_data <- subset(NEI, fips == "24510" | fips == "06037")
BAL_LA_data_car <- BAL_LA_data[BAL_LA_data$type == "ON-ROAD",]

BAL_LA_sumbyfipsyear <- aggregate(BAL_LA_data_car$Emissions, by = list(year = BAL_LA_data_car$year, city = BAL_LA_data_car$fips), FUN = sum)

ggplot(BAL_LA_sumbyfipsyear) + geom_line(aes(year, x, color = city)) + ggtitle("LA vs Baltimore")

png("plot6.png", height = 480, width = 480)
dev.off()
