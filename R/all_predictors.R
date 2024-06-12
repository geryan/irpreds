#' @title Collate all predictors
#' @description
#' Collates all predictor variables of insecticide resistance, per Hancock et
#' al. 2017 \url{https://doi.org/10.1371/journal.pbio.3000633}, specifically
#' table S9 \url{https://doi.org/10.1371/journal.pbio.3000633.s020} (.docx file)
#'
#' @param path `character` path to write output.
#'
#' @return `SpatRaster`
#' @export
#'
#' @examples
#' \dontrun{
#' all_predictors()
#' }
all_predictors <- function(path = NULL){

  intvn <- get_intervention(intervention = "all")


  p <- c(
    intvn
  )

  if(!is.null(path)){
    terra::writeRaster(
      x = p,
      filename = sprintf(
        "%s/predictions.tif",
        path
      )
    )
  }

  p

}
