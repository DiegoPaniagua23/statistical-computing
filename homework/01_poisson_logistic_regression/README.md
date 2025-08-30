# Homework 01: Poisson and Logistic Regression Analysis

This homework assignment covers three statistical problems that demonstrate the application of logistic and Poisson regression techniques. The assignment combines theoretical derivations with practical data analysis using R.

## Assignment Overview

The homework consists of three main problems:

### Problem 1: Logistic Regression and McNemar's Test
- **Objective**: Analyze Canadian Prime Minister approval data using logistic regression
- **Key Tasks**:
  - Derive the log-likelihood function for logistic regression
  - Prove that the MLE estimator for β₁ is the log odds ratio
  - Apply McNemar's test to compare paired proportions
- **Statistical Concepts**: Maximum likelihood estimation, odds ratios, paired data analysis

### Problem 2: Theoretical Derivation
- **Objective**: Prove that Bayes' theorem leads to logistic regression form
- **Key Tasks**:
  - Use Bayes' theorem with normal distributions conditional on binary outcomes
  - Show that P(Y=1|X) follows the logistic model form
  - Derive the relationship β = (μ₁ - μ₀)/σ²
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

The repository is organized as follows:

- **`/code`**: Contains all the R code, data, and generated results for Problem 3.
  - **`/code/data`**: Holds the raw dataset `datos_pacientes.csv` (T4 cell counts).
  - **`/code/scripts`**: Includes the R scripts that form the analysis pipeline.
    - `01_carga_limpieza.R`: Data creation and loading script.
    - `02_analisis_exploratorio.R`: Exploratory data analysis with visualizations.
    - `03_modelo_poisson.R`: Poisson and quasi-Poisson model fitting.
  - **`/code/results`**: Stores the outputs from the analysis.
    - **`/figures`**: EDA plots (boxplots, histograms, density plots).
    - **`/models`**: Saved model objects (`.rds` files).
- **`/report`**: Contains the complete LaTeX report with all three problems.
  - `main.tex`: Main LaTeX document with formatting and structure.
  - `structure.tex`: Content with mathematical derivations and analysis.
  - `ref.bib`: Bibliography file.
  - **`/images`**: Figures used in the report.

## Dataset Description (Problem 3)

The analysis uses T4 cell count data comparing:
- **Group H**: 20 patients with Hodgkin's disease (in remission)
- **Group No-H**: 20 patients with other diseases (in remission)

Each observation represents T4 cell counts per mm³ of blood, which are naturally modeled using Poisson regression due to their count nature.

## Key Statistical Methods Applied

### Exploratory Data Analysis
- **Comparative boxplots**: Visual comparison of group distributions
- **Histograms**: Assessment of distributional shapes and potential outliers
- **Density plots**: Smooth distribution comparisons
- **Summary statistics**: Central tendency and variability measures by group

### Statistical Modeling
- **Poisson GLM**: Initial model fitting with log-link function
- **Overdispersion assessment**: Deviance-to-degrees-of-freedom ratio analysis
- **Quasi-Poisson correction**: Addressing overdispersion (φ = 277.06)
- **Model comparison**: Standard vs. quasi-Poisson approaches

### Statistical Inference
- **Parameter estimation**: Maximum likelihood estimation for group effects
- **Confidence intervals**: 90% CI for the ratio of means between groups
- **Hypothesis testing**: Testing for significant differences between groups
- **Effect size interpretation**: Clinical significance of observed differences

## Key Findings

From the Poisson regression analysis:
- **Group difference**: Hodgkin patients have significantly higher T4 counts
- **Effect size**: Non-Hodgkin patients have ~36.6% lower counts on average
- **Confidence interval**: Ratio of means between groups is [0.450, 0.893]
- **Statistical significance**: p = 0.035 after correcting for overdispersion

## Methodology and Workflow

### 1. Data Preparation
- Manual data entry from problem statement
- Data structure validation and summary statistics
- CSV export for reproducible analysis

### 2. Exploratory Analysis
- Visual exploration using ggplot2
- Assessment of distributional assumptions
- Identification of potential modeling challenges (outliers, skewness)

### 3. Statistical Modeling
- GLM fitting with Poisson family
- Diagnostic checking (overdispersion detection)
- Model refinement using quasi-Poisson approach
- Parameter interpretation and inference

### 4. Results Communication
- Comprehensive LaTeX report with mathematical derivations
- Integration of R analysis with theoretical concepts
- Professional figure preparation and table formatting

## Reproducibility

All analyses can be reproduced by running the R scripts in order:
1. `01_carga_limpieza.R` - Creates and saves the dataset
2. `02_analisis_exploratorio.R` - Generates all exploratory plots
3. `03_modelo_poisson.R` - Fits models and performs inference

The complete mathematical derivations and interpretations are available in the LaTeX report.
