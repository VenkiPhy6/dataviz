### Relationships and Models
### Start with Exploratory Data Analysis then model diagnostics


## EDA
# Scatter plot matrix
# Data from Alexander C. Tan, Karl Ho & Cal Clark. 2020. The political 
# economy of Taiwan’s regional relations, Asian Affairs: An American Review
# Install packages
install.packages(c("openxlsx", "tidyverse", "RColorBrewer", "GGally", "flexdashboard"))
install.packages("easystats")
library(tidyverse)
## Package maintenance
easystats::easystats_update()
## easystats::install_latest()

lapply(c("openxlsx", "tidyverse","GGally","flexdashboard"), require, character.only = TRUE)

# Import data from GitHub
imfgrowth = openxlsx::read.xlsx("https://github.com/datageneration/gentlemachinelearning/raw/master/data/imfgrowth.xlsx")

attach(imfgrowth)
library(tidyverse)
imfgrowth = dplyr::rename(imfgrowth, US = "United.States")
imf8019 = imfgrowth[which(imfgrowth$Year<2020),]
imf8019$decade = as.factor(imf8019$decade) # Change decade into factor


# Create group for comparison
# NSP is the countries targeted by Taiwan in its New Sound Bound Policy (2016)

attach(imf8019)
tcuan = data.frame(China, Taiwan, US, NSP, ASEAN)

# Pairwise scatterplot matrix
# Specifying font, subject to font availabiliy on local computer
par(family="Palatino")
ggplot2::theme_set(ggplot2::theme_minimal(base_size = 12, base_family = "Palatino"))

GGally::ggpairs(tcuan) + theme_bw() +  
  theme(text = element_text(size=12,  family = "Palatino"))

## Bivariate scatterplots with regression line
ggduo(tcuan, types = list(continuous = wrap(ggally_points, size = .5))) +
  geom_smooth(method = "lm", color = "red", se = T, size = .5) +
  ggplot2::theme(text = ggplot2::element_text(size=12,  family = "Palatino"))  +
  labs(y = "Bilateral economic growth, 1980-2018",x = "Bilateral economic growth, 1980-2018")  +
  theme_bw()

## Scatter plot matrix
## Choose variables to be plotted
ggscatmat(imf8019, columns = 20:24,  alpha = 0.8) + 
  theme_bw() +  
  theme(text = element_text(size=12,  family = "Palatino"), ) + 
  labs(y = "Economic growth, 1980-2018",x = "Economic growth, 1980-2018") +
  scale_fill_brewer(palette="Set1") + scale_color_brewer(palette="Set1") 


## Model with diagnostics

# Import data
hpi2016 = read.csv("https://raw.githubusercontent.com/datageneration/datavisualizationinpractice/main/data/happyplanetindex.csv")

# Use vroom and janitor to read faster with clean variable names
hpi2016 = vroom::vroom("https://raw.githubusercontent.com/datageneration/datavisualizationinpractice/main/data/happyplanetindex.csv", .name_repair = janitor::make_clean_names)

# Start with a model
model = lm(happy_planet_index~log(population)+happy_life_years,hpi2016)
# model = lm(happy_planet_index~average_life_expectancy+log(population),hpi2016)

summary(model)

easystats::model_dashboard(model)


# Manual check
performance::check_model(model)
