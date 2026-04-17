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

# --- Analysis Insights ---

# Washington, D.C. has higher income and earnings than Hawaii County.

# D.C. also has higher unemployment and poverty rates.

# This suggests possible income inequality,
# where higher earnings are not evenly distributed.