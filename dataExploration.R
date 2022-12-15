# Map & explore existing streamflow datasets
# Kendra Kaiser
# August 26th, 2021
# Project funded by the Northwest Climate Adaptation Science Center

library(readxl)
library(tidyverse)

setwd("/Users/kendrakaiser/github/StreamflowCatalog")
#USFS Region 6 stream 
catalog<- read_excel("data/Streamflow_Catalog.xlsx")
cat_new<- catalog %>% filter(organization != "United States Geological Survey")

cont<- cat_new  %>% filter(meas.freq  == 'continuous')
syn<- cat_new  %>% filter(meas.freq  == 'synoptic')
seas<- cat_new  %>% filter(meas.freq  == 'seasonal')
unk<- cat_new  %>% filter(meas.freq  == 'unknown')
naa<- cat_new  %>% filter(meas.freq  == 'NA')

ID_cont <- cat_new %>% filter(meas.freq  == 'continuous') %>% filter(state == "Idaho")

unique_co<- unique(catalog$county)
