# =============================================================================
# Problema 3 
# Script: Cangrejos cacerola
# Autor: Diego Paniagua Molina
# Fecha: 2025-09-20
# =============================================================================

# Cargar librerias ------------------------------------------------------------
library(here)
library(dplyr) 

# Datos -----------------------------------------------------------------------
crabs_df <- data.frame(
  color = c(3, 4, 2, 4, 4, 3, 2),
  Spine = c(3, 3, 1, 3, 3, 3, 1),
  Width = c(28.3, 22.5, 26.0, 24.8, 26.0, 23.8, 26.5),
  Satellite = c(8, 0, 9, 0, 4, 0, 0),
  Weight = c(3050, 1550, 2300, 2100, 2600, 2100, 2350)
)

# Preparacion de datos -------------------------------------------------------
# Las variables 'color' y 'Spine' son categóricas. Las convertimos a factores.
crabs_df <- crabs_df %>%
  mutate(
    color = as.factor(color),
    Spine = as.factor(Spine)
  )

print("Estructura de los datos:")
glimpse(crabs_df)

# Ajuste GLM Poisson ----------------------------------------------------------
poisson_model <- glm(Satellite ~ color + Spine + Width + Weight, 
                     data = crabs_df, 
                     family = poisson(link = "log"))

# Guardar resultados ----------------------------------------------------------
model_summary <- summary(poisson_model)

print("Resumen del Modelo de Poisson:")
print(model_summary)

cat("\n¡Análisis completado con la muestra de datos integrada!\n")