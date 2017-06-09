##' calcSummary function creates columns for good to bad ratio and net score for each week for each category.
#'
#' This function calculates some summaries and adds them as columns to this dataframe
#' @keywords quantified self
#' @export
#' @import dplyr
#' @examples
#' summary_df <- calcSummary(sq_data)

calcSummary <- function(sq_data){
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
}


