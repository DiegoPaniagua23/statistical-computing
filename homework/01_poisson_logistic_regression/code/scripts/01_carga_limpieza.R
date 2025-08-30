# =============================================================================
# Script 1: Carga y Limpieza de Datos - Conteos de Células T4
# Autor: Diego Paniagua Molina
# Fecha: 2025-08-29
# =============================================================================

# Instalar paquetes necesarios ------------------------------------------------
if (!require("dplyr")) install.packages("dplyr")
if (!require("readr")) install.packages("readr")
if (!require("here")) install.packages("here")

# Cargar paquetes -------------------------------------------------------------
library(dplyr)
library(readr)
library(here)

# Crear los datos manualmente -------------------------------------------------
datos <- tibble(
  grupo = rep(c("H", "No-H"), each = 20),
  conteo = c(
    # Grupo H (Hodgkin) - Primera fila
    396, 568, 1212, 171, 554, 1104, 257, 435, 295, 397,
    # Grupo H (Hodgkin) - Segunda fila  
    288, 1004, 431, 795, 1621, 1378, 902, 958, 1283, 2415,
    # Grupo No-H (No Hodgkin) - Primera fila
    375, 375, 752, 208, 151, 116, 736, 192, 315, 1252,
    # Grupo No-H (No Hodgkin) - Segunda fila
    675, 700, 440, 771, 688, 426, 410, 979, 377, 503
  )
)

# Verificar estructura de los datos -------------------------------------------
cat("Estructura de los datos:\n")
glimpse(datos)

cat("\nResumen por grupos:\n")
datos %>%
  group_by(grupo) %>%
  summarise(
    n = n(),
    media = mean(conteo),
    mediana = median(conteo),
    sd = sd(conteo),
    min = min(conteo),
    max = max(conteo)
  ) %>%
  print()

# Guardar datos en formato CSV ------------------------------------------------
write_csv(datos, here("code", "data", "datos_pacientes.csv"))

# Mensaje de confirmación -----------------------------------------------------
dir.create(here("code", "data"), recursive = TRUE, showWarnings = FALSE)
cat("\nDatos creados y guardados en: code/data/datos_pacientes.csv\n")
cat("Total de observaciones:", nrow(datos), "\n")
cat("Grupos:", unique(datos$grupo), "\n")
