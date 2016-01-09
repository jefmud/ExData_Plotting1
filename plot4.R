# script to create plot4
# exploratory data analysis, project 1

# the source data
source('./get_power_data.R')
source('./plot2.R')
source('./plot3.R')

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
  par(mfcol=c(2,2))
  do_plot_2()
  do_plot_3()
  do_plot_4a()
  do_plot_4b()
  if (!is.null(output_file)) {
    # user supplied an output_file so, save it and close the device
    dev.copy(png,output_file)
    dev.off()
  }
}

do_plot_4('plot4.png')
