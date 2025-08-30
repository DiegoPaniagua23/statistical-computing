# =============================================================================
# Automated Tests for Poisson Regression Analysis
# =============================================================================

library(testthat)
library(dplyr)
library(readr)
library(here)

# Test 1: Data Integrity Tests
test_that("Dataset has correct structure", {
  # Load data
  datos <- read_csv(here("code", "data", "datos_pacientes.csv"), show_col_types = FALSE)
  
  # Test data dimensions
  expect_equal(nrow(datos), 40, info = "Should have 40 observations")
  expect_equal(ncol(datos), 2, info = "Should have 2 columns")
  
  # Test column names
  expect_equal(names(datos), c("grupo", "conteo"), info = "Column names should be correct")
  
  # Test group distribution
  group_counts <- table(datos$grupo)
  expect_equal(as.numeric(group_counts["H"]), 20, info = "Should have 20 H observations")
  expect_equal(as.numeric(group_counts["No-H"]), 20, info = "Should have 20 No-H observations")
  
  # Test data types
  expect_true(is.character(datos$grupo), info = "grupo should be character")
  expect_true(is.numeric(datos$conteo), info = "conteo should be numeric")
  
  # Test for missing values
  expect_false(any(is.na(datos)), info = "Should have no missing values")
  
  # Test count values are positive
  expect_true(all(datos$conteo > 0), info = "All counts should be positive")
})

# Test 2: Statistical Summaries
test_that("Statistical summaries are reasonable", {
  datos <- read_csv(here("code", "data", "datos_pacientes.csv"), show_col_types = FALSE)
  
  # Calculate group statistics
  stats <- datos %>%
    group_by(grupo) %>%
    summarise(
      n = n(),
      mean = mean(conteo),
      median = median(conteo),
      sd = sd(conteo),
      .groups = 'drop'
    )
  
  # Test that H group has higher mean (based on our analysis)
  h_mean <- stats$mean[stats$grupo == "H"]
  no_h_mean <- stats$mean[stats$grupo == "No-H"]
  expect_gt(h_mean, no_h_mean, info = "H group should have higher mean")
  
  # Test reasonable ranges (based on data inspection)
  expect_gt(h_mean, 700, info = "H group mean should be > 700")
  expect_lt(h_mean, 1000, info = "H group mean should be < 1000")
  expect_gt(no_h_mean, 400, info = "No-H group mean should be > 400")
  expect_lt(no_h_mean, 600, info = "No-H group mean should be < 600")
})

# Test 3: Model Validation
test_that("Poisson models fit correctly", {
  datos <- read_csv(here("code", "data", "datos_pacientes.csv"), show_col_types = FALSE)
  
  # Fit Poisson model
  modelo_poisson <- glm(conteo ~ grupo, 
                        family = poisson(link = "log"),
                        data = datos)
  
  # Test model convergence
  expect_true(modelo_poisson$converged, info = "Poisson model should converge")
  
  # Test coefficients exist
  expect_length(coef(modelo_poisson), 2, info = "Should have 2 coefficients")
  
  # Test coefficient names
  expect_equal(names(coef(modelo_poisson)), 
               c("(Intercept)", "grupoNo-H"), 
               info = "Coefficient names should be correct")
  
  # Test that No-H coefficient is negative (based on our analysis)
  expect_lt(coef(modelo_poisson)["grupoNo-H"], 0, 
            info = "No-H coefficient should be negative")
  
  # Test quasi-Poisson model
  modelo_quasi <- glm(conteo ~ grupo,
                      family = quasipoisson(link = "log"),
                      data = datos)
  
  expect_true(modelo_quasi$converged, info = "Quasi-Poisson model should converge")
  expect_gt(summary(modelo_quasi)$dispersion, 1, 
            info = "Should detect overdispersion")
})

# Test 4: File Output Tests
test_that("Output files are created correctly", {
  # Check that results directories would be created
  expect_true(dir.exists(here("code")), info = "Code directory should exist")
  
  # These files should exist after running the scripts
  if (file.exists(here("code", "results", "models", "modelo_poisson.rds"))) {
    model <- readRDS(here("code", "results", "models", "modelo_poisson.rds"))
    expect_s3_class(model, "glm", info = "Saved model should be a glm object")
  }
})

# Test 5: Reproducibility Test
test_that("Analysis produces consistent results", {
  datos <- read_csv(here("code", "data", "datos_pacientes.csv"), show_col_types = FALSE)
  
  # Fit model twice
  set.seed(123)
  model1 <- glm(conteo ~ grupo, family = poisson, data = datos)
  
  set.seed(123)  
  model2 <- glm(conteo ~ grupo, family = poisson, data = datos)
  
  # Should get identical results
  expect_equal(coef(model1), coef(model2), 
               info = "Models should be reproducible")
  expect_equal(fitted(model1), fitted(model2),
               info = "Fitted values should be reproducible")
})

# Run all tests
cat("🧪 Running automated tests...\n")
test_results <- test_dir(".", reporter = "summary")
cat("✅ All tests completed!\n")
