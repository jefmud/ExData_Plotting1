# script to create plot1
# exploratory data analysis, project 1

# Source, get_power_data, which fills in the data.table "pwr"
source('./get_power_data.R')

# FUNCTION - do_plot_1()

do_plot_1 <- function(output_file=NULL,width=480,height=480) {
  # plot 1, histogram of Global Active Power REALTIME
  if (!is.null(output_file)) {
    # using png as the target
    png(output_file,width=width,height=height)
  }
  # now... time to plot
  hist(as.numeric(pwr$Global_active_power),
       col="red",xlab="Global Active Power (kilowatts)",
       ylab="Frequency", main="Global Active Power")
  if (!is.null(output_file)) {
    # user supplied an output_file so, save it and close the device
    dev.off()
  }
}

par(mfcol=c(1,1)) # set this to put single plot up
do_plot_1('plot1.png') #save to a file
do_plot_1() # show on screen
