# DATA 205 – Homework 5B
# Socioeconomic Comparison: Washington, DC vs. Hawaii County
# Dataset: ACS DP03 (Employment and Income Characteristics)

##############################
# 1. Explore the DP03 Dataset
##############################

# View first few rows to understand structure
head(data_dp03)

# View column names to identify DC and Hawaii County variables
colnames(data_dp03)

# VISUALIZATION #1: Unemployment Rate Comparison

# The dataset contains indentation spacing in the Label column.
# Use grepl() to correctly locate the "Unemployment Rate" row.
rate_row <- data_dp03[grepl("Unemployment Rate",
                            data_dp03$Label..Grouping.), ]

# Extract unemployment rate percent values
dc_unemp_rate <- rate_row$District.of.Columbia..District.of.Columbia..Percent
hi_unemp_rate <- rate_row$Hawaii.County..Hawaii..Percent

# Remove % symbol and convert to numeric for plotting
dc_unemp_rate <- as.numeric(gsub("%",
                                 "", 
                                 dc_unemp_rate))
hi_unemp_rate <- as.numeric(gsub("%",
                                 "", 
                                 hi_unemp_rate))

# Create a clean data frame for visualization
unemp_data <- data.frame(
  Region = c("Washington, DC",
             "Hawaii County"),
  Unemployment_Rate = c(dc_unemp_rate, 
                        hi_unemp_rate))

# Load visualization package
library(ggplot2)

# Create bar chart comparing unemployment rates
ggplot(unemp_data, aes(x = Region,
                       y = Unemployment_Rate,
                       fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Unemployment Rate Comparison",
       x = "Region",
       y = "Unemployment Rate (%)") +
  theme_minimal() +
  scale_fill_manual(values = c("steelblue",
                               "orange")) +
  geom_text(aes(label = Unemployment_Rate),
            vjust = -0.5)

###############################################
# VISUALIZATION #2: Median Earnings Comparison
###############################################

# Locate the row containing "Median earnings for workers"
earn_row <- data_dp03[grepl("Median earnings for workers",
                            data_dp03$Label..Grouping.), ]

# Extract dollar estimates for each region
dc_earn <- earn_row$District.of.Columbia..District.of.Columbia..Estimate
hi_earn <- earn_row$Hawaii.County..Hawaii..Estimate

# Remove dollar signs and commas, then convert to numeric
dc_earn <- as.numeric(gsub("[$,]",
                           "", 
                           dc_earn))
hi_earn <- as.numeric(gsub("[$,]",
                           "", 
                           hi_earn))

# Create data frame for plotting
earn_data <- data.frame(
  Region = c("Washington, DC", 
             "Hawaii County"),
  Median_Earnings = c(dc_earn, hi_earn))

# Create bar chart comparing median earnings
ggplot(earn_data, aes(x = Region,
                      y = Median_Earnings,
                      fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Median Earnings Comparison",
       x = "Region",
       y = "Median Earnings (USD)") +
  theme_minimal() +
  scale_fill_manual(values = c("steelblue", 
                               "orange")) +
  geom_text(aes(label = paste0("$",
                               format(Median_Earnings,
                                      big.mark=","))),
            vjust = -0.5)
  
