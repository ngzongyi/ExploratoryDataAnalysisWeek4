library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

baltimoredata <- subset(NEI, fips == "24510")
baltimore_cardata <- baltimoredata[baltimoredata$type == "ON-ROAD",]

sumofcarbyyear <- aggregate(baltimore_cardata$Emissions, by = list(year = baltimore_cardata$year), FUN = sum)
head(sumofcarbyyear)


with(sumofcarbyyear, plot(year, x, type = 'l', xlab = 'Year', ylab = 'Total Emission of PM2.5', main = 'Baltimore Emission of Cars'))

png("plot5.png", height = 480, width = 480)
dev.off()
