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

# Washington, D.C. shows higher median income and earnings compared to Hawaii County.

# However, D.C. also has higher unemployment and slightly higher poverty rates.

# This suggests that while D.C. has stronger earning potential,
# the benefits may not be evenly distributed across the population.

# Hawaii County shows lower income levels,
# but also slightly lower unemployment and poverty,
# indicating a more balanced but lower-income economy.

# Overall, the comparison highlights how higher income does not necessarily
# mean lower poverty, pointing toward possible income inequality in D.C.