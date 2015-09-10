
# Data from puertorico

Here is a simple plot:

```r
physical %>% 
  mutate(focal = ifelse(site == dataset, "focal", "other")) %>% 
  ggplot(aes(x = leaf.number, y = maxvol, colour = focal)) +
  geom_point()
```

```
## Warning: Removed 30 rows containing missing values (geom_point).
```

![plot of chunk unnamed-chunk-1](figure/puertorico__unnamed-chunk-1-1.png) 

## Size variables


```r
sizepairs <- physical %>% 
  mutate(focal = ifelse(site == dataset, dataset, "all")) %>% 
  select(maxvol:catchment.area, focal) %>% 
  ggpairs(colour = "focal")

add_theme_to_ggpairs(sizepairs)
```

![plot of chunk sizes](figure/puertorico__sizes-1.png) 


## Chemical variables -- initial


```r
sizepairs <- physical %>% 
  mutate(focal = ifelse(site == dataset, dataset, "all")) %>% 
  select(turbidity.initial:chlorophyll.initial, focal) %>% 
  ggpairs(colour = "focal")

add_theme_to_ggpairs(sizepairs)
```

![plot of chunk chem_initial](figure/puertorico__chem_initial-1.png) 

#### Chemical variables to check


```r
set.seed(4812)
physical %>% 
  filter(site == dataset) %>% 
  select(site_brom.id, turbidity.initial:chlorophyll.initial) %>% 
  sample_n(3) %>% 
  mutate(`*CONFIRMED*` = "    ") %>% 
  as.data.frame %>% 
  kable
```



|site_brom.id  | turbidity.initial| oxygen.percent.initial| oxygen.conc.initial| ph.initial| chlorophyll.initial|*CONFIRMED* |
|:-------------|-----------------:|----------------------:|-------------------:|----------:|-------------------:|:-----------|
|puertorico_1  |            169.80|                     NA|                  NA|        5.8|                  NA|            |
|puertorico_6  |             57.93|                     NA|                  NA|         NA|                  NA|            |
|puertorico_27 |                NA|                     NA|                  NA|         NA|                  NA|            |

