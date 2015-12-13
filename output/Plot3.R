############################################################
##   Exploratory Data Analys Module - Project 1 - Plot 3  ##
##   "Please be gentle with me ... I am only beginner!    ##
############################################################

# Read data
hpc <- read.table("household_power_consumption.txt", header=T,sep=";", na.string="?")

# Create subset
hpc1 <- hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

# Create New POSIX Date Variable
hpc1$Date2 <- strptime(paste(hpc1$Date, hpc1$Time, sep=" "),
                       format = "%d/%m/%Y %H:%M:%S")

# Convert required data to numeric format
hpc1$Global_active_power <- as.numeric(hpc1$Global_active_power)

# Plot Chart
png("plot3.png", width=480, height=480)

plot(hpc1$Date2, hpc1$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(hpc1$Date2, hpc1$Sub_metering_2,col="red")
lines(hpc1$Date2, hpc1$Sub_metering_3,col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col = c(1,2,4))

dev.off()
