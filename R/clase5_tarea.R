#CLASE 5 TAREA

library(tidyverse)
library(readxl)

# Se carga la base y se quitan las primeras 4 filas
pib_desagregado <- read_xlsx("data/pib_desagregado.xlsx", skip = 4) %>% 
# Se elimina la primera fila y se escogen solo las que se necesitan
  slice(-1) %>% 
  slice(5,8,10,13) %>% 

  rename("variable" = "...1")



