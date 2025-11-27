library(tidyverse)
library(mosaic)
library(effectsize)
library(moderndive)
library(ggfortify)
options(scipen = 999)

beta <- function(stock, benchmark) {
  
  stock <- stock %>%
    mutate(Days = rev(row_number()))
  
  benchmark <- benchmark %>%
    mutate(Days = rev(row_number()))
  
  plot1 <- ggplot(stock, aes(x = Days, y = Close.Last)) + 
    geom_line() +
    labs(
      title = "Stock Chart"
    )
  
  plot2 <- ggplot(benchmark, aes(x = Days, y = Close.Last)) + 
    geom_line() +
    labs(
      title = "Benchmark Chart"
    )
  
  stock <- stock %>%
    mutate(change = (Close.Last - Open)/Open)
  
  benchmark <- benchmark %>%
    mutate(change = (Close.Last - Open)/Open)
  
  stock$dataset <- "stock"
  benchmark$dataset <- "benchmark"
  
  df <- bind_rows(stock, benchmark)
  
  plot3 <- ggplot(df, aes(x = Days, y = change, col = dataset)) +
    geom_line(linewidth = 1) +
    labs(
      title = "Percent change of both stock and benchmark"
    )
  
  df_lm <- merge(stock, benchmark, by = "Days")
  
  lm0 <- lm(change.x ~ change.y, data = df_lm)
  
  lm_summary <- summary(lm0)
  lm_autoplot <- autoplot(lm0)
  #lm_acf <- acf(lm0$residuals)
  
  plot4 <- ggplot(df_lm, aes(x = change.y, y = change.x)) + 
    geom_point() +
    geom_line(aes(x = change.y, y = predict(lm0)), col = "blue") +
    labs(
      title = "Relationship between stock and benchmark returns"
    )
  
  return(list(
    lm_summary = lm_summary,
    plots = list(plot1, plot2, plot3, plot4, lm_autoplot)
  ))
  
}
