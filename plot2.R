NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

str(NEI)
baltimoredata <- subset(NEI, fips == "24510")

sumbyyear <- aggregate(baltimoredata$Emissions, by = list(year = baltimoredata$year), sum)

with(sumbyyear, plot(year, x, type = 'l', xlab = 'Year', ylab = 'Total Emissions of PM2.5', main = "PM2.5 of Baltimore City"))

png("plot2.png", height = 480, width = 480)
dev.off()
