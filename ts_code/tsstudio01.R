# Plotting time series data using TSstudio
# install.packages(c("quantmod", "tidyverse","TSstudio"))
# lapply(c("quantmod", "tidyverse","TSstudio"), require, character.only = TRUE)

library(TSstudio)
quantmod::getSymbols("AAPL", src="yahoo")
class(AAPL)
class(ts_plot(AAPL$AAPL.Adjusted, 
        title = "Apple Stock prices",
        Ytitle = ""))
class(AAPL) # What class is this object?

# Some sample dataset from TSstudio
ts_seasonal(USgas, type = "normal") # month-year matrix data

# What class is USgas?

# Sample charts
ts_heatmap(USgas)
ts_cor(USgas) # ACF and PACF
ts_lags(USgas, margin = .01)
usgas=data.frame(USgas)

