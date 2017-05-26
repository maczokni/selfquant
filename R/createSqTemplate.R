##' createSqTemplate function creates a new google sheet in the template form which we follow for the quantified self data recording process
#'
#' This function creates a new google sheet called "Self Quant", and worksheet called "Template"
#' @param title parameter for the name of the google sheet, defaults to Self Quant
#' @param workSheet parameter for the name of the worksheet within the doc, defaults to Template
#' @keywords quantified self
#' @export
#' @examples
#' createSqTemplate()


createSqTemplate <- function(title = "Self Quant", workSheet = "Template"){
  sq_temp <- data.frame("X1" = c( "Work", "Health", "Social", "Xcurriculars", "Satisfy_prefs", "Managing_Risk", "Spending", "Eco_points", "Notables"),
                        "Week1_pos" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week1_neg" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week2_pos" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week2_neg" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week3_pos" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week3_neg" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week4_pos" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week4_neg" = c(0,0, 0, 0, 0, 0, 0, 0, 0))

  selfQuantTemplate <- gs_new(title, ws_title = workSheet, input = sq_temp,
                              trim = TRUE, verbose = FALSE)
}
