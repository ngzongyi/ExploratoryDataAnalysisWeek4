NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sum_by_year <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

plot(sum_by_year$year, sum_by_year$x, type = "l", 
     main = "Total Emissions of PM2.5",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")

png("plot1.png", height = 480, width = 480)
dev.off()
