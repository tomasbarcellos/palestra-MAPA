# palestra-MAPA
Repositório com apresentações da palestra de 27/01/2017

# Os dados utilizados em ambas apresentações foi extraído com o código abaixo:

```
library(devtools)
devtools::install_github("tomasbarcellos/RSIDRA")
library(RSIDRA)
cult_temp <- API_SIDRA(1612, 81, nivel = 2)
cult_temp$cultura <- "temporária"
cult_perm <- API_SIDRA(1613, 82, nivel = 2)
cult_perm$cultura <- "permanente"
PAM <- rbind(cult_temp, cult_perm)
saveRDS(PAM, "PAM.RDS")
```
