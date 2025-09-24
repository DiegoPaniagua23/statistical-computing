# =============================================================================
# Problema 8
# Script: Estimacion mediante mínima ji-cuadrada
# Autor: Diego Paniagua Molina
# Fecha: 2025-09-19
# =============================================================================

# Datos -----------------------------------------------------------------------
n1 <- 100
y1 <- 22

n2 <- 150
y2 <- 52

n3 <- 200
y3 <- 77

# Función Objetivo: Chi-Cuadrada Q(p1, p2) ------------------------------------
chi_sq_function <- function(params) {
  pi1 <- params[1]
  pi2 <- params[2]
  
  # Evitamos divisiones por cero o valores fuera de dominio [0,1]
  if (pi1 <= 0 || pi1 >= 1 || pi2 <= 0 || pi2 >= 1 || (pi1 + pi2) >= 1) {
    return(Inf) # Retorna un valor infinito si los parámetros son inválidos
  }
  
  # Término 1 para la muestra 1
  term1 <- (y1 - n1 * pi1)^2 / (n1 * pi1 * (1 - pi1))
  
  # Término 2 para la muestra 2
  term2 <- (y2 - n2 * pi2)^2 / (n2 * pi2 * (1 - pi2))
  
  # Término 3 para la muestra 3, usando la restricción pi3 = 1 - pi1 - pi2
  pi3 <- 1 - pi1 - pi2
  term3 <- (y3 - n3 * pi3)^2 / (n3 * pi3 * (1 - pi3))
  
  # Suma total
  return(term1 + term2 + term3)
}

# Valores iniciales para el optimizador ---------------------------------------
start_params <- c(y1/n1, y2/n2)
cat("Valores iniciales (ingenuos):", "\n")
print(start_params)

# Ejecutar nlminb -------------------------------------------------------------
optimizer_result <- nlminb(
  start = start_params,
  objective = chi_sq_function,
  lower = c(1e-9, 1e-9),  # Límite inferior cercano a 0
  upper = c(1 - 1e-9, 1 - 1e-9) # Límite superior cercano a 1
)

# Mostrar los resultados ------------------------------------------------------
cat("\n--- Resultados de la Optimización ---\n")
print(optimizer_result)
