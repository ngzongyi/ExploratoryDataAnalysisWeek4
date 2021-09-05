library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SSC <- readRDS("Source_Classification_Code.rds")

grepl("coal", SSC$Short.Name, ignore.case = T)

coal_ssc <- SSC[grepl("coal", SSC$Short.Name, ignore.case = T),]

coal_emission <- NEI[NEI$SCC %in% coal_ssc$SCC, ]

sumbyyear_coal <- aggregate(coal_emission$Emissions, by = list(year = coal_emission$year), FUN = sum)

with(sumbyyear_coal, plot(year, x, type = 'l', xlab = "Year",
                          ylab = 'Total Emission PM2.5 by Coal Related', 
                          main = 'Emissions by Coal Combustion Related Sources'))

png("plot4.png", height = 480, width = 480)
dev.off()

