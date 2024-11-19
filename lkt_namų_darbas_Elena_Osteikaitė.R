library(tidyverse)
library(readxl)
library(writexl)

duomenys <- read_xlsx("C:/Users/Admin/Desktop/lkt namu darbas/LKT_Kultura_w_datamap_Analitiko atranka.xlsx")


svoriu_suma <- duomenys |>
              group_by(D4R) |>
              filter(A1_1 == 1) |>
              summarise(svoriu_suma = sum(W))
      
rodikliai <- merge(duomenys, svoriu_suma, by = "D4R") |>
         select(D4R, ID, A1_1,  W, svoriu_suma) |>
         mutate(W_Wsum = W / svoriu_suma)



write_xlsx(list(rodikliai, svoriu_suma), path = "C:/Users/Admin/Desktop/lkt namu darbas/LKT_Kultura_w_datamap_Elena_Osteikaite.xlsx")

