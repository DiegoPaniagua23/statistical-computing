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
├── R/
│   ├── data/
│   │   └── datos_pacientes.csv
│   ├── scripts/
│   │   ├── 01_carga_limpieza.R
│   │   ├── 02_analisis_exploratorio.R
│   │   └── 03_modelo_poisson.R
│   └── results/
│       ├── figures/
│       └── models/
├── report/
│   ├── Tarea_1_CE.pdf
│   ├── main.tex
│   ├── structure.tex
│   └── images/
├── setup_renv.R
└── README.md
```

## Reproducibility

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/statistical-computing.git
   cd statistical-computing
   ```

2. **Bootstrap the renv environment for this assignment:**
   ```bash
   Rscript homework/01_poisson_logistic_regression/setup_renv.R
   ```
   This script installs the packages declared for Homework 01 and updates `renv.lock`. In later sessions you can call `renv::restore()` from the repository root to recreate the same library.

3. **Run the analysis (from the repository root in an R session):**
   ```r
   renv::activate()
   source("homework/01_poisson_logistic_regression/R/scripts/01_carga_limpieza.R")
   source("homework/01_poisson_logistic_regression/R/scripts/02_analisis_exploratorio.R")
   source("homework/01_poisson_logistic_regression/R/scripts/03_modelo_poisson.R")
   ```

The complete mathematical derivations and interpretations, and conclusions for all problems are available in the PDF report located in the report/ directory.
