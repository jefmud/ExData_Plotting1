# script to create plot4
# exploratory data analysis, project 1
# author: jefmud@gmail.com

# the source data
source('./get_power_data.R')
# reuse plots 2 and 3
source('./plot2.R')
source('./plot3.R')

# FUNCTION - do_plot_4()
# this combines two existing plot structures in plot2.R and plot3.R in the first column
# and two new plots which I am calling plot_4a and plot_4b in the second column

do_plot_4 <- function(output_file=NULL) {
  # encapsulated functions for plot_4a and plot_4b
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
  
  # set up 2 rows, 2 columns, adding in column order
  if (!is.null(output_file)) {
    # using png as the target
    png(output_file,width=480,height=480)
  }
  par(mfcol=c(2,2))
  do_plot_2()
  do_plot_3(legend_box="n") # subtle legend change to accomodate small dimension of plot
  do_plot_4a()
  do_plot_4b()
  if (!is.null(output_file)) {
    # user supplied an output_file so, save it and close the device
    dev.off()
  }
}

do_plot_4('plot4.png') # save to a file
do_plot_4() # print on the screen for user to see