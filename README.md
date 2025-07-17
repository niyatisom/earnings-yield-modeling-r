# earnings-yield-modeling-r
R script that models and visualizes earnings yield over time for select U.S. stocks using financial fundamentals and price data.

# Earnings Yield Modeling in R
This project calculates and visualizes the **Earnings Yield (EY)** over time for four major U.S. stocks: **MSFT, LLY, XOM, and WMT**. The analysis combines company financial data (e.g., operating income, debt, preferred stock) with historical stock prices to compute and plot EY trends from 2015 to 2017.

# What This Project Does
- Filters key financial data by ticker and date
- Calculates a 4-period average of operating income
- Joins financials with historical stock price data
- Computes total debt and the earnings yield using:
- Plots the trend of earnings yield over time using `ggplot2`
  
# Tools Used
- R
- `data.table` for fast data manipulation
- `ggplot2` for visualization
- Yahoo Finance or local financial data source

# Sample Output
<img width="648" height="316" alt="image" src="https://github.com/user-attachments/assets/62106426-7c88-4337-a55b-687f7f151799" />

# Why This Matters
Earnings Yield is a valuation metric used to evaluate the profitability of a stock relative to its price. This project simulates a real-world analysis an equity analyst or data analyst might perform, combining multiple data sources and transforming raw financials into an interpretable time series.

# How to Use
1. Clone or download the repo  
2. Run `earnings_yield_model.R` in RStudio  
3. Make sure `pricedf` contains your historical stock price data  
4. View the output plot of EY over time
5. Change tickers to your liking if necessary. 

# Files
- `earnings_yield_model.R`: Main analysis script
- DATA.rds (from Prof. Gilani @ Rutgers): To pool stock data. 
- PRICE.rds (from Prof. Gilani @ Rutgers): To pool stock data. 
- `README.md`: Project overview

# Contact
Created by Niyati Somarouthu. For questions, feel free to reach out via LinkedIn or GitHub.
