# -----------------------------
# DATA 205 - Analysis
# Name: Cody Paulay-Simmons
# Project: DC vs Hawaii County
# -----------------------------

# -----------------
# Load EDA results
# -----------------

source("~/Desktop/Data 205/Capstone Project/Homeworks/EDA_CodyPaulaySimmons.R")

# ---------------
# Create dataset
# ---------------

analysis_data <- data.frame(Region = c("DC", "Hawaii County"),
                            Unemployment = c(dc_unemp, hi_unemp),
                            Earnings = c(dc_earn, hi_earn),
                            Income = c(dc_income, hi_income),
                            Poverty = c(dc_poverty, hi_poverty))
# -----------
# Check data
# -----------

str(analysis_data)
summary(analysis_data)

# ---------------
# Load libraries
# ---------------

library(ggplot2)
library(tidyr)

# ---------------------
# Create a new dataset
# ---------------------

long_data <- pivot_longer(analysis_data,
                          cols = -Region,
                          names_to = "Variable",
                          values_to = "Value")

# -------------------------
# Create a facet_wrap plot
# -------------------------

ggplot(long_data, aes(x = Region, y = Value, fill = Region)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Variable, scales = "free") +
  labs(title = "Socioeconomic Comparison: DC vs Hawaii County",
       x = "Region",
       y = "Value") +
  scale_fill_manual(values = c("navy", "red"))

# ------------------
# Analysis Insights
# ------------------

# Washington, D.C. has higher median income and earnings 
# compared to Hawaii County.

# D.C. also has a slightly higher poverty rate and unemployment.

# This suggests that higher income in D.C. may not fully reduce economic pressure,
# since poverty and unemployment are also higher than in Hawaii County.

# Despite lower income levels, Hawaii County maintains comparable poverty rates,
# which may indicate a lower cost of living relative to income.

# Overall, the results suggest that affordability challenges exist in both regions,
# and that higher income does not necessarily translate to better financial stability.

# This supports the idea that individuals who can afford to live in Washington, D.C.
# may also be able to live in Hawaii County, as both regions show similar
# socioeconomic pressures.

# ------------------
# Additional Metric
# ------------------

analysis_data$Income_to_Poverty <- analysis_data$Income / analysis_data$Poverty
analysis_data

# ----------------------
# Additional Metric Plot
# ----------------------

ggplot(analysis_data, aes(x = Region, y = Income_to_Poverty, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Income-to-Poverty Ratio Comparison",
       x = "Region",
       y = "Income / Poverty Rate") +
  scale_fill_manual(values = c("red", "navy"))

# --------------------------
# Additional Metric Insight
# --------------------------

# The income-to-poverty ratio helps compare how far income goes
# relative to poverty levels in each region.

# Although Washington, D.C. has higher income, its slightly higher
# poverty rate reduces the overall advantage.

# The resulting ratios between D.C. and Hawaii County are not drastically different,
# suggesting that both regions experience similar levels of economic pressure.

# This supports the idea that affordability challenges are comparable,
# meaning individuals who can afford to live in D.C. may also be able
# to live in Hawaii County.