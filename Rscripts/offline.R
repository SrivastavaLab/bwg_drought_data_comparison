
get_offline_sheet <- function(sheetname){
  c("Argentina", "Cardoso", "Colombia", "French_Guiana",
    "Macae", "PuertoRico", "CostaRica") %>% 
    sapply(offline, default.path = "../../../Dropbox/") %>% 
    combine_tab(sheetname)
}

cname <- function(cn) cn

add_to_plots <- function(pairs, modification) {
  str <- deparse(substitute(modification))
  pairs$plots <- lapply(pairs$plots, function(s) paste(s, '+', str))
  pairs
}