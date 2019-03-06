### Solving using Runge Kutta
## First by package
## Second by hand

## By package

# Libraries
library(rmutil)

# Defining ODE
ode <- function(x, y){
  return((1/2)*(3 - y))
}

# Defining initial condition
y_initial <-  2

# x values
x = seq(0, 7, 0.01)

# Running runge-kutta
runge_solution <- runge.kutta(ode, y_initial, x)

# Making data frame for comparison
comp_df <- melt(data.frame(x = x, approx_sol = runge_solution, exact_sol = solution_curves$V4),
                id.vars = "x")

# Plotting exact vs. approx
comp_df %>% 
  ggplot(aes(x, value)) + 
  geom_line(aes(colour = variable)) + 
  ggtitle("Runge Kutta vs. Exact Solution") + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) + 
  xlab("x") + 
  ylab("y") +
  labs(color = "Curve") +
  scale_color_manual(labels = c("Approximate Solution", "Exact Solution"),
                    values = c("Blue", "Green"))

## By hand




