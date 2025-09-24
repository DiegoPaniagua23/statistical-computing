# =============================================================================
# Problema 9
# Script: Supervivencia Titanic
# Autor: Diego Paniagua Molina
# Fecha: 2025-09-20
# =============================================================================

# Librerias -------------------------------------------------------------------
library(here)
library(dplyr)
library(titanic)

# Cargar dataset --------------------------------------------------------------
titanic_df <- as.data.frame(Titanic)

# Verificamos la estructura de los datos
print("Estructura de los datos en formato largo:")
glimpse(titanic_df)


# Ajuste modelos log-lineales -------------------------------------------------
model_saturated <- glm(Freq ~ Class * Sex * Age * Survived,
                       family = poisson(link = "log"),
                       data = titanic_df)

# Guardamos el resumen y el objeto del modelo
summary_saturated <- summary(model_saturated)
print("--- Resumen del Modelo Saturado ---")
print(summary_saturated)
capture.output(summary_saturated, file = here("results", "summary_saturated_model.txt"))
saveRDS(model_saturated, file = here("results", "models", "model_saturated.rds"))


# Seleccion mejor modelo (backward) -------------------------------------------
print("--- Análisis de Devianza (drop1) del Modelo Saturado ---")
backward_selection <- drop1(model_saturated, test = "Chisq")
print(backward_selection)
capture.output(backward_selection, file = here("results", "backward_selection_analysis.txt"))

# Modelo 2: Modelo con interacciones de 3 vías 
model_3way <- glm(Freq ~ (Class + Sex + Age + Survived)^3,
                  family = poisson(link = "log"),
                  data = titanic_df)

# Guardamos los resultados de este modelo
summary_3way <- summary(model_3way)
print("--- Resumen del Modelo con Interacciones de 3 Vías ---")
print(summary_3way)
capture.output(summary_3way, file = here("results", "summary_3way_model.txt"))
saveRDS(model_3way, file = here("results", "models", "model_3way.rds"))

# Comparacion modelos ---------------------------------------------------------
model_comparison <- anova(model_3way, model_saturated, test = "Chisq")
print("--- Comparación ANOVA: Modelo 3-vías vs. Modelo Saturado ---")
print(model_comparison)
capture.output(model_comparison, file = here("results", "model_comparison_anova.txt"))


cat("\n Análisis completado.\n")