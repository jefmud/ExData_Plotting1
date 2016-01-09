# script to create plot2
# exploratory data analysis, project 1

# the source data
source('./get_power_data.R')

# FUNCTION - do_plot_2()

do_plot_2 <- function(output_file=NULL) {
  # plot 2, Global Active Power y-axis, Day on x-axis
  with(pwr,
       plot(realtime,as.numeric(Global_active_power),
            xlab="",ylab="Global Active Power (kilowatts)", type="n"))
  with(pwr,lines(realtime,as.numeric(Global_active_power)))
  if (!is.null(output_file)) {
    # user supplied an output_file so, save it and close the device
    dev.copy(png,output_file)
    dev.off()
  }
}

par(mfrow=c(1,1))
do_plot_2('plot2.png')
