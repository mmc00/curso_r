# Bases de R
library(tidyverse)
library(readxl)
#
# archivos separadores de comillas
".csv"

data_covid <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

View(data_covid)


# 
data_covid[1, ]
# colnames
var_names <- colnames(data_covid)
# pipe
data_covid_long <- data_covid %>%
  pivot_longer(
    names_to = "date",
    values_to = "confirmados",
    cols = starts_with("X")
  ) %>%
  mutate(confirmados_n = confirmados - lag(confirmados)) %>%
  # Filtrando por paises de interes
  filter(Country.Region %in% c(
    "Costa Rica", "China",
    "Singapore", "Panama"
  )) %>%
  # sumando los datos de China porque China tiene provincias
  group_by(Country.Region, date) %>%
  summarise(confirmados = sum(confirmados, na.rm = T)) %>%
  pivot_wider(names_from = "Country.Region", values_from = "confirmados") %>%
  select(-Panama, -China)
  
  
View(data_covid_long)

lista_de_v <- c(6, 9, 20)
sum(lista_de_v)
lista_de_n <- c(6, 9, NA)
sum((lista_de_n))

data_covid_long %>% 
  group_by(Country.Region) %>% 
  tally() %>% 
  View()
