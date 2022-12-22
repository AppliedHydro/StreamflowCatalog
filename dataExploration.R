# Map & explore existing streamflow datasets
# Kendra Kaiser
# August 26th, 2021
# Project funded by the Northwest Climate Adaptation Science Center

library(readxl)
library(tidyverse)

setwd("/Users/kendrakaiser/Documents/github/StreamflowCatalog")

catalog<- read_excel("data/Streamflow_Catalog.xlsx")
cat_new<- catalog %>% filter(organization != "United States Geological Survey") %>% filter(!is.na(organization))
cat_new$start <- cat_new$start %>% as.numeric() %>%  as.Date(origin = "1899-12-30")
cat_new$end <- cat_new$end %>% as.numeric() %>%  as.Date(origin = "1899-12-30")


cont<- cat_new  %>% filter(meas.freq  == 'continuous') #2707
syn<- cat_new  %>% filter(meas.freq  == 'synoptic') #17854
seas<- cat_new  %>% filter(meas.freq  == 'seasonal') #43
unk<- cat_new  %>% filter(meas.freq  == 'unknown') 
naa<- cat_new  %>% filter(is.na(meas.freq))
cont_active <- cont %>% filter(status  == 'active') #592
cont_inactive <- cont %>% filter(status  == 'inactive') #858 (means 1320 are unknown)

ID_cont <- cat_new %>% filter(meas.freq  == 'continuous') %>% filter(state == "Idaho")

unique_co<- unique(cat_new$county) #99
unique_co<- unique(c(cat_new$county, cat_new$state)) #102
unique_org<- unique(c(cat_new$organization, cat_new$'organization dataset'))

# start end dates
sum(is.na(cat_new$start)) #1124 dont have start dates
sum(is.na(cat_new$end)) #1212 [1212/20654 = only 6%]
sum(is.na(cat_new$end) & is.na(cat_new$start)) #1084

cat_online<- cat_new %>% filter(!is.na(url)) %>% filter(url != "NA") #1122

cat_new$por_days<- difftime(cat_new$end,cat_new$start, unit = "days") %>% as.numeric()
cat_new$por_years<- cat_new$por_days / 365

#number of gages per org
org.table<- as.data.frame(table(cat_new$organization))

org.table2<- as.data.frame(table(cat_new$`organization dataset`))

usbr <- cat_new %>% filter(`organization dataset` == 'USBR')

org.table.cont<- as.data.frame(table(cont$organization))
org.table2.cont<- as.data.frame(table(cont$`organization dataset`))

cat.hucs<-unique(cat_new$Huc8) #170
cat.hucs<-unique(cat_new$Huc8) #170


#metadata completeness
sum(is.na(cont$`stream type`)) 12
sum(cont$`stream type` =='stream')
cont.stream<-cont %>% filter(`stream type` == 'stream') #819
cont.uk<-cont %>% filter(`stream type` == 'unknown') #1473
cont.canal<-cont %>% filter(`stream type` == 'canal') #402

cont.i<-cont %>% filter(`interval` == 'unknown') #1275  %47
sum(is.na(cont$method))
sum(is.na(cont$instrumentation)) $2495
