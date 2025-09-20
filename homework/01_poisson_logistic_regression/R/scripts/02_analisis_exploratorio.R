# =============================================================================
# Script 2: Análisis Exploratorio - Comparación Gráfica (Inciso a)
# =============================================================================

# Instalar paquetes necesarios ------------------------------------------------
if (!require("dplyr")) install.packages("dplyr")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("here")) install.packages("here")

# Cargar paquetes -------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(here)

# Cargar datos ----------------------------------------------------------------
datos <- read_csv(here("code", "data", "datos_pacientes.csv"), show_col_types = FALSE)

# 1. Boxplot comparativo con puntos -------------------------------------------
boxplot <- ggplot(datos, aes(x = grupo, y = conteo, fill = grupo)) +
  geom_boxplot(alpha = 0.7) +
  geom_point(position = position_jitter(width = 0.2), alpha = 0.6) +
  labs(title = "Comparación de Conteos de Células T4",
       subtitle = "Pacientes con Hodgkin (H) vs Otras enfermedades (No-H)",
       x = "Grupo",
       y = "Conteo por mm³") +
  theme_bw() +
  theme(legend.position = "none")

# 2. Histogramas comparativos -------------------------------------------------
histogramas <- ggplot(datos, aes(x = conteo, fill = grupo)) +
  geom_histogram(alpha = 0.7, position = "identity", color = "black") +
  facet_wrap(~ grupo, nrow = 1) +  
  labs(title = "Distribución de Conteos por Grupo",
       x = "Conteo por mm³",
       y = "Frecuencia") +
  theme_bw() +
  theme(aspect.ratio = 1,
        legend.position = "none",
        strip.background = element_blank(),  
        strip.text = element_text(face = "bold", size = 11)) 

# 3. Gráfico de densidad ------------------------------------------------------
densidad <- ggplot(datos, aes(x = conteo, fill = grupo)) +
  geom_density(alpha = 0.5) +
  labs(title = "Densidad de Conteos de Células T4",
       x = "Conteo por mm³",
       y = "Densidad") +
  theme_bw()

# Guardar gráficos ------------------------------------------------------------
dir.create(here("code", "results", "figures"), recursive = TRUE, showWarnings = FALSE)
ggsave(here("code", "results", "figures", "boxplot_comparativo.png"), 
       plot = boxplot, width = 8, height = 6, dpi = 300)
ggsave(here("code", "results", "figures", "histogramas_comparativos.png"), 
       plot = histogramas, width = 8, height = 6, dpi = 300)
ggsave(here("code", "results", "figures", "densidad_comparativa.png"), 
       plot = densidad, width = 8, height = 6, dpi = 300)

# Mostrar gráficos ------------------------------------------------------------
print(boxplot)
print(histogramas)
print(densidad)

cat("\n Gráficos guardados en la carpeta: code/results/figures/\n")
