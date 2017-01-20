# palestra-MAPA
Repositório com apresentações da palestra de 27/01/2017

# Os dados utilizados em ambas apresentações foi extraído com o código abaixo:

```
library(devtools)
devtools::install_github("tomasbarcellos/RSIDRA")
library(RSIDRA)
library(dplyr)

cult_temp <- API_SIDRA(1612, 81, nivel = 2)
cult_temp$cultura <- "temporária"
cult_perm <- API_SIDRA(1613, 82, nivel = 2)
cult_perm$cultura <- "permanente"
PAM <- rbind(cult_temp, cult_perm) %>%
    rename(ano_cod = D1C, ano_desc = D1N,
           var_cod = D2C, var_desc = D2N,
           regiao_cod = D3C, regiao_desc = D3N,
           cultura_cod = D4C, cultura_desc = D4N,
           unidade_cod = MC, unidade_desc = MN,
           valor = V)
saveRDS(PAM, "PAM.RDS")
```
