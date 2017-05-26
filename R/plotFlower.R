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

  netCols <- dplyr::select(sq_summary, X1, gtb_w1, gtb_w2, gtb_w3, gtb_w4)
  netColsSum <- tidyr::gather(netCols, "week", "gtb", 2:5)
  names(netColsSum)[1]<-"Metric"
  petalDf <- netColsSum %>%
              dplyr::group_by(Metric) %>%
              dplyr::summarise(mean_gtb=mean(gtb))

  PlotFlower(
    petalDf$mean_gtb, rep(1, nrow(petalDf)), petalDf$Metric, center=round(mean(petalDf$mean_gtb),2),
    main = "Good to bad ratio", fill.col = RColorBrewer::brewer.pal(nrow(petalDf), 'Spectral'),
    max.length=max(petalDf$mean_gtb)),
    max.length = 100, disk=0.4, label.cex=0.9, label.offset=0.155, cex=2.2, cex.main=2.5)


}
