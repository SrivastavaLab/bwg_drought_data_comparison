
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

#' Give a colour theme of choice to the
#'
#' @param pairs_fig a ggpairs output
#' @param colours the colours you want
#'
#' @return pairs theme with nice colours
#' @export
add_theme_to_ggpairs <- function(pairs_fig){
  bw1 <- add_to_plots(pairs_fig, scale_fill_manual(values = c("darkblue","darkorange")))
  
  bw2 <- add_to_plots(bw1, scale_colour_manual(values = c("darkblue","darkorange")))
  
  return(bw2)
}


get_aqua_abd <- function(){
  combine_tab(sheetname = I("bromeliad.final.inverts")) %>% 
    group_by(site, site_brom.id) %>% 
    summarize(abundance = sum(abundance))
}


get_terr_abd <- function(){
  combine_tab(sheetname = I("bromeliad.terrestrial")) %>% 
    group_by(site, site_brom.id) %>% 
    summarize(abundance = sum(abundance))
}

plot_size <- function(.physical, .dataset){
  ggp <- .physical %>% 
    mutate(focal = ifelse(site == .dataset, .dataset, "All")) %>% 
    select(maxvol:catchment.area, focal) %>% 
    ggpairs(colour = "focal")
  
  out <- add_theme_to_ggpairs(ggp)
  print(out)
}


plot_chem_ini <- function(.physical, .dataset){
  ggp <- .physical %>% 
    mutate(focal = ifelse(site == .dataset, .dataset, "all")) %>% 
    select(turbidity.initial:chlorophyll.initial, focal) %>% 
    ggpairs(colour = "focal")
  out <- add_theme_to_ggpairs(ggp)
  print(out)
}

plot_chem_fin <- function(.physical, .dataset){
  ggp <- .physical %>% 
    mutate(focal = ifelse(site == .dataset, .dataset, "all")) %>% 
    select(co2.final:chlorophyll.final, focal) %>% 
    ggpairs(colour = "focal")
  out <- add_theme_to_ggpairs(ggp)
  print(out)
}

plot_ecos_fin <- function(.physical, .dataset){
  ggp <- .physical %>% 
    mutate(focal = ifelse(site == .dataset, .dataset, "all")) %>% 
    select(water.volume.final:final.bromeliad.percentc, focal) %>% 
    ggpairs(colour = "focal")
  out <- add_theme_to_ggpairs(ggp)
  print(out)
}