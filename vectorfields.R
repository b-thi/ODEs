### Vector Fields

# Libraries
library(tidyverse)
library(grid)
library(pracma)

# Defining ODE; dy/dx = x - y
ode <- function(x, y){
  return(x - y)
}

# Evaluating slopes
combo_values <- expand.grid(list(x = seq(-4, 4, 0.1), y = seq(-4, 4, 0.1)))

# Running function through these combinations
combo_values$ODEvalue <- ode(combo_values$x, combo_values$y)

# Plotting vector field using ggplot
combo_values %>% 
  ggplot(aes(x = x, y = y)) + 
  theme_bw() +
  geom_segment(aes(x = x, y = y, xend = x + 0.1, 
               yend = y + ODEvalue), 
               arrow = arrow(length = unit(0.2,"cm")),
               size = 1)


combo_values$x + combo_values$ODEvalue

# Plotting in another way
xx <- c(-4, 4)
yy <- c(-4, 4)
vectorfield(ode, xx, yy, scale = 0.1, col = "blue")
title(main = "Vecto Field for Example ODE")

# Plotting solutions
for (xs in seq(-4, 4, by = 0.25)) {
  sol <- rk4(ode, -4, 4, xs, 100)
  lines(sol$x, sol$y, col="darkgreen")
}
