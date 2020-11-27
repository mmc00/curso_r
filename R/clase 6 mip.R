library(tidyverse)
library(readxl)

MIP_77 <-read_xlsx("C:\Users\Sebastian\Documents\GitHub\curso_rcdata\MIP77.xlsx")

# Se carga la base y se quitan las primeras 7 filas
MIP_77 <- read_xlsx("MIP77.xlsx", skip = 7) 
  
  
