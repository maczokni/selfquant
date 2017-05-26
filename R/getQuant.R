##' getQuant function reads in your weekly stats from your google steet
#'
#' This function reads your monthly stats from a google sheet to a dataframe
#' @param title parameter for the name of the google sheet, defaults to Self Quant
#' @param workSheet parameter for the name of the worksheet within the doc, defaults to Template
#' @keywords quantified self
#' @export
#' @examples
#' sq_data <- getQuant()
#'
#' So if you have this sheet in your google sheets:
#' https://docs.google.com/spreadsheets/d/1ulmrOuD2_jCYJ4TxTVcNZCPqUVR5wxx6DoXW_uz-6lk/edit?usp=sharing
#' You can read this in with:
#' sq_data <- getQuant(title="Self Quant", workSheet = "Template")

getQuant <- function(title="Self Quant", workSheet="Template") {
  selfQuant <- gs_title(title)
  sq_data <- selfQuant %>%
    gs_read(ws = workSheet)
  sq_data <- head(sq_data, n=9)
  return(sq_data)
}

