# =============================================================================
# Script 3: Modelo de Poisson e Inferencia (Inciso b)
# =============================================================================

# Instalar paquetes necesarios ------------------------------------------------
if (!require("dplyr")) install.packages("dplyr")
if (!require("readr")) install.packages("readr")
if (!require("here")) install.packages("here")

# Cargar paquetes -------------------------------------------------------------
library(dplyr)
library(readr)
library(here)

# Cargar datos ----------------------------------------------------------------
datos <- read_csv(here("data", "datos_pacientes.csv"), show_col_types = FALSE)

# INCISO b: Ajustar modelo de Poisson -----------------------------------------
cat("Ajustando modelo de Poisson...\n")

# Modelo: log(conteo) = \beta_0 + \beta_1*grupo--------------------------------
modelo_poisson <- glm(conteo ~ grupo, 
                      family = poisson(link = "log"),
                      data = datos)

# Resumen del modelo ----------------------------------------------------------
cat("\nResumen del modelo de Poisson:\n")
resumen_modelo <- summary(modelo_poisson)
print(resumen_modelo)

# Verificar sobredispersión ---------------------------------------------------
cat("\nVerificación de sobredispersión:\n")
deviance_val <- resumen_modelo$deviance
df_residual <- resumen_modelo$df.residual
ratio_sobredispersion <- deviance_val / df_residual

cat("Deviance:", deviance_val, "\n")
cat("Grados de libertad:", df_residual, "\n")
cat("Ratio Deviance/df:", ratio_sobredispersion, "\n")

# Guardar modelo --------------------------------------------------------------
saveRDS(modelo_poisson, here("results", "models", "modelo_poisson.rds"))
cat("\n Modelo guardado en: results/models/modelo_poisson.rds\n")

# Existe sobredispersión, ajustar modelo quasi-Poisson ------------------------
cat("\nAjustando modelo quasi-Poisson...\n")

modelo_quasi <- glm(conteo ~ grupo,
                    family = quasipoisson(link = "log"),
                    data = datos)

# Resumen del modelo ---------------------------------------------------------- 
cat("\nResumen del modelo quasi-Poisson:\n")
resumen_quasi <- summary(modelo_quasi)
print(resumen_quasi)

# Dispersión (phi) ------------------------------------------------------------
phi <- resumen_quasi$dispersion
cat("\nEstimador de dispersión (phi):", round(phi, 3), "\n")

# Guardar modelo --------------------------------------------------------------
dir.create(here("results", "models"), recursive = TRUE, showWarnings = FALSE)
saveRDS(modelo_quasi, here("results", "models", "modelo_quasipoisson.rds"))
cat("\n Modelo guardado en: results/models/modelo_quasipoisson.rds\n")
