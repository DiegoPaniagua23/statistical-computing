# =============================================================================
# Problema 5
# Script: Edad y daño coronario
# Autor: Diego Paniagua Molina
# Fecha: 2025-09-19
# =============================================================================

# Datos -----------------------------------------------------------------------
edad <- c(
  20, 23, 24, 25, 25, 26, 26, 28, 28, 29, 30, 30, 30, 30, 30, 30, 32, 32, 33, 33, 
  34, 34, 34, 34, 34, 35, 35, 36, 36, 37, 37, 37, 38, 38, 39, 39, 40, 40, 41, 41, 
  42, 42, 42, 42, 43, 43, 43, 44, 44, 44, 44, 45, 45, 46, 46, 47, 47, 47, 48, 48, 
  48, 49, 49, 49, 50, 50, 51, 52, 52, 53, 53, 54, 55, 55, 55, 56, 56, 56, 57, 57, 
  57, 57, 57, 57, 58, 58, 58, 59, 59, 60, 60, 61, 62, 62, 63, 64, 64, 65, 69)

coro <- c(
  0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,1,0,0,0,1,0,1,0,
  0,0,0,1,0,0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1,1,1,0,1,1,1,1,1,1,0,
  0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1)

stopifnot(length(edad) == length(coro))
y <- as.integer(coro)             # 0/1
n <- length(y)
P <- sum(y == 1L)                 # Positivos observados
N <- sum(y == 0L)                 # Negativos observados


# Modelo logístico ------------------------------------------------------------
mod <- glm(y ~ edad, family = binomial)
phat <- as.numeric(predict(mod, type = "response"))

# Curva ROC (barrido de umbrales) ---------------------------------------------
thr_unique <- sort(unique(phat))
thr <- c(Inf, rev(thr_unique), -Inf)   # asegura extremos (0,0) y (1,1)

TPR <- FPR <- SPEC <- SENS <- J <- numeric(length(thr))

for (i in seq_along(thr)) {
  t <- thr[i]
  yhat <- as.integer(phat >= t)
  TP <- sum(yhat == 1L & y == 1L)
  FP <- sum(yhat == 1L & y == 0L)
  TN <- sum(yhat == 0L & y == 0L)
  FN <- sum(yhat == 0L & y == 1L)
  
  SENS[i] <- if (P > 0) TP / P else NA_real_         # TPR
  SPEC[i] <- if (N > 0) TN / N else NA_real_         # Specificity
  TPR[i]  <- SENS[i]
  FPR[i]  <- 1 - SPEC[i]
  
  J[i] <- SENS[i] - (1 - SPEC[i])    # = TPR - FPR = sens + espec - 1
}

# Ordenamos por FPR ascendente (eje x) para AUC con trapecios
ord <- order(FPR, TPR)
FPRo <- FPR[ord]
TPRo <- TPR[ord]

# AUC (regla del trapecio) ----------------------------------------------------
AUC <- sum(diff(FPRo) * (head(TPRo, -1) + tail(TPRo, -1)) / 2)

# Umbral óptimo por Youden J --------------------------------------------------
Jmax <- max(J, na.rm = TRUE)
cand <- which(J == Jmax)

# Elegimos el candidato con menor FPR; si empata, mayor TPR
if (length(cand) > 1L) {
  sub <- cand[order(FPR[cand], -TPR[cand])]
  idx_opt <- sub[1L]
} else {
  idx_opt <- cand
}
t_opt <- thr[idx_opt]
tpr_opt <- TPR[idx_opt]
fpr_opt <- FPR[idx_opt]
spec_opt <- 1 - fpr_opt
sens_opt <- tpr_opt

# Matriz de confusión en t_opt y métricas -------------------------------------
yhat_opt <- as.integer(phat >= t_opt)
TP <- sum(yhat_opt == 1L & y == 1L)
FP <- sum(yhat_opt == 1L & y == 0L)
TN <- sum(yhat_opt == 0L & y == 0L)
FN <- sum(yhat_opt == 0L & y == 1L)

acc  <- (TP + TN) / (P + N)
prec <- if ((TP + FP) > 0) TP / (TP + FP) else NA_real_

# Gráfica ROC -----------------------------------------------------------------
png("results/figures/roc_coro.png", width = 800, height = 800)
plot(FPRo, TPRo, type = "l", lwd = 2,
     xlab = "FPR = 1 - Especificidad",
     ylab = "TPR = Sensitividad",
     main = "Curva ROC: daño coronario vs edad")
abline(0, 1, lty = 2)  # diagonal
points(fpr_opt, tpr_opt, pch = 19, cex = 1.2)
text(fpr_opt, tpr_opt,
     labels = sprintf("  t*=%.3f\n  J=%.3f", t_opt, Jmax),
     pos = 4)
legend("bottomright",
       legend = sprintf("AUC (trapecios) = %.4f", AUC),
       bty = "n")
dev.off()

cat("Imagen guardada en: report/figures/roc_coro.png\n")

# Resumen de resultados -------------------------------------------------------
cat("\n================= RESUMEN =================\n")
cat(sprintf("AUC (trapecios): %.6f\n", AUC))
cat(sprintf("Umbral óptimo (Youden J): t* = %.6f\n", t_opt))
cat(sprintf("  Sensitividad (TPR): %.4f\n", sens_opt))
cat(sprintf("  Especificidad:      %.4f\n", spec_opt))
cat(sprintf("  FPR:                %.4f\n", fpr_opt))
cat(sprintf("  J = TPR - FPR:      %.4f\n", Jmax))

cat("\nMatriz de confusión en t*:\n")
tab <- matrix(c(TP, FP, FN, TN), nrow = 2, byrow = TRUE,
              dimnames = list("Decisión" = c("1", "0"),
                              "Observado" = c("1", "0")))
print(tab)
cat(sprintf("\nAccuracy:  %.4f", acc))
cat(sprintf("\nPrecision: %.4f\n", prec))
