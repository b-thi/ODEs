### Phase portraits

# Libraries
library(tidyverse)
library(grid)
library(pracma)

# Defining ODE; dy/dx = x - y
ode <- function(x, y, a, r){
  K = r/a
  return(r*(1 - (y/K))*y)
}

# Generating data
y = seq(-1, 4.5, 0.1)
dy = ode(0, y, 1, 3)
phase_data = data.frame(y, dy)

# Plotting
phase_data %>% 
  ggplot(aes(x = y, y = dy)) + 
  geom_line() +
  theme_bw() +
  labs(x = "y", y = bquote(frac(dy, dt)), title = "Phase Portrait for Logistic Growth") +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_hline(yintercept = 0, color = "Blue") +
  geom_segment(aes(x = y[which.max(dy)],
                   y = dy[which.max(dy)],
                   xend = y[which.max(dy)],
                   yend = 0), 
             color = "purple",
             linetype="dashed",
             size = 1) +
  geom_point(data = data.frame(x = y[which(dy == 0)], y = dy[which(dy == 0)]),
             aes(x = x, y = y),
             color = "red",
             size = 3) + 
  geom_point(aes(x = y[which.max(dy)], y = dy[which.max(dy)]),
             color = "purple",
             size = 3) +
  geom_segment(data = data.frame(a = c(0.5, 2), b = c(0, 0)),
                   aes(x = a, y = b, 
                   xend = a + 0.25, 
                   yend = b), 
               arrow = arrow(length = unit(0.3, "cm")),
               size = 1) +
  geom_segment(data = data.frame(a = c(4), b = c(0)),
               aes(x = a + 0.25, y = b, 
                   xend = a, 
                   yend = b), 
               arrow = arrow(length = unit(0.3, "cm")),
               size = 1) +
  geom_label(data = data.frame(x = y[which(dy == 0)], 
                               y = dy[which(dy == 0)],
                               state = c("Unstable Equilibrium", "Stable Equilibrium")),
             aes(x = x, y = y, label = state),
             nudge_y = -0.5)

