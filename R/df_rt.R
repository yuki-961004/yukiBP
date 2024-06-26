#' Title
#'
#' @param df df
#' @param i i
#'
#' @return 结果
#' @export 结果

df_rt <- function(df,i) {
  result <- df %>%
    dplyr::filter(., Matching == "Matching") %>%
    dplyr::group_by(Subject, Session, Identity) %>%
    dplyr::summarise(mean_rt = mean(RT_ms)) %>%
    dplyr::ungroup() %>%
    dplyr::filter(!if_any(everything(), ~ is.na(.x) | is.infinite(.x))) %>%
    dplyr::group_by(Identity) %>%
    dplyr::summarise(RT_mean = mean(mean_rt),
                     RT_sd = sd(mean_rt)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(Paper_ID = p[[i]])

  return(result)
}
