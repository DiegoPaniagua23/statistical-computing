# =============================================================================
# Problema 7 
# Script: Reclamos polizas de seguro
# Autor: Diego Paniagua Molina
# Fecha: 2025-09-20
# =============================================================================

# Librerias -------------------------------------------------------------------
library(here)
library(dplyr)
library(tidyr)
library(ggplot2)

# Dataset ---------------------------------------------------------------------
insurance_wide_df <- tibble::tribble(
  ~CAR, ~EDAD, ~y_dist0, ~n_dist0, ~y_dist1, ~n_dist1,
  1, 1, 65, 317, 2, 20,
  1, 2, 65, 476, 5, 33,
  1, 3, 52, 486, 4, 40,
  1, 4, 310, 3259, 36, 316,
  2, 1, 98, 486, 7, 31,
  2, 2, 159, 1004, 10, 81,
  2, 3, 175, 1355, 22, 122,
  2, 4, 877, 7660, 102, 724,
  3, 1, 41, 223, 5, 18,
  3, 2, 117, 539, 7, 39,
  3, 3, 137, 697, 16, 68,
  3, 4, 477, 3442, 63, 344,
  4, 1, 11, 40, 0, 3,
  4, 2, 35, 148, 6, 16,
  4, 3, 39, 214, 8, 25,
  4, 4, 167, 1019, 33, 114
)

# Convertimos a formato largo 
insurance_df <- insurance_wide_df %>%
  pivot_longer(
    cols = c(y_dist0, n_dist0, y_dist1, n_dist1),
    names_to = c(".value", "DIST"),
    names_pattern = "([yn])_dist(.)"
  )

# Inciso (a): EDA -------------------------------------------------------------
eda_df <- insurance_df %>%
  mutate(
    rate = y / n,
    CAR = as.factor(CAR),
    EDAD = as.factor(EDAD),
    DIST = as.factor(DIST)
  )

# Gráfico: Tasa de reclamos vs. Tipo de Carro (CAR)
plot_car <- ggplot(eda_df, aes(x = CAR, y = rate, fill = CAR)) +
  geom_boxplot() +
  labs(
    title = "Tasa de Reclamos por Tipo de Carro",
    x = "Tipo de Carro (CAR)",
    y = "Tasa de Reclamos (y/n)"
  ) +
  theme_bw()
ggsave(here("results", "figures", "rate_vs_car.png"), plot_car) 
print(plot_car)

# Gráfico: Tasa de reclamos vs. Grupo de Edad (EDAD)
plot_edad <- ggplot(eda_df, aes(x = EDAD, y = rate, fill = EDAD)) +
  geom_boxplot() +
  labs(
    title = "Tasa de Reclamos por Grupo de Edad",
    x = "Grupo de Edad (EDAD)",
    y = "Tasa de Reclamos (y/n)"
  ) +
  theme_bw()
ggsave(here("results", "figures", "rate_vs_edad.png"), plot_edad) 
print(plot_edad)

# Gráfico: Tasa de reclamos vs. Distrito (DIST)
plot_dist <- ggplot(eda_df, aes(x = DIST, y = rate, fill = DIST)) +
  geom_boxplot() +
  labs(
    title = "Tasa de Reclamos por Distrito",
    x = "Distrito (DIST)",
    y = "Tasa de Reclamos (y/n)"
  ) +
  theme_bw()
ggsave(here("results", "figures", "rate_vs_dist.png"), plot_dist) 
print(plot_dist)

cat("\n--- Análisis Exploratorio (Inciso a) completado. Gráficos guardados en 'results/figures/'\n")


# Inciso (b): Ajuste modelo logistico completo --------------------------------
model_b <- glm(
  cbind(y, n - y) ~ CAR * EDAD * DIST,
  data = eda_df,
  family = binomial(link = "logit")
)

# Guardamos el resumen y el modelo
summary_b <- summary(model_b)
print("--- Resumen del Modelo Completo (Inciso b) ---")
print(summary_b)
capture.output(summary_b, file = here("results", "summary_model_b.txt"))
saveRDS(model_b, file = here("results", "models", "model_b.rds")) # << CORREGIDO

cat("\n--- Modelo Completo (Inciso b) ajustado. Resultados guardados. \n")


# Inciso (c): Ajuste modelo simplificado --------------------------------------
simplified_df <- insurance_df %>%
  mutate(
    CAR = as.numeric(CAR),
    EDAD = as.numeric(EDAD),
    DIST = as.factor(DIST)
  )

model_c <- glm(
  cbind(y, n - y) ~ CAR + EDAD + DIST,
  data = simplified_df,
  family = binomial(link = "logit")
)

# Guardamos el resumen y el modelo
summary_c <- summary(model_c)
print("--- Resumen del Modelo Simplificado (Inciso c) ---")
print(summary_c)
capture.output(summary_c, file = here("results", "summary_model_c.txt"))
saveRDS(model_c, file = here("results", "models", "model_c.rds")) # << CORREGIDO

cat("\n--- Modelo Simplificado (Inciso c) ajustado. Resultados guardados. ---\n")


# Comparacion de modelos ------------------------------------------------------
model_comparison <- anova(model_c, model_b, test = "Chisq")

print("--- Comparación de Modelos (ANOVA)")
print(model_comparison)
capture.output(model_comparison, file = here("results", "model_comparison_anova.txt"))
cat("\n--- Análisis completo\n")