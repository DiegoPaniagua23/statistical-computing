# Homework 02: GLMs for Categorical and Count Data

This assignment provides a comprehensive exploration of Generalized Linear Models (GLMs), covering foundational theory, practical application, and advanced modeling techniques for both categorical and count data. The solutions involve theoretical derivations, exploratory data analysis, model fitting, and diagnostics in R.

## Assignment Overview

The homework is structured into a series of distinct problems, each targeting key concepts in statistical modeling:

### Problem 1: Comparing Logit and Probit Models for Ordinal Data

- **Objective**: Analyze the relationship between snoring frequency and the incidence of heart disease.
- **Key Tasks**:
    - Fit a binomial GLM using a logit link and interpret the coefficients as log-odds.
    - Fit a binomial GLM using a probit link and interpret the coefficients as Z-scores.
    - Compare the models based on AIC and visual fit to the data.
- **Statistical Concepts**: Binomial GLMs, Link Functions (Logit vs. Probit), AIC for Model Comparison.

### Problem 2: Diagnosing Model Failure in Poisson Regression

- **Objective**: Model the number of satellite male crabs based on female crab characteristics.
- **Key Tasks**:
    - Attempt to fit a Poisson regression model to a small dataset.
    - Diagnose model failure by identifying signs of instability: multicollinearity (singularity), extremely large standard errors, and near-zero residual deviance (overfitting).
- **Statistical Concepts**: Poisson Regression, Multicollinearity, Overfitting, Model Diagnostics.

### Problem 3: ROC Analysis for Model Evaluation

- **Objective**: Evaluate the performance of a logistic regression model predicting coronary heart disease from age.
- **Key Tasks**:
    - Construct a Receiver Operating Characteristic (ROC) curve.
    - Calculate the Area Under the Curve (AUC) as a measure of discriminatory power.
    - Determine the optimal classification threshold using Youden's J Index.
    - Interpret the confusion matrix at the optimal threshold.
- **Statistical Concepts**: ROC Curve, AUC, Sensitivity, Specificity, Youden's J Index, Classification Thresholds.

### Problem 4: Model Selection for Insurance Claim Data

- **Objective**: Model the rate of insurance claims based on car type, driver's age, and district.
- **Key Tasks**:
    - Fit a full logistic regression model with all main effects and interactions.
    - Fit a simplified, parsimonious model with only main effects.
    - Compare the two models using an Analysis of Deviance (ANOVA) test and AIC to justify the selection of the simpler model.
- **Statistical Concepts**: Logistic Regression for Rates, Interaction Effects, Model Selection, Parsimony, Analysis of Deviance.

### Problem 5: Minimum Chi-Square Estimation

- **Objective**: Estimate population proportions using an alternative to MLE.
- **Key Tasks**:
    - Define the Pearson Chi-Square statistic as an objective function.
    - Use numerical optimization (nlminb in R) to find the parameter estimates that minimize this statistic under constraints.
- **Statistical Concepts**: Minimum Chi-Square Estimation, Pearson's $\chi^2$ Statistic, Numerical Optimization.

### Problem 6: Log-Linear Models for Multi-way Contingency Tables

- **Objective**: Analyze the factors affecting survival on the Titanic.
- **Key Tasks**:
    - Fit a saturated log-linear model to the four-way contingency table (Class, Sex, Age, Survived).
    - Use backward elimination (drop1) and an Analysis of Deviance to simplify the model.
    - Interpret the significant three-way interaction terms in the final model.
- **Statistical Concepts**: Log-linear Models, Contingency Tables, Saturated Models, Hierarchical Model Selection.

### Problem 7: Logistic Regression for 2x2 Tables

- **Objective**: Determine the effectiveness of ascorbic acid (Vitamin C) in preventing the common cold.
- **Key Tasks**:
    - Fit a logistic regression model to a 2x2 table.
    - Interpret the statistical significance of the treatment coefficient.
    - Calculate and interpret the Odds Ratio to quantify the treatment's effect size.
- **Statistical Concepts**: Logistic Regression, 2x2 Tables, Odds Ratio Interpretation.

## Project Structure

The assignment is organized as follows:

```
02_glms_categorical_and_count_data/
├── R/
│   ├── figures/
│   │   └── models/
│   └── scripts/
│       ├── 02_ronquidos_enfermedad_cardiaca.R
│       ├── 03_cangrejos_cacerola.R
│       ├── 05_edad_daño_cornario.R
│       ├── 07_polizas_seguros.R
│       ├── 08_minima_ji_cuadrada.R
│       ├── 09_supervivencia_titanic.R
│       └── 10_placebo_acidfo_ascorbico_gripe.R
├── report/
│   ├── Tarea_2_CE.pdf
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
   Rscript homework/02_glms_categorical_and_count_data/setup_renv.R
   ```
   This script installs the packages declared for Homework 01 and updates `renv.lock`. In later sessions you can call `renv::restore()` from the repository root to recreate the same library.

3. **Run the analysis (from the repository root in an R session):**
   ```r
   renv::activate()
   source("homework/02_glms_categorical_and_count_data/R/scripts/02_ronquidos_enfermedad_cardiaca.R")
   source("homework/02_glms_categorical_and_count_data/R/scripts/03_cangrejos_cacerola.R")
   source("homework/02_glms_categorical_and_count_data/R/scripts/05_edad_daño_coronario.R")
   source("homework/02_glms_categorical_and_count_data/R/scripts/07_polizas_seguros.R")
   source("homework/02_glms_categorical_and_count_data/R/scripts/08_minima_ji_cuadrada.R")
   source("homework/02_glms_categorical_and_count_data/R/scripts/09_supervivencia_titanic.R")
   source("homework/02_glms_categorical_and_count_data/R/scripts/10_placebo_acido_ascorbico_gripe.R")
   ```

The complete mathematical derivations, interpretations, and conclusions for all problems are available in the PDF report located in the report/ directory.
