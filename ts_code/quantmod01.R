install.packages("quantmod")
library(quantmod)
quantmod::getSymbols("NVDA", src="yahoo")
chartSeries(NVDA)
chartSeries(NVDA, type = c("auto", "candlesticks", "matchsticks", "bars","line"), subset='last 4 months',theme = "white")
barChart(NVDA,multi.col=TRUE,theme = 'white')
lineChart(NVDA,line.type = 'l', theme = 'white') # line, choices include l, h, c, b
lineChart(NVDA,line.type = 'h',theme = chartTheme('white', up.col='steelblue')) # histogram
candleChart(NVDA,subset = "2020-11/2021-01", multi.col=TRUE,theme = chartTheme('white'))
## grey => Open[t] < Close[t] and Op[t] < Cl[t-1]
## white => Op[t] < Cl[t] and Op[t] > Cl[t-1]
## red => Op[t] > Cl[t] and Op[t] < Cl[t-1]
## black => Op[t] > Cl[t] and Op[t] > Cl[t-1]