
get_offline_sheet <- function(sheetname){
  c("Argentina", "Cardoso", "Colombia", "French_Guiana",
    "Macae", "PuertoRico", "CostaRica") %>% 
    sapply(offline, default.path = "../../../Dropbox/") %>% 
    combine_tab(sheetname)
}

cname <- function(cn) cn
