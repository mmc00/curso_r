#CLASE 5 TAREA

library(tidyverse)
library(readxl)

# Se carga la base y se quitan las primeras 4 filas
pib_desagregado <- read_xlsx("data/pib_desagregado.xlsx", skip = 4) %>% 
# Se elimina la primera fila y se escogen solo las que se necesitan
  slice(-1) %>% 
  slice(5,8,10,13) %>% 
  rename("variable" = "...1") 
  
#transponer la tabla
  pib_transpuesto <- pib_desagregado %>% 
    pivot_longer(cols = paste0(1991:2021), names_to = "fecha" ,
                 values_to = "values") %>% 
    mutate(categorias = case_when(
      variable == "Gasto de consumo final (P3-P4)" ~ "gasto", 
      variable == "Formación bruta de capital fijo (P51g)" ~ "inversion",
      variable == "EXPORTACIONES DE BIENES Y SERVICIOS (P6)" ~ "export",
      variable == "IMPORTACIONES DE BIENES Y SERVICIOS (P7)" ~ "import",
      TRUE ~ "others" )) %>%
    group_by(categorias, fecha) %>% 
    summarise(pib = sum(values, .groups = "drop"))
  
  
  
  #balanza comercial
    mutate(balanza=X-M) %>% 
    mutate(pib=G+C+balanza)  


  