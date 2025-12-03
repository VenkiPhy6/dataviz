# Plotting time series data using dygraph
# install.packages(c("quantmod", "tidyverse","dygraphs"))
# lapply(c("quantmod", "tidyverse","dygraphs"), require, character.only = TRUE)

library(dygraphs)
par(family="Palatino")
quantmod::getSymbols("MSFT", src="yahoo")

class(MSFT)
m = tail(MSFT, n=30)
m =m[,1:(ncol(m)-2)] # drop last two columns 
names(m)<-c('Open', 'High', 'Low', 'Close') # rename columns for plotting
path <- getwd()
setwd("./dataviz_website/ts_code/dygraphs") # place dygraph.css into the same directory
dygraph(m, main = "Microsoft Stock Prices (Candlestick Chart)")  |>  
  dyCandlestickGroup(c('Open', 'High', 'Low', 'Close')) |> 
  dyCandlestick()  |> 
  dyLegend(show = "always", hideOnMouseOut = T) |> 
  dyCSS("dygraph.css")

