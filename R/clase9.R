# librarias
# install.packages("tidyverse")
# install.packages("qs")

library(tidyverse) # manipulacion
library(qs) # archivos qs
library(vroom)
library(here)

# datos -------------------------------------------------------------------
exp <- qread("C:\\Documentos\\manhattan_xm\\output\\bulk\\full_exports.qs")

## muestra 
exp_muestra <- head(exp, 10)

vroom_write(exp_muestra, here("full_exports.csv"),
  bom = TRUE,
  num_threads = 5,
  progress = TRUE
)

write.table(exp_muestra, here("full_exports.txt"),
            sep = ";")
# exploracion -------------------------------------------------------------
exp %>% glimpse()
exp %>% names()
exp %>% colnames()

# solicitudes -------------------------------------------------------------
## Marlen, ocupamos los datos de frutas de Argentina,
## para el 2006, 2020


## operador pipe
# suma_prueba <- sum(5, 6, 7, 8)
# division_prueba <- mean(suma_prueba)
# 
# 
# suma_pruba <- c(5, 6, 7, 8) %>%
#   sum() %>%
#   mean()

# solicitud_1 <- exp %>% 
#   filter(code_pais == 32)
# 
# solicitud_1.1 <- solicitud_1 %>% 
#   filter(partida == "0804")
#   
# solicitud_1.2 <- solicitud_1.1 %>% 
#   filter(year %in% c(2006:2020))


## filtrar
solicitud_1 <- exp %>% 
  filter(code_pais == 32) %>% 
  filter(partida == "0804") %>% 
  filter(year %in% c(2006:2020))

## Promedio
solicitud_2 <- solicitud_1 %>%
  filter(year %in% c(2018, 2019, 2020)) %>%
  group_by(exportador) %>%
  summarise(valor = mean(valor_st_num)) %>% 
  arrange(desc(valor))

## Crecimiento de las exportaciones por exportador
solicitud_3 <- solicitud_1 %>% 
  filter(year %in% c(2018, 2019, 2020)) %>%
  group_by(exportador, year) %>%
  summarise(valor = sum(valor_st_num)) %>%
  group_by(exportador) %>% 
  mutate(valor_rezagado = lag(valor)) %>%
  mutate(growth = ((valor / valor_rezagado) - 1)) 
  # select(year, exportador, valor, valor_rezagado)

# options(scipen = 999)

## Paraguay, Uruguay, Brasil
solicitud_4 <- exp %>% 
  filter(code_pais %in% c(32, 76, 600, 858)) %>%
  # filter(year %in% c(2018, 2019, 2020)) %>%
  filter(exportador == "GRUPO NACION GN S.A.") %>% 
  group_by(exportador, pais, year, subpartida) %>%
  summarise(valor = mean(valor_st_num)) %>% 
  arrange(pais, desc(valor))


## Exportaciones
solicitud_4 <- exp %>% 
  # filter(code_pais %in% c(32, 76, 600, 858)) %>%
  # filter(year %in% c(2018, 2019, 2020)) %>%
  filter(exportador == "GRUPO NACION GN S.A.") %>% 
  group_by(exportador, pais, year, inciso) %>%
  summarise(valor = mean(valor_st_num)) %>% 
  arrange(pais, desc(valor)) %>% 
  ungroup() %>% 
  select(-exportador)

writexl::write_xlsx(solicitud_4, "C:\\Documentos\\solicitud4.xlsx")
