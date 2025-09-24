# Statistical Computing 

[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![R](https://img.shields.io/badge/R-276DC3?logo=r&logoColor=white)](https://www.r-project.org/)
[![LaTeX](https://img.shields.io/badge/LaTeX-008080?logo=latex&logoColor=white)](https://www.latex-project.org/)

This repository contains assignments and projects for the **Statistical Computing** course in the Master's program at [CIMAT](https://www.cimat.mx/) (Center for Research in Mathematics). The coursework emphasizes the practical application of statistical theory using computational methods, primarily with R programming.

## 📚 Course Content

This course covers key areas of statistical computing including:

1. **Generalized linear models**
    - Logistic and Poisson regression models
    - Generalized linear models, the general case
    - Linear models of variance and covariance analysis
    - Log-linear models
2. **Time series analysis**
    - Stochastic processes
	- Autocovariance and autocorrelation 
    - Stationary time series
    - Autoregressive processes
    - Moving average processes
    - ARMA processes
    - Spectral analysis of time series
3. **Computational intensive estimation methods** 
     - EM algorithm
	 - MCMC algorithms 
     - Bootstrap 
4. **Model evaluation and selection in regression analysis**
     - Criteria for evaluating and selecting the appropriate model
     - Prediction error estimation: Cross-validation
     - Model selection methods: Stepwise methods, AIC, BIC
	 - Variable selection methods: Regularization, Ridge,
       LARS, LASSO
5. **Data imputation methods**
    - Methods based on regression and covariance analysis.
    - Methods based on the EM algorithm
    - Bayesian imputation
    - Methods based on machine learning techniques

Translated with DeepL.com (free version)

## 📁 Repository Structure

The repository follows the next structure:

```
statistical-computing/
├── homework/                                   # Course assignments
│   ├── 01_poisson_logistic_regression/
│   │   ├── R/                                  # Scripts, data and derived outputs
│   │   │   ├── data/
│   │   │   ├── results/
│   │   │   └── scripts/
│   │   ├── report/                             # LaTeX sources and figures
│   │   ├── README.md                           
│   │   └── setup_renv.R                        
│   └── 02_glms_categorical_and_count_data/
│   │   ├── R/
│   │   │   ├── data/
│   │   │   ├── results/
│   │   │   └── scripts/
│   │   ├── report/
│   │   ├── README.md                           
│   │   └── setup_renv.R                       
├── LICENSE
└── README.md
```

## 📊 Assignments

The current course progress:

| Assignment | Topic | Key Methods | Link |
|------------|-------|-------------|------|
| **01** | **Poisson & Logistic Regression** | GLMs, MLE, McNemar's Test | [📂 View](./homework/01_poisson_logistic_regression/) |
| **02** | **GLMs: Categorical & Count Data** | Logistic models, Poisson regression, diagnostics | [📂 View](./homework/02_glms_categorical_and_count_data/) |
| 03 | ... | ... | ... |
| 04 | ... | ... | ... |

## 🛠 Technical Stack

**Programming & Analysis:**
- **R** (≥4.3.0): Statistical computing and graphics
- **Key R Packages**: `dplyr`, `ggplot2`, `MASS`

**Documentation & Reporting:**
- **LaTeX**: Professional mathematical typesetting
- **Markdown**: Repository documentation
- **Git**: Version control

**Development Tools:**
- **RStudio**: Integrated development environment
- **renv**: Reproducible package management

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:
- R (version ≥4.3.0)
- RStudio (recommended)
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Git

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*This repository represents academic work in statistical computing, demonstrating the integration of mathematical theory with practical data analysis using modern computational tools.*
