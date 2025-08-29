# =============================================================================
# Script 3: Modelo de Poisson e Inferencia (Incisos b y c)
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
datos <- read_csv(here("data", "raw", "datos_pacientes.csv"))

# INCISO b: Ajustar modelo de Poisson -----------------------------------------
cat("Ajustando modelo de Poisson...\n")

# Modelo: log(conteo) = β₀ + β₁*grupo
modelo_poisson <- glm(conteo ~ grupo, 
                      family = poisson(link = "log"),
                      data = datos)

# Resumen del modelo
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
dir.create(here("results", "models"), recursive = TRUE, showWarnings = FALSE)
saveRDS(modelo_poisson, here("results", "models", "modelo_poisson.rds"))
cat("\n✅ Modelo guardado en: results/models/modelo_poisson.rds\n")

# INCISO c: Intervalo de confianza 90% para la diferencia en medias -----------
cat("\nCalculando intervalo de confianza del 90%...\n")

# Extraer coeficientes y errores estándar
coefs <- coef(modelo_poisson)
std_errors <- summary(modelo_poisson)$coefficients[, "Std. Error"]

# Diferencia en escala logarítmica: β₁ (coeficiente para grupoNo-H)
beta1 <- coefs["grupoNo-H"]
se_beta1 <- std_errors["grupoNo-H"]

# Intervalo de confianza 90% para β₁ (diferencia en log-medias)
z_critical <- qnorm(0.95) # 90% CI: α = 0.10 → 1 - α/2 = 0.95

ci_log_diff <- c(
  lower = beta1 - z_critical * se_beta1,
  upper = beta1 + z_critical * se_beta1
)

cat("IC 90% en escala logarítmica: [", round(ci_log_diff["lower"], 4), ",", 
    round(ci_log_diff["upper"], 4), "]\n")

# TRANSFORMACIÓN CORRECTA a diferencia en medias (escala original)
beta0 <- coefs["(Intercept)"]
media_H <- exp(beta0)
media_NoH <- exp(beta0 + beta1)
diferencia_medias <- media_NoH - media_H

ci_diferencia <- c(
  lower = exp(beta0 + ci_log_diff["lower"]) - media_H,
  upper = exp(beta0 + ci_log_diff["upper"]) - media_H
)

# Resultados ------------------------------------------------------------------
cat("\n=== RESULTADOS DEL MODELO ===\n")
cat("Media grupo H:", round(media_H, 2), "células/mm³\n")
cat("Media grupo No-H:", round(media_NoH, 2), "células/mm³\n")
cat("Diferencia de medias (No-H - H):", round(diferencia_medias, 2), "células/mm³\n")
cat("IC 90% para la diferencia: [", 
    round(ci_diferencia["lower"], 2), ",", 
    round(ci_diferencia["upper"], 2), "]\n")

# Interpretación (con verificación de valores NA)
if (any(is.na(ci_diferencia))) {
  cat("⚠️  Error en el cálculo del intervalo de confianza\n")
  cat("   Valores calculados:", ci_diferencia, "\n")
} else if (ci_diferencia["lower"] > 0 | ci_diferencia["upper"] < 0) {
  cat("✅ Hay evidencia de diferencia significativa entre los grupos (IC 90% no incluye el 0)\n")
} else {
  cat("❌ No hay evidencia de diferencia significativa entre los grupos (IC 90% incluye el 0)\n")
}

# Guardar resultados ----------------------------------------------------------
resultados_df <- tibble(
  parametro = c("media_grupo_H", "media_grupo_NoH", "diferencia_medias", "ic_90_inferior", "ic_90_superior"),
  valor = c(media_H, media_NoH, diferencia_medias, ci_diferencia["lower"], ci_diferencia["upper"]),
  interpretacion = c("Media estimada grupo Hodgkin", 
                     "Media estimada grupo No-Hodgkin", 
                     "Diferencia estimada (No-H - H)", 
                     "Límite inferior IC 90%", 
                     "Límite superior IC 90%")
)

dir.create(here("results", "tables"), recursive = TRUE, showWarnings = FALSE)
write_csv(resultados_df, here("results", "tables", "resultados_modelo.csv"))
cat("\n✅ Resultados guardados en: results/tables/resultados_modelo.csv\n")

# Mostrar resultados finales
print(resultados_df)

# Advertencia sobre sobredispersión ------------------------------------------
if (ratio_sobredispersion > 1.5) {
  cat("\n⚠️  ADVERTENCIA: Alta sobredispersión detectada (ratio =", round(ratio_sobredispersion, 2), ")\n")
  cat("   El modelo de Poisson puede no ser apropiado para estos datos.\n")
  cat("   Considera usar un modelo Quasi-Poisson o Binomial Negativo.\n")
}