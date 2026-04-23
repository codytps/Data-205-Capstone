# -----------------------------
# DATA 205 - Analysis
# Name: Cody Paulay-Simmons
# Project: DC vs Hawaii County
# -----------------------------

# Load EDA results
source("EDA_CodyPaulaySimmons.R")

# Create dataset
analysis_data <- data.frame(Region = c("DC", "Hawaii County"),
                            Unemployment = c(dc_unemp, hi_unemp),
                            Earnings = c(dc_earn, hi_earn),
                            Income = c(dc_income, hi_income),
                            Poverty = c(dc_poverty, hi_poverty))

# Check data
str(analysis_data)
summary(analysis_data)

library(ggplot2)
library(tidyr)

long_data <- pivot_longer(analysis_data,
                          cols = -Region,
                          names_to = "Variable",
                          values_to = "Value")

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

# This suggests that the higher income in D.C. may be offset by a higher
# cost of living, leading to similar levels of economic pressure as seen
# in Hawaii County.

# Despite lower income levels, Hawaii County maintains comparable poverty rates,
# which may indicate a lower cost of living relative to income.

# Overall, the results suggest that affordability challenges exist in both regions,
# and that higher income does not necessarily translate to better financial stability.

# This supports the idea that individuals who can afford to live in Washington, D.C.
# may also be able to live in Hawaii County, as both regions show similar
# socioeconomic pressures.
