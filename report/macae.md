
# Data from macae

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

![plot of chunk unnamed-chunk-1](figure/macae__unnamed-chunk-1-1.png) 

## Size variables


```r
sizepairs <- physical %>% 
  mutate(focal = ifelse(site == dataset, dataset, "all")) %>% 
  select(maxvol:catchment.area, focal) %>% 
  ggpairs(colour = "focal")

add_theme_to_ggpairs(sizepairs)
```

![plot of chunk sizes](figure/macae__sizes-1.png) 


## Chemical variables -- initial


```r
sizepairs <- physical %>% 
  mutate(focal = ifelse(site == dataset, dataset, "all")) %>% 
  select(turbidity.initial:chlorophyll.initial, focal) %>% 
  ggpairs(colour = "focal")

add_theme_to_ggpairs(sizepairs)
```

![plot of chunk chem_initial](figure/macae__chem_initial-1.png) 

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



|site_brom.id | turbidity.initial| oxygen.percent.initial| oxygen.conc.initial| ph.initial| chlorophyll.initial|*CONFIRMED* |
|:------------|-----------------:|----------------------:|-------------------:|----------:|-------------------:|:-----------|
|macae_B22    |              3.47|                  15.15|               1.195|       6.22|             -11.248|            |
|macae_B28    |              9.86|                  21.10|               1.660|       6.06|              68.672|            |
|macae_B5     |              5.73|                  31.90|               2.415|       5.82|              -7.696|            |

