# =============================================================================
# Problema 2 
# Script: Ronquido y enfermedad cardíaca
# Autor: Diego Paniagua Molina
# Fecha: 2025-09-18
# =============================================================================

# Carpetas --------------------------------------------------------------------
dir_report   <- file.path("report")
dir_models   <- file.path("report", "models")
dir_figs     <- file.path("report", "figures")

for (d in c(dir_report, dir_models, dir_figs)) {
  if (!dir.exists(d)) dir.create(d, recursive = TRUE, showWarnings = FALSE)
}

# Datos -----------------------------------------------------------------------
snore  <- c("Nunca","Ocasional","Casi cada noche","Cada noche")
score  <- c(0, 2, 4, 5)             # puntuaciones relativas
SI     <- c(24, 35, 21, 30)
NO     <- c(1355,603,192,224)

df <- data.frame(
  snore = factor(snore, levels = snore),  # convierte a factor y preserva orden
  score = score,
  SI    = SI,
  NO    = NO
)
df$tot  <- df$SI + df$NO
df$prop <- df$SI / df$tot

cat("\n=== Datos ===\n")
print(df)

# Modelos GLM: logit y probit -------------------------------------------------
fit_logit  <- glm(cbind(SI, NO) ~ score, data = df,
                  family = binomial(link = "logit"))
fit_probit <- glm(cbind(SI, NO) ~ score, data = df,
                  family = binomial(link = "probit"))

cat("\n=== Resumen LOGIT ===\n")
print(summary(fit_logit))
cat("\n=== Resumen PROBIT ===\n")
print(summary(fit_probit))

# Guardar modelos -------------------------------------------------------------
saveRDS(fit_logit,  file.path(dir_models, "snoring_logit.rds"))
saveRDS(fit_probit, file.path(dir_models, "snoring_probit.rds"))

# Figura: observados vs curvas logit/probit -----------------------------------
png(file.path(dir_figs, "snoring_glm_curves.png"),
    width = 1200, height = 800, res = 140)

op <- par(mar=c(4.2,4.2,1,1))
plot(df$score, df$prop, pch = 16,
     ylim = c(0, max(df$prop, 0.15)),
     xlab = "Puntuación de ronquido",
     ylab = "Proporción (Enfermedad cardíaca)",
     xaxt = "n")
axis(1, at = df$score, labels = df$snore)
abline(h = pretty(c(0, max(df$prop, 0.15))), col = "gray90", lty = 1)

grid_sc <- data.frame(score = seq(0, 5, length.out = 301))
lines(grid_sc$score, predict(fit_logit,  newdata = grid_sc, type = "response"), lwd = 3)
lines(grid_sc$score, predict(fit_probit, newdata = grid_sc, type = "response"), lwd = 3, lty = 2)

legend("topleft", bty = "n", lwd = 3, lty = c(1,2),
       legend = c("Logit", "Probit"))
par(op)
dev.off()

# Mensaje de confirmacion -----------------------------------------------------
cat("\nArchivos generados:\n")
cat(" - Modelos: report/models/snoring_logit.rds, snoring_probit.rds\n")
cat(" - Figura  : report/figures/snoring_glm_curves.png\n\n")
