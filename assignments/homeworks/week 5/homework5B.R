head(data_dp03)
colnames((data_dp03))

unemp_row <- data_dp03[data_dp03$Label..Grouping. == "Unemployed",]
unemp_row

dc_unemp <- unemp_row$District.of.Columbia..District.of.Columbia..Percent
hi_unemp <- unemp_row$Hawaii.County..Hawaii..Percent

dc_unemp
hi_unemp

unique(data_dp03$Label..Grouping.)

unemp_row <- data_dp03[grepl("^\\s+Unemployed$", 
                             data_dp03$Label..Grouping.), ]
unemp_row

dc_unemp <- as.numeric(dc_unemp)
hi_unemp <- as.numeric(hi_unemp)

rate_row <- data_dp03[grepl("Unemployment Rate",
                            data_dp03$Label..Grouping.), ]
rate_row

# Extract the Percent values for DC and Hawaii County
dc_unemp_rate <- rate_row$District.of.Columbia..District.of.Columbia..Percent
hi_unemp_rate <- rate_row$Hawaii.County..Hawaii..Percent

# View the values
dc_unemp_rate
hi_unemp_rate

# Remove the % sign and convert to numeric
dc_unemp_rate <- as.numeric(gsub("%",
                                 "", 
                                 dc_unemp_rate))
hi_unemp_rate <- as.numeric(gsub("%",
                                 "", 
                                 hi_unemp_rate))

# Check results
dc_unemp_rate
hi_unemp_rate

# Create a data frame for plotting
unemp_data <- data.frame(Region = c("DC", 
                                    "Hawaii County"),
  Unemployment_Rate = c(dc_unemp_rate,
                        hi_unemp_rate))

library(ggplot2)
ggplot(unemp_data, aes(x = Region,
                       y = Unemployment_Rate, 
                       fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Unemployment Rate Comparison: DC vs Hawaii County",
       x = "Region",
       y = "Unemployment Rate (%)") +
  theme_minimal() +
  scale_fill_manual(values = c("steelblue",
                               "orange")) +
  geom_text(aes(label = Unemployment_Rate),
            vjust = -0.5)

earn_row <- data_dp03[grepl("Median earnings for workers",
                            data_dp03$Label..Grouping.), ]
earn_row

dc_earn <- earn_row$District.of.Columbia..District.of.Columbia..Estimate
hi_earn <- earn_row$Hawaii.County..Hawaii..Estimate

dc_earn
hi_earn

dc_earn <- as.numeric(gsub("[$,]",
                           "", 
                           dc_earn))
hi_earn <- as.numeric(gsub("[$,]",
                           "", 
                           hi_earn))

dc_earn
hi_earn

earn_data <- data.frame(Region = c("DC",
                                   "Hawaii County"),
                        Median_Earnings = c(dc_earn,
                                            hi_earn))
earn_data

library(ggplot2)

ggplot(earn_data, aes(x = Region,
                      y = Median_Earnings, 
                      fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Median Earnings Comparison: DC vs Hawaii County",
       x = "Region",
       y = "Median Earnings (USD)") +
  theme_minimal() +
  scale_fill_manual(values = c("steelblue",
                               "orange")) +
  geom_text(aes(label = paste0("$",
                               format(Median_Earnings,
                                           big.mark=","))),
            vjust = -0.5)
  