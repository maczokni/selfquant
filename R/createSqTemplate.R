##' createSqTemplate function creates a new google sheet in the template form which we follow for the quantified self data recording process
#'
#' This function creates a new google sheet called "Self Quant", and worksheet called "Template"
#' @param title parameter for the name of the google sheet, defaults to Self Quant
#' @param workSheet parameter for the name of the worksheet within the doc, defaults to Template
#' @keywords quantified self
#' @export
#' @examples
#' some example here


createSqTemplate <- function(title = "Self Quant", worksheet = "Template"){
  sq_temp <- data.frame("X1" = c( "Work", "Health", "Social", "Xcurriculars", "Satisfy_prefs", "Managing_Risk", "Spending", "Eco_points", "Notables"),
                        "Week1+" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week1-" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week2+" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week2-" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week3+" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week3-" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week4+" = c(0,0, 0, 0, 0, 0, 0, 0, 0),
                        "Week4-" = c(0,0, 0, 0, 0, 0, 0, 0, 0))

  selfQuantTemplate <- gs_new(title, ws_title = workSheet, input = sq_temp,
                              trim = TRUE, verbose = FALSE)
}
