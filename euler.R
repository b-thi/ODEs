### Euler Method Example

## Libraries
library(tidyverse)

## Making exact plot
x = seq(0, 3, 0.01)
e_df = data.frame(x = x, y = exp(x))

## Getting iterations
x_1 = seq(0, 1, 0.01)
x_2 = seq(1.0, 2, 0.01)
x_3 = seq(2.0, 3, 0.01)
x_4 = seq(3.0, 4, 0.01)
y_0 = 1; y_1 = y_0 + 2; y_2 = y_1 + 4; y_3 = y_2 + 8
iter1 = data.frame(x = x_1, y_1 = x_1*1)
iter2 = data.frame(x = x_2, y_2 = x_2*2)
iter3 = data.frame(x = x_3, y_3 = x_3*4)
iter4 = data.frame(x = x_4, y_4 = x_4*8)

## Plotting
e_df %>% 
  ggplot(aes(x = x, y = y)) + 
  geom_line(size = 1.25) + 
  geom_line(data = iter1, 
            aes(x = x, y = y_1), 
            color = "blue",
            size = 1.5) + 
  geom_line(data = iter2, 
            aes(x = x, y = y_2), 
            color = "green",
            size = 1.5) + 
  geom_line(data = iter3, 
            aes(x = x, y = y_3), 
            color = "red",
            size = 1.5) +
  theme_bw()
