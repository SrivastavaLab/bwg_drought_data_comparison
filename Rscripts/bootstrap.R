#!/usr/bin/env Rscript
library(whisker)

site_names <- c("argentina", "cardoso", "colombia", "frenchguiana", "macae","puertorico", "costarica")

vals <- list(site_names = iteratelist(site_names, value = "site_name"))

str <- whisker.render(readLines("Rscripts/remake_sites.yml.whisker"), vals)
writeLines(str, "remake_sites.yml")