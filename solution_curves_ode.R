### Solutions Curves

# libraries
library(reshape)
library(ggplot2)

# x Values
x = seq(0, 7, 0.01)

# Defining ODE
y = function(y_o) {return(3 + (y_o - 3)*exp(-x/2))}

# Creating data frame
solution_curves = data.frame(cbind(x, apply(as.matrix(0:7), 1, FUN = y)))
reshaped_solutions <- melt(solution_curves ,  id.vars = 'x')

# Plotting
ggplot(reshaped_solutions, aes(x, value)) + 
  geom_line(aes(colour = variable)) + 
  ggtitle("Solution Curves for:\n dy/dx + y/2 = 3/2") + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) + 
  xlab("x") + 
  ylab("y") +
  labs(color = "Initial Condition\n Values for y(0)") +
  scale_color_hue(labels = as.character(0:7))
