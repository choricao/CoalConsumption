library(tidyverse)

# Read in coal dataset
coal <- read_csv('http://594442.youcanlearnit.net/coal.csv')
glimpse(coal)

coal <- read_csv('http://594442.youcanlearnit.net/coal.csv', skip = 2)
glimpse(coal)

colnames(coal)[1] <- 'region'
summary(coal)

# Convert coal dataset from long to wide
coal_long <- gather(coal, 'year', 'coal_consumption', -region)
glimpse(coal_long)

coal_long$year <- as.integer(coal_long$year)
summary(coal_long)

coal_long$coal_consumption <- as.numeric(coal_long$coal_consumption)
summary(coal_long)

# Segment coal dataset
unique(coal_long$region)

noncountries <- c("North America", "Central & South America", "Antarctica", "Europe", "Eurasia",
                  "Middle East", "Africa", "Asia & Oceania", "World")

matches <- which(!is.na(match(coal_long$region, noncountries)))

coal_country <- coal_long[-matches, ]
coal_region <- coal_long[matches, ]

unique(coal_country$region)
unique(coal_region$region)

# Visuaize coal dataset
ggplot(data = coal_region, mapping = aes(x = year, y = coal_consumption)) +
  geom_point()

ggplot(data = coal_region, mapping = aes(x = year, y = coal_consumption)) +
  geom_line(mapping = aes(color = region))
