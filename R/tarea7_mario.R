# CONVERTIR LA MATRIZ EN 3X3

library(tidyverse)
library(readxl)


#Cargar la matriz

mip77 <- read_excel("data/MIP77.xlsx", skip=7) %>% 

select(-1) %>% 
  slice(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
        31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,
        58,59,60)

mip_larg <- mip77 %>% 
  rename("producto"="Producto / Producto", "dem_int"="...63","cons_h"="...64",
         "cons_g"="...65", "fk"="...66", "ve"="...67", "x"="...68", 
         "d_tot"="...69", "ut"="...70") %>% 
  select(-"...71") %>% 
  
  mutate_all(as.character) %>% 
  
  pivot_longer(cols = -producto, names_to = "demanda", values_to = "values" )

# Convertir la matriz en 3x3

mip_long_3x3 <- mip_long %>% 
  mutate(sector_prod = case_when(
    producto == "Arroz" ~"s1", producto == "Otros cereales" ~"s1" , 
    producto == "Cultivos alimentarios" ~"s1", producto == "Cultivos no alimentarios" ~"s1", 
    producto == "Ganado y aves de corral" ~"s1", producto == "Silvicultura" ~"s1",
    producto == "Pesca" ~"s1", producto == "Minerales no metálicos y canteras" ~"s1",
    producto == "Granos y harina molida" ~"s1", producto == "Productos pesqueros" ~"s1",
    producto == "Productos cárnicos y productos lácteos" ~"s1", 
    producto == "Otros productos alimenticios" ~"s1", 
    producto == "Bebidas" ~"s2", producto == "Tabaco" ~"s2",
    producto == "Prendas de vestir" ~"s2", 
    producto == "Otros productos confeccionados con textiles" ~"s2",
    producto == "Productos de cuero y piel" ~"s2", producto == "Madera" ~"s2",
    producto == "Muebles de madera" ~"s2", producto == "Papel y pulpa de papel" ~"s2",
    producto == "Impresión y publicación" ~"s2", producto == "Fibras y resinas sintéticas" ~"s2",
    producto == "Fertilizantes y pesticidas químicos" ~"s2", producto == "Medicamentos" ~"s2",
    producto == "Otros productos químicos" ~"s2", 
    producto == "Refinado de petróleo y sus productos" ~"s2",
    producto == "Productos de plástico" ~"s2", producto == "Otros productos de caucho" ~"s2",
    producto == "Cemento y productos de cemento" ~"s2", 
    producto == "Vidrio y productos de vidrio" ~"s2",
    producto == "Otros productos minerales no metálicos" ~"s2", producto == "Hierro y acero" ~"s2",
    producto == "Metales no ferrosos" ~"s2",  producto == "Productos metálicos" ~"s2",
    producto == "Maquinaria general" ~"s2",  producto == "Equipo eléctrico pesado" ~"s2",
    producto == "Televisores, radios, audios y equipos de comunicación" ~"s2",  
    producto == "Equipo de cómputo electrónico" ~"s2",
    producto == "Equipos eléctricos del hogar" ~"s2",  
    producto == "Accesorios de iluminación, baterías, cableado y otros" ~"s2",
    producto == "Vehículos automotores" ~"s2",  producto == "Otros equipos de transporte" ~"s2",
    producto == "Máquinas de precisión" ~"s2",  producto == "Otros productos manufactureros" ~"s2",
    producto == "Electricidad y gas" ~"s3",  producto == "Abastecimiento de agua" ~"s3",
    producto == "Construcción de edificios" ~"s3",  producto == "Otras construcciones" ~"s3",
    producto == "Comercio al por mayor y al por menor" ~"s3",  producto == "Transporte" ~"s3",
    producto == "Teléfono y telecomunicaciones" ~"s3",  producto == "Finanzas y seguros" ~"s3",
    producto == "Bienes raíces" ~"s3",  producto == "Educación e investigación" ~"s3",
    producto == "Servicios médicos y de salud" ~"s3",  producto == "Restaurantes" ~"s3",
    producto == "Hoteles" ~"s3",  producto == "Otros servicios" ~"s3",
    producto == "Arroz" ~"s3",  producto == "Arroz" ~"s3",
    producto == "Arroz" ~"s3",  producto == "Arroz" ~"s3",
    producto == "Arroz" ~"s3",  producto == "Arroz" ~"s3",
    producto == "Arroz" ~"s3",  producto == "Arroz" ~"s3",
    producto == "Arroz" ~"s3",  producto == "Arroz" ~"s3", 
    TRUE ~ "others"
  )) %>% 

