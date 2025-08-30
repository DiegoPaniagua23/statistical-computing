# Homework 01: Poisson and Logistic Regression Analysis

This homework assignment covers three statistical problems that demonstrate the application of logistic and Poisson regression techniques. The assignment combines theoretical derivations with practical data analysis using R.

## Assignment Overview

The homework consists of three main problems:

### Problem 1: Logistic Regression and McNemar's Test
- **Objective**: Analyze Canadian Prime Minister approval data using logistic regression
- **Key Tasks**:
  - Derive the log-likelihood function for logistic regression
  - Prove that the MLE estimator for $\beta_1$ is the log odds ratio
  - Apply McNemar's test to compare paired proportions
- **Statistical Concepts**: Maximum likelihood estimation, odds ratios, paired data analysis

### Problem 2: Theoretical Derivation
- **Objective**: Prove that Bayes' theorem leads to logistic regression form
- **Key Tasks**:
  - Use Bayes' theorem with normal distributions conditional on binary outcomes
  - Show that $P(Y=1|X)$ follows the logistic model form
  - Derive the relationship $\beta = (\mu_1 - \mu_0)/\sigma^2$
- **Statistical Concepts**: Bayes' theorem, conditional distributions, logistic transformation

### Problem 3: Poisson Regression Analysis (Practical Implementation)
- **Objective**: Compare T4 cell counts between Hodgkin and non-Hodgkin patients
- **Key Tasks**:
  - Perform comprehensive exploratory data analysis
  - Fit Poisson regression model and assess overdispersion
  - Use quasi-Poisson model to correct for overdispersion
  - Construct confidence intervals and perform statistical inference
- **Statistical Concepts**: GLMs, overdispersion, model diagnostics, confidence intervals

## Project Structure

The assignment is organized as follows:

```
01_poisson_logistic_regression/
├── code/                       # R analysis implementation
│   ├── data/
│   │   └── datos_pacientes.csv # T4 cell counts dataset
│   ├── scripts/
│   │   ├── 01_carga_limpieza.R # Data creation and loading
│   │   ├── 02_analisis_exploratorio.R # EDA and visualizations
│   │   └── 03_modelo_poisson.R # Poisson/quasi-Poisson modeling
│   └── results/
│       ├── figures/            # Generated plots
│       └── models/             # Saved model objects (.rds)
├── report/                     # LaTeX documentation
│   ├── main.tex               # Main document structure
│   ├── structure.tex          # Content and derivations
│   ├── ref.bib                # Bibliography
│   └── images/                # Figures for report
├── setup_renv.R               # Environment setup script
└── README.md                  # This file
```

## Reproducibility

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/statistical-computing.git
   cd statistical-computing
   ```

2. **Set up R environment:**
   ```r
   # Install required packages
   install.packages(c("dplyr", "ggplot2", "MASS", "testthat", "rmarkdown"))
   ```

3. **Navigate to an assignment:**
   ```bash
   cd homework/01_poisson_logistic_regression/
   ```

4. **Run the analysis:**
   ```r
   # Execute scripts in order
   source("code/scripts/01_carga_limpieza.R")
   source("code/scripts/02_analisis_exploratorio.R")
   source("code/scripts/03_modelo_poisson.R")
   ```

The complete mathematical derivations and interpretations are available in the LaTeX report.
