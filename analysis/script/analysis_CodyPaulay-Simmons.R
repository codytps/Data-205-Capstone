setwd("~/Desktop/Data 205/Capstone Project/Homeworks")

source("EDA_CodyPaulaySimmons.R")

analysis_data <- data.frame(Region = c("DC", "Hawaii County"),
                            Unemployment = c(dc_unemp, hi_unemp),
                            Earnings = c(dc_earn, hi_earn),
                            Income = c(dc_income, hi_income),
                            Poverty = c(dc_poverty, hi_poverty))
analysis_data
