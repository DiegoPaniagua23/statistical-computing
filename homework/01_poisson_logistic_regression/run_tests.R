#!/usr/bin/env Rscript
# =============================================================================
# Run All Tests for Homework 01
# =============================================================================

library(here)

cat("🧪 Running all tests for Homework 01\n")
cat("=====================================\n\n")

# Set working directory to the homework folder
setwd(here("homework", "01_poisson_logistic_regression"))

# Check if test file exists
test_file <- here("code", "tests", "test_analysis.R")

if (file.exists(test_file)) {
  cat("📋 Found test file:", test_file, "\n")
  
  # Source the test file
  tryCatch({
    source(test_file)
    cat("✅ All tests completed successfully!\n")
  }, error = function(e) {
    cat("❌ Tests failed with error:\n")
    cat(e$message, "\n")
  })
} else {
  cat("⚠️  Test file not found:", test_file, "\n")
  cat("Please make sure the test file exists.\n")
}

cat("\n🎯 Test run completed.\n")
