library(readxl)
library(tidyverse)
library(stringr)

pib_pmercados <- read_xlsx("data/pib_pmercados.xlsx", skip = 3) %>% 
  slice(-1) %>% 
  slice(1:18) %>% 
  rename("variable" = "...1") %>% 
  mutate(variable = gsub("      ", "", variable)) %>% 
  pivot_longer(cols = -variable, names_to = "year",
               values_to = "values_mercado") %>% 
  mutate(variable = ifelse(variable == "Producto Interno Bruto a precios de mercado",
                           "PIB", variable))

pib_encadenado <- read_xlsx("data/pib_encadenado.xlsx", skip = 3) %>% 
  slice(-1) %>% 
  slice(1:18) %>% 
  rename("variable" = "...1") %>% 
  # mutate(variable = gsub("     ", "", variable)) %>% 
  mutate(variable = str_trim(variable)) %>% 
  pivot_longer(cols = -variable, names_to = "year",
                 values_to = "values_encadenado") %>% 
  mutate(variable = ifelse(variable == "Producto Interno Bruto a precios de mercado",
                           "PIB", variable))

pib <- pib_encadenado %>% 
  left_join(pib_pmercados, by = c("variable", "year")) 
  
