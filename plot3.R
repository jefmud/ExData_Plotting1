# script to create plot3
# exploratory data analysis, project 1

# the source data
source('./get_power_data.R')

# FUNCTION - do_plot_3()

do_plot_3 <- function(output_file=NULL) {
  # plot 3, Energy sub metering y-axis, sub_metering_1, black
  # sub_metering_2, red; sub_metering_3, blue
  # x-axis realtime
  with(pwr,
       plot(realtime,as.numeric(Sub_metering_1),xlab="",ylab="Energy sub metering",
            type="n"))
  # put in the three lines
  with(pwr,lines(realtime,Sub_metering_1))
  with(pwr,lines(realtime,Sub_metering_2,col="red"))
  with(pwr,lines(realtime,Sub_metering_3,col="blue"))
  # add the legend
  legend("topright",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black","red","blue"), lty=c(1,1,1))
  if (!is.null(output_file)) {
    # user supplied an output_file so, save it and close the device
    dev.copy(png,output_file)
    dev.off()
  }
}

par(mfrow=c(1,1))
do_plot_3('plot3.png')
