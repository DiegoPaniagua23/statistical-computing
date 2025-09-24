# =============================================================================
# Problema 10
# Script: Placebo vs acido ascórbico y gripe
# Autor: Diego Paniagua Molina
# Fecha: 2025-09-19
# =============================================================================

# Datos -----------------------------------------------------------------------
datos <- data.frame(
  Tratamiento = factor(c("Placebo", "AcidoAscorbico")),
  Gripe = c(31, 17),
  NoGripe = c(109, 122)
)

# Ajustar el GLM --------------------------------------------------------------
datos$Tratamiento <- relevel(datos$Tratamiento, ref = "Placebo")

modelo_logistico <- glm(cbind(Gripe, NoGripe) ~ Tratamiento,
                        data = datos,
                        family = binomial(link = "logit"))

# Resumen del modelo ----------------------------------------------------------
resultados_modelo <- summary(modelo_logistico)

print("\nResultados del Modelo Logístico:")
print(resultados_modelo)

# Odds Ratio ------------------------------------------------------------------
coef_tratamiento <- coef(modelo_logistico)["TratamientoAcidoAscorbico"]
odds_ratio <- exp(coef_tratamiento)

print("\nCálculo del Odds Ratio:")
cat("Odds Ratio (Ácido Ascórbico vs. Placebo):", odds_ratio, "\n")
cat("Interpretación: Las 'chances' (odds) de contraer gripe en el grupo que tomó Ácido Ascórbico son",
    round(odds_ratio, 3), "veces las chances del grupo Placebo.\n")