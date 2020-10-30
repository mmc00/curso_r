# Bases de R
library(tidyverse)
library(readxl)
library(readr)
library(vroom)
library(rgtap)
# Introduccion funciones

# paramentros
readxl::read_excel(path = "data/pib_encadenado.xlsx")

# libreria - funcion - paramentros


# funcion nativas 
# R
mean(c(5,6,7))
min(c(6,6,7))
max()
sd()
colnames()
# funciones de usuario
cuadrado_x <- function(x = NULL){
  a <- x*x
  return(a)
}


library(readxl)
library(tidyverse)
# Ejemplo
base_1 <- "data/pib_pmercados.xlsx"
base_2 <- "data/pib_encadenado.xlsx"

carga_pib <- function(path_base = NULL, pib_name = NULL){
  if(is.null(path_base)){
    stop("Error: no hay base")
  }
  if(is.null(pib_name)){
    stop("Error: no hay nombre para PIB")
  }
  data <- read_xlsx(path_base, skip = 3) %>% 
  slice(-1) %>% 
  slice(1:18) %>% 
  rename("variable" = "...1") %>% 
  mutate(variable = str_trim(variable)) %>% 
  pivot_longer(cols = -variable, names_to = "year",
               values_to = "values_mercado") %>% 
  mutate(variable = ifelse(variable == "Producto Interno Bruto a precios de mercado",
                           pib_name, variable))
  return(data)
}

base_0 <- carga_pib()
base_0_0 <- carga_pib(path_base = base_1)

base_1_fix <- carga_pib(path_base = base_1)
base_1_fix_2 <- carga_pib(path_base = base_1, pib_name = "PIB_CR")
base_2_fix <- carga_pib(path_base = "data/pib_encadenado.xlsx", pib_name = "PIB_CR")

# GITHUB

# Prueba 1

# GITHUB
"mmc00/curso_r"

# creacion de script dentro de folder (tareas)
# buscar los datos del pib
# counsumo
# inversion
# exportaciones
# importaciones

# commits de los dos
# funciones (corto el código puedan)



# Prueba 2


#papote malote

#sebas

# Marlon baborsh
