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
y_0 = 1; y_1 = y_0 + 1; y_2 = y_1 + 2; y_3 = y_2 + 4;
iter1 = data.frame(x = 1, y_1 = y_1)
iter2 = data.frame(x = 2, y_2 = y_2)
iter3 = data.frame(x = 3, y_3 = y_3)
iter4 = data.frame(x = x_4, y_4 = y_4)

## Plotting
e_df %>% 
  ggplot(aes(x = x, y = y)) + 
  geom_line(size = 1.25) + 
  geom_segment(data = iter1, 
            aes(x = 0, y = 0, xend = x, yend = y_1), 
            color = "blue",
            size = 1.5) +
  geom_segment(data = iter2, 
               aes(x = 1, y = y_1, xend = x, yend = y_2), 
               color = "red",
               size = 1.5) +
  geom_segment(data = iter3, 
               aes(x = 2, y = y_2, xend = x, yend = y_3), 
               color = "green",
               size = 1.5) +
  ggtitle("An Application of Euler's Method") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
  

