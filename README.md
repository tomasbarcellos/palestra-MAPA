# palestra-MAPA
Repositório com apresentações da palestra de 27/01/2017

# Os dados utilizados em ambas apresentações foi extraído com o código abaixo:

```{r}
library(devtools)
devtools::install_github("tomasbarcellos/RSIDRA")
library(RSIDRA)
library(dplyr)

cult_temp <- API_SIDRA(1612, 81, nivel = 2)
cult_temp$tipo <- "temporária"
cult_perm <- API_SIDRA(1613, 82, nivel = 2)
cult_perm$tipo <- "permanente"
PAM <- bind_rows(cult_temp, cult_perm) %>%
  select(ano = D1N, variavel = D2N,
         cultura = D4N, regiao = D3N,
         tipo, valor = V) %>%
  filter(ano >= 1994) # remover anos com cruzeiros etc
  
saveRDS(PAM, "PAM.RDS")
```
