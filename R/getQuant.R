##' getQuant function reads in your weekly stats from your google steet
#'
#' This function reads your monthly stats from a google sheet to a dataframe
#' @param title parameter for the name of the google sheet, defaults to Self Quant
#' @param workSheet parameter for the name of the worksheet within the doc, defaults to Template
#' @keywords quantified self
#' @export
#' @examples
#' some example here

getQuant <- function(title="Self Quant", workSheet="Template") {
  selfQuant <- gs_title(title)
  sq_data <- selfQuant %>%
    gs_read(ws = workSheet)
  sq_data <- head(sq_data, n=9)
  return(sq_data)
}

