##' plotWeek plots your net score each week in the past 4 weeks
#'
#' This function looks at variation in your net score for each metric over the last 4 weeks
#' @param summary parameter for the summarised dataset created using the calcSummary() function
#' @keywords quantified self
#' @export
#' @examples
#' plotWeek(summary = summary_df)
#'

plotWeek <- function(sq_summary){

  netCols <- dplyr::select(sq_summary, X1, net_w1, net_w2, net_w3, net_w4)
  netColsSum <- tidyr::gather(netCols, "week", "netScore", 2:5)
  names(netColsSum)[1]<-"Metric"

  s <- ggplot2::ggplot(netColsSum, aes(x= week, y= netScore, group=metric, colour=metric)) +
    geom_line() +
    geom_point() +
    theme_bw() +
    scale_colour_brewer(palette="Set1") +
    labs(title = "Your net score in the last 4 weeks",
         x = "",
         y = "Net score") +
    scale_x_discrete(labels=c("Week 1", "Week 2", "Week 3", "Week 4"))

  ggplotly(s)


}

