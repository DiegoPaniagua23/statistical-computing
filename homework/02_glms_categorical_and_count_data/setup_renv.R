# =============================================================================
# Setup renv for Reproducible Package Management
# =============================================================================

# Install helper packages on demand -------------------------------------------
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")

# Locate repository root ----------------------- ------------------------------
find_repo_root <- function(start = getwd()) {
  current <- normalizePath(start, mustWork = TRUE)
  repeat {
    if (file.exists(file.path(current, ".git"))) return(current)
    parent <- dirname(current)
    if (identical(parent, current)) {
      stop("Could not locate the repository root (.git directory not found).")
    }
    current <- parent
  }
}

repo_root <- find_repo_root()
message("Repository root detected at: ", repo_root)

old_wd <- getwd()
setwd(repo_root)
on.exit(setwd(old_wd), add = TRUE)

# Initialise or load renv -----------------------------------------------------
if (!file.exists("renv.lock")) {
  renv::init(bare = TRUE)
} else {
  renv::load()
}

# Install the packages needed by the homework scripts -------------------------
required_packages <- c(
  "dplyr",      # Data manipulation and glimpse
  "ggplot2",    # Visualisation for insurance analysis
  "here",       # Project-oriented paths
  "tidyr",      # pivot_longer for insurance data reshaping
  "tibble",     # tribble helper used in insurance script
  "titanic"     # Titanic contingency table data
)

missing_pkgs <- setdiff(required_packages, rownames(installed.packages()))
if (length(missing_pkgs) > 0) {
  renv::install(missing_pkgs)
}

# Snapshot package versions to renv.lock --------------------------------------
renv::snapshot(prompt = FALSE)

cat("\nrenv configured. Restore the environment with renv::restore().\n")
