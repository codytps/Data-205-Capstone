# DATA 205 - EDA
# Name: Cody Paulay-Simmons
# Project: Socioeconomic Comparison (DC vs Hawaii)

# --------------
# Load Library
# --------------
library(ggplot2)

# ----------
# Load Data
# ----------
data_dp03 <- read.csv("~/Desktop/Data 205/Capstone Project/Data/DP03_HI_DC.csv")
data_dp02 <- read.csv("~/Desktop/Data 205/Capstone Project/Data/DP02_HI_DC.csv")

# ----------------
# Explore Dataset
# ----------------
# View data
head(data_dp03)
colnames(data_dp03)
unique(data_dp03$Label..Grouping.)

# ----------------------
# Extract Key Variables
# ----------------------
# Unemployment Rate
unemp_row <- data_dp03[grepl("Unemployment Rate", data_dp03$Label..Grouping.),]

# Median Earnings
earn_row <- data_dp03[grepl("Median earnings for workers", data_dp03$Label..Grouping.),]

# Median Household Income
income_row <- data_dp03[grepl("Median household income", data_dp03$Label..Grouping.),]

# Poverty (All people)
poverty_row <- data_dp03[grepl("All people", data_dp03$Label..Grouping.),]

# -----------
# Clean Data
# -----------

# Unemployment Rate
dc_unemp <- as.numeric(gsub("%", "", unemp_row$District.of.Columbia..District.of.Columbia..Percent))
hi_unemp <- as.numeric(gsub("%", "", unemp_row$Hawaii.County..Hawaii..Percent))

# Median Earnings
dc_earn <- as.numeric(gsub(",", "", earn_row$District.of.Columbia..District.of.Columbia..Estimate))
hi_earn <- as.numeric(gsub(",", "", earn_row$Hawaii.County..Hawaii..Estimate))

# Median Household Income
dc_income <- as.numeric(gsub(",", "", income_row$District.of.Columbia..District.of.Columbia..Estimate))
hi_income <- as.numeric(gsub(",", "", income_row$Hawaii.County..Hawaii..Estimate))

# Poverty Rate
dc_poverty <- as.numeric(gsub("%", "", poverty_row$District.of.Columbia..District.of.Columbia..Percent))
hi_poverty <- as.numeric(gsub("%", "", poverty_row$Hawaii.County..Hawaii..Percent))

# -------------------
# Create Data Frames
# -------------------
unemp_data <- data.frame(Region = c("DC", "Hawaii County"),
                         Unemployment_Rate = c(dc_unemp, hi_unemp))

earn_data <- data.frame(Region = c("DC", "Hawaii County"),
                        Median_Earnings = c(dc_earn, hi_earn))

income_data <- data.frame(Region = c("DC", "Hawaii County"),
                          Median_Household_Income = c(dc_income, hi_income))

poverty_data <- data.frame(Region = c("DC", "Hawaii County"),
                           Poverty = c(dc_poverty, hi_poverty))

# ---------------
# Visualizations
# ---------------
### Plot 1: Unemployment Rate ###
ggplot(unemp_data, aes(x = Region,
                       y = Unemployment_Rate,
                       fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Unemployment Rate Comparison: DC vs Hawaii County",
       x = "Region",
       y = "Unemployment Rate (%)") +
  theme_minimal() +
  scale_fill_manual(values = c("navy", "red")) +
  geom_text(aes(label = Unemployment_Rate),
            vjust = -0.5)

# DC has a higher unemployment rate than Hawaii County,
# indicating slightly weaker employment conditions in the DC region.

### Plot 2: Median Earnings ###
ggplot(earn_data, aes(x = Region,
                      y = Median_Earnings,
                      fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Median Earnings Comparison: DC vs Hawaii County",
       x = "Region",
       y = "Median Earnings (USD)") +
  theme_minimal() +
  scale_fill_manual(values = c("navy", "red")) +
  geom_text(aes(label = paste0("$",
                               format(Median_Earnings, big.mark = ","))),
            vjust = -0.5)

# DC has doubled the median earnings than Hawaii County,
# indicating stronger income levels in the DC region.

### Plot 3: Median Household Income ###
ggplot(income_data, aes(x = Region,
                        y = Median_Household_Income,
                        fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Median Household Income Comparison: DC vs Hawaii County",
       x = "Region",
       y = "Median Household Income (USD)") +
  theme_minimal() +
  scale_fill_manual(values = c("navy", "red")) +
  geom_text(aes(label = paste0("$",
                               format(Median_Household_Income, big.mark = ","))),
            vjust = -0.5)

# DC has a higher median household income than Hawaii County,
# indicating stronger overall household earning power in the DC region.

### Plot 4: Poverty ###
ggplot(poverty_data, aes(x = Region,
                       y = Poverty,
                       fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Poverty Rate Comparison: DC vs Hawaii County",
       x = "Region",
       y = "Poverty Rate (%)") +
  theme_minimal() +
  scale_fill_manual(values = c("navy", "red")) +
  geom_text(aes(label = Poverty),
            vjust = -0.5)

# DC has a slightly higher poverty rate than Hawaii County,
# indicating a marginally greater proportion of individuals below the poverty level in DC.

# -----------------
# Overall Findings
# -----------------
# Washington, DC shows higher income and earnings levels compared to Hawaii County,
# but also experiences higher unemployment and poverty rates.
# This suggests greater economic opportunity alongside increased inequality in DC.





















