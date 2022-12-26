# Map & explore existing streamflow datasets
# Kendra Kaiser
# August 26th, 2021
# Project funded by the Northwest Climate Adaptation Science Center

library(readxl)
library(tidyverse)
library(lubridate)

setwd("/Users/kendrakaiser/github/StreamflowCatalog")
#did a find and replace on the xls to change current to 12-23-2022
catalog<- read_excel("data/Streamflow_Catalog.xlsx")
cat_new<- catalog %>% filter(organization != "United States Geological Survey") %>% filter(!is.na(organization))

cat_new$start <- cat_new$start %>% as.numeric() %>%  as.Date(origin = "1899-12-30")
cat_new$end <- cat_new$end %>% as.numeric() %>%  as.Date(origin = "1899-12-30")
cat_new$status[is.na(cat_new$status)] <- "unknown"


cont<- cat_new  %>% filter(meas.freq  == 'continuous') #2638
syn<- cat_new  %>% filter(meas.freq  == 'synoptic') #17854
seas<- cat_new  %>% filter(meas.freq  == 'seasonal') #43
unk<- cat_new  %>% filter(meas.freq  == 'unknown') 
naa<- cat_new  %>% filter(is.na(meas.freq))
cont_active <- cont %>% filter(status  == 'active') #582
cont_inactive <- cont %>% filter(status  == 'inactive') #827 (means 1320 are unknown)
cont_uk<-  cont %>% filter(status  == 'unknown') #1229

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
sum(is.na(cont$instrumentation)) #2495

# USGS data comparison
usgs_time<- read_excel('data/USGS_streamgage_figure.xlsx')

cont_comp<-cont
for (i in 1:2368){
  if (is.na(cont_comp$start[i]) && !is.na(cont_comp$end[i]))
  {cont_comp$start[i] <- (cont_comp$end[i])}
  if (is.na(cont_comp$end[i]) && !is.na(cont_comp$start[i]))
  {cont_comp$end[i] <- (cont_comp$start[i])}
}

cont_comp<- cont_comp[!is.na(cont_comp$start),]

non_gs<- as.data.frame(matrix(data=NA, nrow=159, ncol=dim(cont_comp)[1]))
for (i in 1:159){
  for (j in 1:dim(cont_comp)[1]){
    if (year(cont_comp$start[j]) <= usgs_time$year[i] && year(cont_comp$end[j]) >=usgs_time$year[i])
    {non_gs[i,j]<-1}
    else{non_gs[i,j]<-0}
  }
}

usgs_time$non_gs<-rowSums(non_gs)
gs_long <- pivot_longer(usgs_time, !Year, values_to = 'count')
gs_long_simp <- gs_long %>% filter(name == 'PNW' | name == 'non_gs' | name == 'Nationwide')

ggplot(gs_long_simp, aes(x=Year, y=count, color=name)) +
  geom_line()+
  theme_bw() +
  scale_x_continuous(breaks = round(seq(min(gs_long_simp$Year), max(gs_long_simp$Year), by = 20),1)) +
  scale_y_continuous(breaks = round(seq(min(gs_long_simp$count), max(gs_long_simp$count), by = 1000),1))

ggplot(cont$por_years)

ggplot(cont, aes(x=por_years)) + geom_histogram()+theme_bw()+xlab("Period of Record (years)") +
  ylab("Number of non-USGS continuous gages") +
  scale_x_continuous(expand = c(0.01, 0.01), breaks = seq(0, 125, by = 20)) + 
  scale_y_continuous(expand = c(0.01, 0.01), breaks = seq(0, 450, by = 50))
