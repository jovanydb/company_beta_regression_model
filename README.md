# Company Beta Regression Model

**An exploratory R workflow for estimating a company's sensitivity to market returns.**

[Source](beta_function_v0.R) · [Sample data](nvda_5yr.csv) · [MIT License](LICENSE)

> **Status: early prototype.** The current function regresses stock open-to-close returns on benchmark open-to-close returns. Firm-level predictors such as leverage, industry, and business model remain a future research direction. Predictive accuracy has not been established.

## What is implemented

`beta(stock, benchmark)` creates price charts, computes `(Close.Last - Open) / Open`, fits `lm(change.x ~ change.y)`, and returns a regression summary plus five plot objects. The slope estimates market sensitivity for this return definition and sample.

| File | Role |
| --- | --- |
| [beta_function_v0.R](beta_function_v0.R) | Estimation function and diagnostics |
| [nvda_5yr.csv](nvda_5yr.csv), [nvda_10yr.csv](nvda_10yr.csv) | NVIDIA example datasets |
| [sp500_5yr.csv](sp500_5yr.csv), [sp500_10yr.csv](sp500_10yr.csv) | S&P 500 benchmark datasets |

## Get started

Clone the repository and open an R session in its root directory:

```bash
git clone https://github.com/jovanydb/company_beta_regression_model.git
cd company_beta_regression_model
```

Install the packages loaded by the script:

```r
install.packages(c("tidyverse", "mosaic", "effectsize", "moderndive", "ggfortify"))
source("beta_function_v0.R")
```

Prepare stock and benchmark data frames with numeric `Open` and `Close.Last` columns. Currency symbols and separators in source CSVs must be cleaned before calling the function. Align dates and sort both inputs consistently.

```r
# stock and benchmark: cleaned, aligned numeric inputs
result <- beta(stock, benchmark)
result$lm_summary
result$lm_summary$coefficients["change.y", "Estimate"]
print(result$plots[[4]])
print(result$plots[[5]])
```

## Interpretation and limitations

- The function joins on a generated row index (`Days`), not on calendar dates. Missing sessions or unequal histories can misalign observations unless inputs are reconciled first.
- Open-to-close changes exclude overnight returns and are not the conventional adjusted close-to-close total-return series.
- The script does not subtract a risk-free return, adjust leverage, or validate out-of-sample predictions.
- Historical betas depend on frequency, benchmark, lookback window, and market regime. Inspect residual diagnostics and report those choices with every estimate.

## Research roadmap

1. Replace row-index alignment with an explicit date join and input validation.
2. Add adjusted total-return and excess-return specifications.
3. Compare rolling windows, uncertainty intervals, and out-of-sample stability.
4. Evaluate firm-feature models against transparent historical-beta baselines.

## License

Released under the [MIT License](LICENSE).
