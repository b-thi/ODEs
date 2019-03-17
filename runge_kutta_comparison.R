### Solving using Runge Kutta
## First by package
## Second by hand

## By package

# Libraries
library(rmutil)
library(deSolve)
library(reshape)

# Defining ODE
ode <- function(x, y){
  return((1/2)*(3 - y))
}

# Defining initial condition
y_initial <-  2

# x values
x = seq(0, 7, 0.01)

# Solution function for ODE
y = function(y_o) {return(3 + (y_o - 3)*exp(-x/2))}

# Creating data frame
solution_curves = data.frame(cbind(x, apply(as.matrix(0:7), 1, FUN = y)))

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

# Using alternative function

# Defining ODE again
ode_rk4 <- function(t, y, parms){
  dydx = (a)*(b - y)
  return(list(dydx))
}

# Defining parameters
x = seq(0, 7, 0.01)
a = 1/2
b = 3
parms = c(a = a, b = b)
y_initial = c(y_initial = 2)

# Running from deSolve package
runge_solution_rk4 <- rk4(y_initial, x, ode_rk4, parms)

# Creating data frame
rk4_df <- melt(data.frame(x = x, 
                          approx_sol = runge_solution_rk4[,2] + 0.1, 
                          exact_sol = solution_curves$V4),
                id.vars = "x")
  
# Plotting
rk4_df %>% 
  ggplot(aes(x, value)) + 
  geom_line(aes(colour = variable)) + 
  ggtitle("Runge Kutta vs. Exact Solution\n Using deSolve") + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) + 
  xlab("x") + 
  ylab("y") +
  ylim(c(0, 6)) +
  labs(color = "Solutions") +
  scale_color_manual(labels = c("Approximate Solution", "Exact Solution"),
                     values = c("Blue", "Green"))


## By hand



