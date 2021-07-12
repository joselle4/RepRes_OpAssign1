# Make a plot that answers the question: what is the relationship 
# between mean covered charges (Average.Covered.Charges) and mean 
# total payments (Average.Total.Payments) in New York?

# load library
library(ggplot2)
library(cowplot)

# set directories
filePayments <- paste0(getwd(), "/coursera/payments.csv")

# read data
payments <- read.csv(filePayments, header = TRUE)

# subset NY data
ny <- subset(payments, Provider.State == "NY")

# create plot and save as pdf
filePath <- paste0(getwd(), "/coursera/RepRes_OpAssign1/plot1.pdf")
gg <- ggplot(data = ny, aes(x = Average.Covered.Charges, y = Average.Total.Payments)) +
    geom_point(alpha = 1/3) +
    ggtitle("Mean Covered Charges vs Mean Total Payments in New York")
ggsave(filename = filePath, plot = gg)