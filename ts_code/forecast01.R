install.packages("forecast")
library(forecast)
library(ggplot2)
library(magrittr)

# ETS forecasts
USAccDeaths %>%
  ets() %>%
  forecast() %>%
  autoplot() + theme_bw()

# Automatic ARIMA forecasts
WWWusage %>%
  auto.arima() %>%
  forecast(h=20) %>%
  autoplot() + theme_bw()

# ARFIMA forecasts
library(fracdiff)
x <- fracdiff.sim( 100, ma=-.4, d=.3)$series
arfima(x) %>%
  forecast(h=30) %>%
  autoplot() + theme_bw()

# Forecasting with STL
USAccDeaths %>%
  stlm(modelfunction=ar) %>%
  forecast(h=36) %>%
  autoplot() + theme_bw()

AirPassengers %>%
  stlf(lambda=0) %>%
  autoplot() + theme_bw()

USAccDeaths %>%
  stl(s.window='periodic') %>%
  forecast() %>%
  autoplot() + theme_bw()

# TBATS forecasts
USAccDeaths %>%
  tbats() %>%
  forecast() %>%
  autoplot() + theme_bw()

# taylor data, from:
# Taylor, J.W. (2003) Short-term electricity demand forecasting using double seasonal exponential smoothing. Journal of the Operational Research Society, 54, 799-805.
class(taylor)
taylor %>% # takes some time
  tbats() %>%
  forecast() %>%
  autoplot() + theme_bw()
# Neural Network forecasts
AirPassengers %>%
  nnetar() %>%
  forecast(h=36) %>%
  autoplot() + theme_bw()
