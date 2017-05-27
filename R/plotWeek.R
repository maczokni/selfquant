##' plotWeek plots your net score each week in the past 4 weeks
#'
#' This function looks at variation in your net score for each metric over the last 4 weeks
#' @param summary parameter for the summarised dataset created using the calcSummary() function
#' @keywords quantified self
#' @export
#' @import dplyr
#' @import ggplot2
#' @import tidyr
#' @import plotly
#' @examples
#' plotWeek(summary = sq_data)
#'

plotWeek <- function(sq_summary){

  #first subset the dataframe to contain only the metric variable (x1) and the net scores for each week
  netCols <- dplyr::select(sq_summary, X1, net_w1, net_w2, net_w3, net_w4)

  #then gather to get week as one variable
  netColsSum <- tidyr::gather(netCols, "week", "netScore", 2:5)

  #rename the metric column
  names(netColsSum)[1]<-"Metric"

  #create line plot of each metric over the 4 weeks
  s <- ggplot2::ggplot(netColsSum, aes(x= week, y= netScore, group=metric, colour=metric)) +
    geom_line() +
    geom_point() +
    theme_bw() +
    scale_colour_brewer(palette="Set1") +
    labs(title = "Your net score in the last 4 weeks",
         x = "",
         y = "Net score") +
    scale_x_discrete(labels=c("Week 1", "Week 2", "Week 3", "Week 4"))

  #wrap plot in plotly for interactive flashyness
  ggplotly(s, tooltip = "netScore")


}

