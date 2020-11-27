library(readxl)

MIP77 <- read_excel("data/MIP77.xlsx", skip=7) %>% 
View(MIP7)

MIP_long <- MIP77 %>% 
  select(-1) %>%
  select(-"...71") %>% 
  rename("producto"="Producto / Producto", 
         "d_int"="...63",
         "cons_h"="...64",
         "cons_g"="...65",
         "fk"="...66",
         "ve"="...67",
         "x"="...68",
         "d_tot"="...69",
         "ut"="...70") %>% 
  mutate_all(as.character) %>% 
pivot_longer(cols= -producto, names_to="demanda", values_to="values")

saveRDS(MIP_long, file = "data/mip_long77.rds")
