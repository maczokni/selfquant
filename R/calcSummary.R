##' calcSummary function creates columns for good to bad ratio and net score for each week for each category.
#'
#' This function calculates some summaries and adds them as columns to this dataframe
#' @keywords quantified self
#' @export
#' @examples
#' summary_df <- calcSummary(sq_data)

calcSummary <- function(sq_data){
  sq_data[, 2:9] <- sapply(sq_data[, 2:9],as.numeric)
  summary_df <- sq_data %>%
                  group_by(X1) %>%
                  mutate(gtb_w1= `Week1+`/`Week1-`,
                         gtb_w2= `Week2+`/`Week2-`,
                         gtb_w3= `Week3+`/`Week3-`,
                         gtb_w4= `Week4+`/`Week4-`,
                         net_w1= `Week1+`-`Week1-`,
                         net_w2= `Week2+`-`Week2-`,
                         net_w3= `Week3+`-`Week3-`,
                         net_w4= `Week4+`-`Week4-`)
}


