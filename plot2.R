# Make a plot (possibly multi-panel) that answers the question: 
# how does the relationship between mean covered charges 
# (Average.Covered.Charges) and mean total payments 
# (Average.Total.Payments) vary by medical condition 
# (DRG.Definition) and the state in which care was received 
# (Provider.State)?

# load library
library(ggplot2)
library(cowplot)

# set directories
filePayments <- paste0(getwd(), "/coursera/payments.csv")

# read data
payments <- read.csv(filePayments, header = TRUE)

# only get DRG by number
payments$drg <- sapply(strsplit(as.character(payments$DRG.Definition), " "), "[", 1)

# create plot and save as pdf
filePath <- paste0(getwd(), "/coursera/RepRes_OpAssign1/plot2.pdf")
gg <- ggplot(data = payments, aes(x = Average.Covered.Charges, y = Average.Total.Payments)) +
    geom_point(aes(colour = Provider.State)) + 
    facet_grid(DRG.Definition ~ Provider.State, space = "free", scales = "free_x", labeller=label_wrap_gen(width=.1)) + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
    ggtitle("Mean Covered Charges vs Mean Total Payments")
ggsave(filename = filePath, plot = gg)

# ggState <- ggplot(data = payments, aes(x = Average.Covered.Charges, y = Average.Total.Payments)) +
#     geom_point(aes(colour = factor(Provider.State))) + 
#     facet_grid(. ~ Provider.State) + 
#     theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
#     ggtitle("Mean Covered Charges vs Mean Total Payments by State")
# pgrid <- plot_grid(ggDRG, ggState, nrow = 2, align = "v")