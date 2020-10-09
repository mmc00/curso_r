# Clase 2
library(tidyverse)
library(readxl)
# paquetes mencion
pib <- read_excel("data/prueba_pib.xlsx")
# remove(pib)
# Directorios
# Proyectos
# nombres

# Retomar data frames
pib[2, 2]
pib[2, "PIB_CR"]


pib[ , "PIB_CR"]
pib$PIB_CR

x <- pib$PIB_CR + 10
pib$prueba_cr <- pib$PIB_CR + 10
View(pib)

pib$combinado <- pib$PIB_CR + pib$PIB_USA
# tidyverse 
remove(pib)
pib <- read_excel("data/prueba_pib.xlsx")
# Data del Banco Mundial Wider
pib2 <- pib %>% 
  mutate(prueba = PIB_CR + 10) %>% 
  mutate(combinado = PIB_CR + PIB_USA) %>% 
  mutate(combinado2 = combinado + 10)

# Paquete tidiverse::

# Intro a dplyr
# Ejemplo basic R vs dplyr
# The pipe
pib_usa <- read_excel("data/gdp_in_millions.xls",
                      skip = 4)
