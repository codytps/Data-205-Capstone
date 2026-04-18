setwd("~/Desktop/Data 205/Capstone Project/Homeworks")

source("EDA_CodyPaulaySimmons.R")

analysis_data <- data.frame(Region = c("DC", "Hawaii County"),
                            Unemployment = c(dc_unemp, hi_unemp),
                            Earnings = c(dc_earn, hi_earn),
                            Income = c(dc_income, hi_income),
                            Poverty = c(dc_poverty, hi_poverty))
analysis_data

str(analysis_data)
summary(analysis_data)

# ------------------
# Analysis Insights
# ------------------

# Washington, D.C. has higher income and earnings than Hawaii County.

# D.C. also has higher unemployment and poverty rates.

# This suggests possible income inequality,
# where higher earnings are not evenly distributed.

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

# -----------------------
# Visualization Insights
# -----------------------

# This visualization compares key socioeconomic indicators between
# Washington, D.C. and Hawaii County.

# D.C. shows higher income and earnings,
# but also slightly higher unemployment and poverty rates.

# The contrast suggests that while D.C. has greater economic output,
# the distribution of wealth may be uneven across the population.

# Hawaii County, while having lower income levels,
# shows slightly lower unemployment and poverty,
# indicating a more balanced but lower-income economy.