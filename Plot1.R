# Script to read the dataset and output plot1.png

# Initialize 
inputfile <- "household_power_consumption.txt"
outputfile <- "plot1.png"
workingdirectory <- "~/R/Projecten/Coursera/ExData_Plotting1"

# Set working directory
setwd(workingdirectory)

# Read the dataset
mydata <- read.table(inputfile,na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE)

# only keep 2017-02-01 and 2017-02-02
mydata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007", ]

# Convert Date and Time string to POSIXct DateTime format
mydata$DateTime <- as.POSIXct(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)

png(outputfile,width=480,height=480)
hist(mydata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
