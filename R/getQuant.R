##' getQuant function reads in your weekly stats from your google steet
#'
#' This function reads your monthly stats from a google sheet to a dataframe
#' It also calculates some summaries in additional columns,
#' These are the net scores for each week (good scores - bad scores) and the good to bad ratio (good scores/ bad scores)
#' @param title parameter for the name of the google sheet, defaults to Self Quant
#' @param workSheet parameter for the name of the worksheet within the doc, defaults to Template
#' @keywords quantified self
#' @export
#' @import googlesheets
#' @import dplyr
#' @examples
#' sq_data <- getQuant()
#'
#' So if you have this sheet in your google sheets:
#' https://docs.google.com/spreadsheets/d/1ulmrOuD2_jCYJ4TxTVcNZCPqUVR5wxx6DoXW_uz-6lk/edit?usp=sharing
#' You can read this in with:
#' sq_data <- getQuant(title="Self Quant", workSheet = "Template")

getQuant <- function(title="Self Quant", workSheet="Example") {
  selfQuant <- gs_title(title)
  sq_data <- selfQuant %>%
    gs_read(ws = workSheet)
  sq_data <- head(sq_data, n=8)
  sq_data[, 2:9] <- sapply(sq_data[, 2:9],as.numeric)
  summary_df <- sq_data %>%
    group_by(X1) %>%
    mutate(gtb_w1= `Week1_pos`/`Week1_neg`,
           gtb_w2= `Week2_pos`/`Week2_neg`,
           gtb_w3= `Week3_pos`/`Week3_neg`,
           gtb_w4= `Week4_pos`/`Week4_neg`,
           net_w1= `Week1_pos`-`Week1_neg`,
           net_w2= `Week2_pos`-`Week2_neg`,
           net_w3= `Week3_pos`-`Week3_neg`,
           net_w4= `Week4_pos`-`Week4_neg`)
  return(summary_df)
}

