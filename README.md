# Statistical Computing - CIMAT Master's Program

[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![R](https://img.shields.io/badge/R-276DC3?logo=r&logoColor=white)](https://www.r-project.org/)
[![LaTeX](https://img.shields.io/badge/LaTeX-008080?logo=latex&logoColor=white)](https://www.latex-project.org/)

This repository contains assignments and projects for the **Statistical Computing** course in the Master's program at [CIMAT](https://www.cimat.mx/) (Center for Research in Mathematics). The coursework emphasizes the practical application of statistical theory using computational methods, primarily with R programming.

## 🎯 Course Objectives

The main goals of this repository are to:
- Apply theoretical statistical concepts to real-world data analysis problems
- Develop proficiency in R programming for statistical computing
- Create reproducible research workflows
- Master advanced statistical modeling techniques (GLMs, regression analysis, etc.)
- Integrate mathematical theory with computational implementation

## 📚 Course Content

This course covers key areas of statistical computing including:
- **Generalized Linear Models (GLMs)**: Poisson, logistic, and other regression models
- **Maximum Likelihood Estimation**: Theory and computational implementation
- **Model Diagnostics**: Overdispersion, residual analysis, model validation
- **Statistical Inference**: Confidence intervals, hypothesis testing, Bayesian methods
- **Reproducible Research**: Version control, documentation, and workflow management

## 📁 Repository Structure

The repository follows a clear organizational structure:

```
statistical-computing/
├── homework/                    # Course assignments
│   ├── 01_poisson_logistic_regression/
│   │   ├── code/               # R scripts and data
│   │   ├── report/             # LaTeX documents
│   │   └── README.md           # Assignment details
│   └── [future assignments]/
├── LICENSE                     # MIT license
├── ADVANCED_SETUP.md          # Development best practices
└── README.md                  # This file
```

## 📊 Assignments

Each assignment combines theoretical derivations with practical data analysis. Below is the current course progress:

| Assignment | Topic | Status | Key Methods | Link |
|------------|-------|---------|-------------|---------|
| **01** | **Poisson & Logistic Regression** | ✅ Complete | GLMs, MLE, McNemar's Test | [📂 View](./homework/01_poisson_logistic_regression/) |
| 02 | Bayesian Methods | 🚧 Upcoming | MCMC, Posterior Analysis | Coming soon |
| 03 | Multivariate Analysis | 📋 Planned | PCA, Clustering, Classification | Coming soon |
| 04 | Time Series Analysis | 📋 Planned | ARIMA, Forecasting, Stationarity | Coming soon |

### Assignment 01: Detailed Overview

The first assignment demonstrates a comprehensive statistical analysis workflow:

**Theoretical Components:**
- Logistic regression likelihood derivation
- Maximum likelihood estimation theory
- Bayesian theorem applications to classification

**Practical Implementation:**
- Poisson regression for count data (T4 cell analysis)
- Overdispersion detection and correction
- Model diagnostics and validation
- Confidence interval construction

**Key Findings:**
- Significant difference in T4 cell counts between patient groups
- Overdispersion factor φ = 277.06 requiring quasi-Poisson correction
- Hodgkin patients show 63.4% higher T4 counts (95% CI: [1.12, 2.22])

## 🛠 Technical Stack

**Programming & Analysis:**
- **R** (≥4.3.0): Statistical computing and graphics
- **Key R Packages**: `dplyr`, `ggplot2`, `MASS`, `testthat`

**Documentation & Reporting:**
- **LaTeX**: Professional mathematical typesetting
- **Markdown**: Repository documentation
- **Git**: Version control and collaboration

**Development Tools:**
- **RStudio**: Integrated development environment
- **renv**: Reproducible package management
- **testthat**: Automated testing framework

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:
- R (version ≥4.3.0)
- RStudio (recommended)
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Git

### Quick Start

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

## 🔬 Reproducibility

This repository emphasizes reproducible research practices:

- **Modular Code**: Each analysis is broken into logical, reusable scripts
- **Version Control**: All changes are tracked with meaningful commit messages
- **Documentation**: Comprehensive README files and inline code comments
- **Testing**: Automated tests ensure code reliability
- **Environment Management**: Package versions and dependencies are documented

## 📈 Statistical Methods Covered

### Regression Analysis
- **Linear Models**: OLS, assumptions, diagnostics
- **Generalized Linear Models**: Poisson, logistic, gamma regression
- **Model Selection**: AIC/BIC, cross-validation, regularization

### Inference & Testing
- **Maximum Likelihood Estimation**: Theory and computation
- **Hypothesis Testing**: Classical and modern approaches
- **Confidence Intervals**: Profile likelihood, bootstrap methods
- **Bayesian Methods**: Prior specification, posterior analysis

### Computational Methods
- **Optimization**: Newton-Raphson, IRLS algorithms
- **Simulation**: Monte Carlo, bootstrap, permutation tests
- **Numerical Integration**: Quadrature methods

## 🤝 Contributing

This is an academic repository, but improvements are welcome:

1. **Bug Reports**: Use GitHub issues for any problems
2. **Documentation**: Suggest improvements to clarity
3. **Code Review**: Feedback on statistical methods or R implementation

## 📧 Contact

**Student**: Diego  
**Institution**: CIMAT (Centro de Investigación en Matemáticas)  
**Program**: Master's in Statistics  
**Course**: Statistical Computing  

For questions about specific assignments or statistical methods, please refer to the individual assignment README files or create an issue.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*This repository represents academic work in statistical computing, demonstrating the integration of mathematical theory with practical data analysis using modern computational tools.*
