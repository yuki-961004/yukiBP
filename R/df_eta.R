#' Title
#'
#' @param df df
#' @param i i
#'
#' @return 结果
#' @export 结果

df_eta <- function(df,i) {
  result <- df %>%
    dplyr::filter(., Matching == "Matching") %>%
    dplyr::group_by(Subject, Identity, Session) %>%
    dplyr::summarise(Eff = mean(RT_ms)/mean(ACC))%>%
    dplyr::ungroup() %>%
    dplyr::filter(!if_any(everything(), ~ is.na(.x) | is.infinite(.x))) %>%
    dplyr::group_by(Identity) %>%
    dplyr::summarise(eta_mean = mean(Eff),
                     eta_sd = sd(Eff)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(Paper_ID = p[[i]])

  return(result)
}
