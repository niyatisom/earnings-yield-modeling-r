
#Step 1: Prepare data
df = DATA[,c('Date','PRIME','Shares Outstanding (Eop)','Cash And Cash Equivalents','Operating Income','Total Debt Per Share','Preferred Stock','Minority Interest')]
names(df)=c('date','ticker','so','cash','oi','tds','ps','mi')
library(data.table)
setDT(df)

#Step 2: Filter tickets

f = c('MSFT','LLY','XOM','WMT')
df[ticker %in% f]

### (For only 4 tickers) --> df = df[ticker %in% f]

#Test
df[ticker=='MSFT' & date == '200106']
df[ticker=='MSFT' & date != '201712']
msft = df[ticker=='MSFT' & date != '201712']
#End of test 

df[,.(date,ticker)]
df[,ticker]
df[,.(ticker)]

df[,oi]
df[,mean(oi)]
df[,.(mean(oi),sd(oi),min(oi),max(oi))]
bb=df[,.(mean(oi),sd(oi),min(oi),max(oi))]
names(bb)=c('Mean','SD','Min','Max')

bbdt=df[,.(mean(oi),sd(oi),min(oi),max(oi)),by=date]
df[,.(mean(oi),sd(oi),min(oi),max(oi)),by=.(ticker,date)]

bws=df[,.(mean(oi),sd(oi),min(oi),max(oi)),by=.(ticker,date)]
names(bws)=c('ticker','date','mean','sd','min','max')
bws = bws[order(ticker,-date)]

#Step 3: Lag + average operating income

df=df[order(ticker,date)]
df[,c('oi2','oi3','oi4'):=shift(oi,n=1:3),by=ticker]
df[,oiavg:=(oi+oi2+oi3+oi4)/4]

df2 = df[date %in% c(201706,201606,201506)]

str(pricedf)
str(df2)

# Step 4: Join with price data

setDT(pricedf)
pricedf[,period:=format(Date,'%Y')]
str(pricedf)

df2[,Year:=substr(date, 1, 4)]
df2[pricedf,price:=Price,on=c(ticker='Ticker',Year='period')]

# Step 5: Calculate total debt and earnings yield

df2[,td:=so*tds]
df2[,ey:=oiavg/(so*price+td - cash +ps + mi)]

#Step 6: Final 4 

df2[ticker %in% c('MSFT', 'LLY', 'XOM', 'WMT'), .(ticker, date, ey)]

#Step 7: Plot the results

install.packages("ggplot2")

library(data.table)
library(ggplot2)

df2_plot=df2[ticker %in% c("MSFT", "LLY", "XOM", "WMT")]
df2_plot[,date:=as.factor(date)]

ggplot(df2_plot, aes(x = date, y = ey, color = ticker, group = ticker)) +
  geom_line(size = 1.3) +
  geom_point(size = 1.5) +
  labs(
    title = "Earnings Yield Over Time ",
    x = "Date",
    y = "Earnings Yield",
    color = "Ticker"
  ) 

