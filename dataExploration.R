# Map & explore existing streamflow datasets
# Kendra Kaiser
# August 26th, 2021
# Project funded by the Northwest Climate Adaptation Science Center

library(readxl)
library(tidyverse)

setwd("/Users/kendrakaiser/github/StreamflowCatalog")
#USFS Region 6 stream 
catalog<- read_excel("data/Streamflow_Catalog.xlsx")
cat_new<- catalog %>% filter(organization != "United States Geological Survey") %>% filter(!is.na(organization))
cat_new$start <- cat_new$start %>% as.numeric() %>%  as.Date(origin = "1899-12-30")
cat_new$end <- cat_new$end %>% as.numeric() %>%  as.Date(origin = "1899-12-30")


cont<- cat_new  %>% filter(meas.freq  == 'continuous') #2751
syn<- cat_new  %>% filter(meas.freq  == 'synoptic')
seas<- cat_new  %>% filter(meas.freq  == 'seasonal')
unk<- cat_new  %>% filter(meas.freq  == 'unknown')
naa<- cat_new  %>% filter(is.na(meas.freq))
cont_active <- cont %>% filter(status  == 'active') #573
cont_inactive <- cont %>% filter(status  == 'inactive') #858 (means 1320 are unknown)

ID_cont <- cat_new %>% filter(meas.freq  == 'continuous') %>% filter(state == "Idaho")

unique_co<- unique(catalog$county)

sum(is.na(cat_new$start)) #1232
sum(is.na(cat_new$end)) #1212, both 1143

cat_new$por_days<- difftime(cat_new$end,cat_new$start, unit = "days") %>% as.numeric()
cat_new$por_years<- cat_new$por_days / 365
cent<- cat_new %>% filter(por_years >=100)

