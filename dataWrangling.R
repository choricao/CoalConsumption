library(tidyverse)

coal <- read_csv('http://594442.youcanlearnit.net/coal.csv')
glimpse(coal)

coal <- read_csv('http://594442.youcanlearnit.net/coal.csv', skip = 2)
glimpse(coal)

colnames(coal)[1] <- 'region'
summary(coal)