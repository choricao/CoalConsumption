library(tidyverse)

coal <- read_csv('http://594442.youcanlearnit.net/coal.csv')
glimpse(coal)

coal <- read_csv('http://594442.youcanlearnit.net/coal.csv', skip = 2)
glimpse(coal)

colnames(coal)[1] <- 'region'
summary(coal)

coal_long <- gather(coal, 'year', 'coal_consumption', -region)
glimpse(coal_long)

coal_long$year <- as.integer(coal_long$year)
summary(coal_long)

coal_long$coal_consumption <- as.numeric(coal_long$coal_consumption)
summary(coal_long)