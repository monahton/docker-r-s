## This is a dedicated script for the Lazy Trading 4th Course: Statistical Analysis of Trades
# Copyright (C) 2018 Vladimir Zhbanko

# PURPOSE: Analyse trade results in Terminal 1. Indicate when to optimize non performing systems
# NOTE:    Results are written in the Trading System Version Control Repository. 
#          Important: Trading System version control must contain a list of trading systems in use
#                     inside the file Setup.csv

# load packages. 
library(tidyverse)
library(lubridate)

# ----------- Main Steps -----------------
# -- Read trading results from Terminal 1
# -- Analyse results and filter systems where profit factor < 0.7
# -- Write command 'to optimize' to the file

# ----------- TESTS -----------------
# -- Select entire content of the script and execute
# -- Pass: object DFT1 is dataframe
# -- Pass: file 'Date-Re-Train.csv' is written into the trading robot folder
# -- Fail: object DFT1 has class 'try-error'


# =============================================
# *************Used Functions******************
# =============================================
# *** make sure to customize this path
source("/02_code/get_profit_factorDF.R")
source("/02_code/import_data.R")
source("/02_code/check_if_optimize.R")

# =============================================
# ************End of Used Functions************
# =============================================

# -------------------------
# Define terminals path addresses, from where we are going to read/write data
# -------------------------
# terminal 1 path
path_T1 <- "01_data/"

# -------------------------
# read data from trades in terminal 1
# -------------------------
DFT1 <- try(import_data(path_T1, "OrdersResultsT1.csv"), silent = TRUE)

# -------------------------
# data frame T1 analysis and manipulation
# -------------------------

DFT1 %>% group_by(MagicNumber) %>% 
  summarize(pnL = sum(Profit)) %>%
  write_csv("03_output/result.csv")


