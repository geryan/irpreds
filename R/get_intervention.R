#' @title Get intervention data
#' @description
#' Returns ITN and or IRS data from MAP.
#'
#' @param intervention `character` which interventions do you want? irs, or
#'  itn, or both
#' @param year `integer` 2020 or 2015 or both
#'
#' @return `SpatRaster`
#' @export
#'
#' @examples
#' \dontrun{
#' get_intervention("itn")
#' }
get_intervention <- function(
    intervention = c("itn", "irs"),
    year = c(2020, 2015)
  ){




  layers <- data.frame(
    lyrs = c(
      "Explorer__2020_Africa_ITN_Use",
      "Explorer__2015_Nature_Africa_ITN",
      "Explorer__2020_Africa_IRS_Coverage",
      "Explorer__2015_Nature_Africa_IRS"
    ),
    itv = c(
      "itn",
      "itn",
      "irs",
      "irs"
    ),
    yr = c(
      2020,
      2015,
      2020,
      2015
    )
  ) |>
    dplyr::filter(
      itv %in% intervention,
      yr %in% year
    ) |>
    dplyr::mutate(
      lyrnames = sprintf(
        "%s_%s",
        itv,
        yr
      )
    )

  lyrs <- layers$lyrs
  lyrnames <- layers$lyrnames

  mapply(
    FUN = function(lyrs, lyrnames){
      z <- malariaAtlas::getRaster(lyrs)
      names(z) <- lyrnames
      z
    },
    lyrs,
    lyrnames,
    SIMPLIFY = FALSE
  )

}
