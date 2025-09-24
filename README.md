# Statistical Computing 

[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![R](https://img.shields.io/badge/R-276DC3?logo=r&logoColor=white)](https://www.r-project.org/)
[![LaTeX](https://img.shields.io/badge/LaTeX-008080?logo=latex&logoColor=white)](https://www.latex-project.org/)

This repository contains assignments and projects for the **Statistical Computing** course in the Master's program at [CIMAT](https://www.cimat.mx/) (Center for Research in Mathematics). The coursework emphasizes the practical application of statistical theory using computational methods, primarily with R programming.

## 📚 Course Content

This course covers key areas of statistical computing including:
- **Generalized Linear Models (GLMs)**: Poisson, logistic, ...

## 📁 Repository Structure

The repository follows the next structure:

```
statistical-computing/
├── homework/                                  # Course assignments
│   ├── 01_poisson_logistic_regression/
│   │   ├── R/                                  # Scripts, data and derived outputs
│   │   │   ├── data/
│   │   │   ├── results/
│   │   │   └── scripts/
│   │   ├── report/                             # LaTeX sources and figures
│   │   ├── README.md                           # Assignment outline
│   │   └── setup_renv.R                        # Optional renv helper (scoped)
│   └── 02_glms_categorical_and_count_data/
│       ├── R/
│       │   ├── data/
│       │   ├── results/
│       │   └── scripts/
│       ├── report/
│       └── MCE_ComputoEstadistico_Tarea_02.pdf
├── LICENSE
└── README.md
```

> Large reference material (class slides, syllabus, books) lives under
> `diapositivas/`, `temario/`, `libros/` and `2024/`. These directories are
> intentionally ignored by Git due to file size.

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
- **Key R Packages**: `dplyr`, `ggplot2`, `MASS`, `testthat`

**Documentation & Reporting:**
- **LaTeX**: Professional mathematical typesetting
- **Markdown**: Repository documentation
- **Git**: Version control

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

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*This repository represents academic work in statistical computing, demonstrating the integration of mathematical theory with practical data analysis using modern computational tools.*
