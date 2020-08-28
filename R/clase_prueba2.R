# primera clase
# install.packages("tidyverse")
library(tidyverse)
variable_1 <- 5 
variable_2 = 5


variable_3 <- variable_1 + 5 

func1 <- function(param1){
  param2 <- param1 + 5
  return(param2)
}

func1(param1 = 7)

# Operadores 
variable_1 >= 5
variable_1 == 6
variable_1 != 6

library(readxl)
prueba_pib <- read_excel("C:/Users/Marlon.molina/OneDrive - Ministerio de Comercio Exterior/Escritorio/prueba_pib.xlsx")
View(prueba_pib)
prueba_pib2 <- data.frame("pib_china" = c(10, 30, 50, 80, 40),
                          "pib_italia" = c(1, 2, 3, 4, 5))

prueba_pib3 <- cbind(prueba_pib, prueba_pib2)

# manipulation de la data
prueba_pib3[ , "pib_usa_log"] <- log(prueba_pib3[, "PIB_USA"])
prueba_pib3[1, 2]

prueba_pib3[1 , ] <- log(prueba_pib3[1, ])

