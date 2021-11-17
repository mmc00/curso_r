library(qs)
library(tidyverse)
library(readxl)
# data --------------------------------------------------------------------
## datos de importaciones manhattan
imp_man <- qread("C:\\Documentos\\manhattan_xm\\output\\bulk\\imp_2011_2021.qs")

imp_muestra <- imp_man %>% 
  filter(year == 2020)

remove(imp_man)
gc()


dict_sicomex1 <- read_excel(
  "data//dict_sicomex.xlsx",
  "Bloque2"
) %>%
  rename("code_pais" = "Código País") %>% 
  mutate(code_pais = as.numeric(code_pais))

dict_sicomex2 <- read_excel(
  "data//dict_sicomex.xlsx",
  "Bloque"
) %>%
  rename("code_pais" = "Código País") %>% 
  mutate(code_pais = as.numeric(code_pais))

cuode_dict <- read_excel(
  "data//dict_sicomex.xlsx",
  "CUODE"
) %>%
  rename("cuode" = "CUODE") %>% 
  mutate(cuode = as.numeric(cuode))
# uniones -----------------------------------------------------------------
union1 <- imp_muestra %>% 
  left_join(dict_sicomex1, by = "code_pais")

union2 <- imp_muestra %>% 
  left_join(dict_sicomex2, by = "code_pais")

union1 %>% 
  filter(manual6) %>% 
  summarise(value = sum(cif_num, na.rm = T))

union2 %>% 
  filter(manual6) %>% 
  summarise(value = sum(cif_num, na.rm = T))

union2 %>% 
  filter(manual6) %>% 
  group_by(Bloque) %>%
  summarise(value = sum(cif_num, na.rm = T)) %>% 
  arrange(desc(value))

union2 %>% 
  filter(manual6) %>% 
  group_by(Bloque, cuode) %>%
  summarise(value = sum(cif_num, na.rm = T)) %>% 
  arrange(desc(value)) %>% 
  mutate(cuode = as.numeric(cuode)) %>% 
  left_join(cuode_dict, by = "cuode") 

union2 %>%
  filter(manual6) %>%
  group_by(Bloque, cuode) %>%
  summarise(value = sum(cif_num, na.rm = T), .groups = "drop") %>%
  arrange(desc(value)) %>%
  mutate(cuode = as.numeric(cuode)) %>%
  mutate(intermedios = if_else(cuode %in% c(51, 59), "int", "otros")) %>%
  group_by(Bloque, intermedios) %>%
  summarise(value = sum(value, na.rm = T), .groups = "drop") %>%
  arrange(desc(value))

diccionario_hs_cuode <- union2 %>% 
  distinct(inciso, cuode)

diccionario_hs_cuode <- union2 %>% 
  distinct(inciso, cuode)
