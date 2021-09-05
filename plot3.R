library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

baltimoredata <- subset(NEI, fips == "24510")

sumbyyeartype <- aggregate(baltimoredata$Emissions, by = list(year = baltimoredata$year, type = baltimoredata$type), FUN = sum)

ggplot(sumbyyeartype) + geom_line(aes(year, x, color = type))

png("plot3.png", height = 480, width = 480)
dev.off()

coal_ssc <- SSC[grepl("coal", SSC$Short.Name, ignore.case = T),]
