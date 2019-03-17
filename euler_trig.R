### Trigonometry + Euler Method

# Libraries
library(tidyverse)
library(scales)

# Creating data
sin_df = do.call(rbind, apply(as.matrix(seq(0, 1, 0.01)), 1, FUN = function(x) {
  return(data.frame(x_val = pi*x, y = sin(2*pi*x)))}))

# Creating pi ticks function
pi_scales <- math_format(.x * pi, format = function(x) x / pi)

# Plotting
sin_df %>% 
  ggplot(aes(x = x_val, y = y)) + 
  geom_line() +
  xlab("x") + 
  ylab("sin(2x)") +
  ggtitle("Curve of sin(2x)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(labels = pi_scales, breaks = seq(0, pi, pi / 4))


