############################################################
##   Exploratory Data Analys Module - Project 1 - Plot 1  ##
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
png("plot1.png", width=480, height=480)
hist(hpc1$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     border="black",
     col="red")
dev.off()