mutate(sector_dem = case_when(
  demanda == "Arroz" ~"s1", demanda == "Otros cereales" ~"s1" , 
  demanda == "Cultivos alimentarios" ~"s1", demanda == "Cultivos no alimentarios" ~"s1", 
  demanda == "Ganado y aves de corral" ~"s1", demanda == "Silvicultura" ~"s1",
  demanda == "Pesca" ~"s1", demanda == "Minerales no metálicos y canteras" ~"s1",
  demanda == "Granos y harina molida" ~"s1", demanda == "Productos pesqueros" ~"s1",
  demanda == "Productos cárnicos y productos lácteos" ~"s1", 
  demanda == "Otros productos alimenticios" ~"s1", 
  demanda == "Bebidas" ~"s2", demanda == "Tabaco" ~"s2",
  demanda == "Prendas de vestir" ~"s2", 
  demanda == "Otros productos confeccionados con textiles" ~"s2",
  demanda == "Productos de cuero y piel" ~"s2", demanda == "Madera" ~"s2",
  demanda == "Muebles de madera" ~"s2", demanda == "Papel y pulpa de papel" ~"s2",
  demanda == "Impresión y publicación" ~"s2", demanda == "Fibras y resinas sintéticas" ~"s2",
  demanda == "Fertilizantes y pesticidas químicos" ~"s2", demanda == "Medicamentos" ~"s2",
  demanda == "Otros productos químicos" ~"s2", 
  demanda == "Refinado de petróleo y sus productos" ~"s2",
  demanda == "Productos de plástico" ~"s2", demanda == "Otros productos de caucho" ~"s2",
  demanda == "Cemento y productos de cemento" ~"s2", 
  demanda == "Vidrio y productos de vidrio" ~"s2",
  demanda == "Otros productos minerales no metálicos" ~"s2", demanda == "Hierro y acero" ~"s2",
  demanda == "Metales no ferrosos" ~"s2",  demanda == "Productos metálicos" ~"s2",
  demanda == "Maquinaria general" ~"s2",  demanda == "Equipo eléctrico pesado" ~"s2",
  demanda == "Televisores, radios, audios y equipos de comunicación" ~"s2",  
  demanda == "Equipo de cómputo electrónico" ~"s2",
  demanda == "Equipos eléctricos del hogar" ~"s2",  
  demanda == "Accesorios de iluminación, baterías, cableado y otros" ~"s2",
  demanda == "Vehículos automotores" ~"s2",  demanda == "Otros equipos de transporte" ~"s2",
  demanda == "Máquinas de precisión" ~"s2",  demanda == "Otros productos manufactureros" ~"s2",
  demanda == "Electricidad y gas" ~"s3",  demanda == "Abastecimiento de agua" ~"s3",
  demanda == "Construcción de edificios" ~"s3",  demanda == "Otras construcciones" ~"s3",
  demanda == "Comercio al por mayor y al por menor" ~"s3",  demanda == "Transporte" ~"s3",
  demanda == "Teléfono y telecomunicaciones" ~"s3",  demanda == "Finanzas y seguros" ~"s3",
  demanda == "Bienes raíces" ~"s3",  demanda == "Educación e investigación" ~"s3",
  demanda == "Servicios médicos y de salud" ~"s3",  demanda == "Restaurantes" ~"s3",
  demanda == "Hoteles" ~"s3",  demanda == "Otros servicios" ~"s3",
  demanda == "Arroz" ~"s3",  demanda == "Arroz" ~"s3",
  demanda == "Arroz" ~"s3",  demanda == "Arroz" ~"s3",
  demanda == "Arroz" ~"s3",  demanda == "Arroz" ~"s3",
  demanda == "Arroz" ~"s3",  demanda == "Arroz" ~"s3",
  demanda == "Arroz" ~"s3",  demanda == "Arroz" ~"s3", 
  TRUE ~ "others"
)) 
  
  #gyroup_by(sector_prod, values) %>%
  #summarise(values=sum(values)) %>% 
  #group_by(sector_dem, values) %>% 
  #summarise(values=sum(values))















