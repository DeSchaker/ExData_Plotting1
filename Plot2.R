# Script to read the dataset and output plot2.png

# Initialize 
inputfile <- "household_power_consumption.txt"
outputfile <- "plot2.png"
workingdirectory <- "~/R/Projecten/Coursera/ExData_Plotting1"

Sys.setlocale("LC_TIME", "English")  # Otherwise I get dutch day names in plot output

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

with(mydata,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Global Active Power(kilowatts)" ))
with(mydata,lines(DateTime,Global_active_power))

dev.off()
