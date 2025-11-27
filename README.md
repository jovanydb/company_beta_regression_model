# Company Beta Regression Model – R Implementation

A regression model that estimates and predicts public company equity betas using historical return data and other firm-level features such as capital structure, industry, and business model characteristics. Some components are still work-in-progress as this is an ongoing project for me. All code here is implemented in **R**.

## Purpose
- Develop a systematic, regression-based approach for estimating public company betas.  
- Incorporate features such as leverage, sector/industry, and business model into beta estimation.  
- Experiment with different lookback windows (e.g., 5-year, 10-year) and market benchmarks (e.g., S&P 500).  
- Build a clean, extensible R codebase that can serve as a foundation for further risk modeling and valuation work.

## Repository Structure
The repository is organized around an initial beta function and supporting datasets:

- `beta_function_v0.R`  
  Core R script containing the first version of the beta estimation logic and helper routines.

- Historical sample datasets (for testing and calibration):  
  - `nvda_10yr.csv`  
  - `nvda_5yr.csv`  
  - `sp500_10yr.csv`  
  - `sp500_5yr.csv`  
  These files include example historical price or return data for a sample company and the S&P 500 index over different horizons.

- `LICENSE`  
  MIT License covering usage and distribution.

## Usage
- Clone or download the repository:  
  ```bash
  git clone https://github.com/jovanydb/company_beta_regression_model.git
  cd company_beta_regression_model
