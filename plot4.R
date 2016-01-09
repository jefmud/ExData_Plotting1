# script to create plot4
# exploratory data analysis, project 1

# the source data
source('./get_power_data.R')
source('./plot2.R')

# FUNCTION - do_plot_3a() (this is a slightly modified version of plot3 so legend works)
do_plot_3 <- function(output_file=NULL,width=480,height=480) {
  # plot 3, Energy sub metering y-axis, sub_metering_1, black
  # sub_metering_2, red; sub_metering_3, blue
  # x-axis realtime
  if (!is.null(output_file)) {
    # using png as the target
    png(output_file,width=width,height=height)
  }
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
         col=c("black","red","blue"), lty=c(1,1,1), bty="n")
  if (!is.null(output_file)) {
    # user supplied an output_file so, save it and close the device
    dev.off()
  }
}

# FUNCTION - do_plot_4()

do_plot_4a <- function() {
  # create a realtime voltage plot
  with(pwr,
       plot(realtime,Voltage,
            xlab="datetime", ylab="Voltage", type="n"))
  with(pwr, lines(realtime,as.numeric(Voltage)))
}

# FUNCTION do_plot_4b()
do_plot_4b <- function() {
  # create a realtime Global_reactive_power plot
  with(pwr,
       plot(realtime,Global_reactive_power,
            xlab="datetime", ylab="Global_reactive_power", type="n"))
  with(pwr, lines(realtime,as.numeric(Global_reactive_power)))
  
}
do_plot_4 <- function(output_file=NULL) {
  # set up 2 rows, 2 columns, adding in column order
  if (!is.null(output_file)) {
    # using png as the target
    png(output_file,width=480,height=480)
  }
  par(mfcol=c(2,2))
  do_plot_2()
  do_plot_3a()
  do_plot_4a()
  do_plot_4b()
  if (!is.null(output_file)) {
    # user supplied an output_file so, save it and close the device
    dev.off()
  }
}

do_plot_4('plot4.png') # save to a file
do_plot_4() # print on the screen