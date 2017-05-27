##' plotFlower plots your good to bad ratio score for each metric over the past 4 weeks
#'
#' This function looks at variation in your good to bad ratio for each metric over the last 4 weeks. Each petal of the flower is one of the metrics.
#' The score in the middle represents the average good to bad ratio score across all metrics. If it is greater than 1, then overall you have more good, and if it's smaller than 1, you have more bad.
#' @param summary parameter for the summarised dataset created using the calcSummary() function
#' @keywords quantified self
#' @export
#' @import dplyr
#' @import tidyr
#' @import ohicore
#' @examples
#' plotFlower(summary = summary_df)
#'

plotFlower <- function(sq_summary){

  #first subset the dataframe to contain only the metric variable (x1) and the net scores for each week
  netCols <- dplyr::select(sq_summary, X1, gtb_w1, gtb_w2, gtb_w3, gtb_w4)

  #then gather to get week as one variable
  netColsSum <- tidyr::gather(netCols, "week", "gtb", 2:5)

  #rename the metric column
  names(netColsSum)[1]<-"Metric"

  #get the mean good to bad ratio over all 4 weeks for each metric
  petalDf <- netColsSum %>%
              dplyr::group_by(Metric) %>%
              dplyr::summarise(mean_gtb=mean(gtb))

  #make the flower plot
  PlotFlower(
    petalDf$mean_gtb, rep(1, nrow(petalDf)), petalDf$Metric, center=round(mean(petalDf$mean_gtb),2),
    main = "Good to bad ratio", fill.col = RColorBrewer::brewer.pal(nrow(petalDf), 'Spectral'),
    max.length=max(petalDf$mean_gtb))


}
