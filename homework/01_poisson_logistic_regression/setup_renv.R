# =============================================================================
# Setup renv for Reproducible Package Management
# =============================================================================

# Install helper packages on demand -------------------------------------------
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")

# Detect repository root (four levels up from this script) --------------------
repo_root <- normalizePath(here::here("..", "..", "..", ".."), mustWork = TRUE)
if (!file.exists(file.path(repo_root, "README.md")) ||
    !file.exists(file.path(repo_root, "homework"))) {
  stop("No se encontró la raíz del repositorio. Ejecuta este script con el ",
       "directorio de trabajo ubicado en 'statistical-computing/'.")
}

old_wd <- getwd()
setwd(repo_root)
on.exit(setwd(old_wd), add = TRUE)

# Initialize or load renv -----------------------------------------------------
if (!file.exists("renv.lock")) {
  renv::init(bare = TRUE)
} else {
  renv::load()
}

# Install required packages for this project ----------------------------------
required_packages <- c(
  "dplyr",      # Data manipulation
  "readr",      # Reading CSV files
  "ggplot2",    # Data visualization
  "here",       # Path management
  "knitr",      # For potential R Markdown reports
  "testthat"    # For testing (future use)
)

missing_pkgs <- setdiff(required_packages, rownames(installed.packages()))
if (length(missing_pkgs) > 0) {
  renv::install(missing_pkgs)
}

# Create snapshot of current package versions ---------------------------------
renv::snapshot(prompt = FALSE)

cat("\nrenv configured. Restore the environment with renv::restore().\n")
