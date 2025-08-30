# =============================================================================
# Setup renv for Reproducible Package Management
# =============================================================================

# Install renv if not already installed
if (!require("renv")) install.packages("renv")

# Initialize renv in this project
# This creates renv.lock and .Rprofile files
renv::init()

# Install required packages for this project
required_packages <- c(
  "dplyr",      # Data manipulation
  "readr",      # Reading CSV files
  "ggplot2",    # Data visualization
  "here",       # Path management
  "knitr",      # For potential R Markdown reports
  "testthat"    # For testing (future use)
)

# Install packages
renv::install(required_packages)

# Create snapshot of current package versions
renv::snapshot()

cat("✅ renv setup complete!\n")
cat("📦 Package versions locked in renv.lock\n")
cat("🔄 Others can restore with: renv::restore()\n")
