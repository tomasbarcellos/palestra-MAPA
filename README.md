# palestra-MAPA
Repositório com apresentações da palestra de 27/01/2017

## Dados utilizados

### dplyr
Os dados utilizados na apresentação do `dplyr` são `PAM.csv` e `PAM.xlsx`.

### ggplot2

Os dados utilizados na apresentação do ggplot2 foi extraído com o código abaixo:

```{r}
library(devtools)
devtools::install_github("tomasbarcellos/RSIDRA")
library(RSIDRA)
library(dplyr)
library(tidyr)

cult_temp <- API_SIDRA(1612, 81, nivel = 2) %>%
  rename(cultura =  `Produto das lavouras temporárias`,
         `cultura (Código)` = `Produto das lavouras temporárias (Código)`)
cult_temp$tipo <- "temporária"

cult_perm <- API_SIDRA(1613, 82, nivel = 2) %>%
  rename(cultura =  `Produto das lavouras permanentes`,
         `cultura (Código)` = `Produto das lavouras permanentes (Código)`)
cult_perm$tipo <- "permanente"

PAM <- bind_rows(cult_temp, cult_perm)
PAM$Variável[PAM$Variável == "Área destinada à colheita"] <- "Área colhida"
PAM <- PAM %>% 
   group_by(Variável) %>%
   mutate(row = 1:n()) %>% 
   ungroup() 

sair <- union(contains("Código", vars = names(PAM)),
              contains("Medida", vars = names(PAM)))
PAM <- PAM[, -sair]

dados <- PAM %>% spread(key = Variável,
                        value = Valor) %>%
  select(-row) %>% 
  filter(Ano >= 1994) # remover anos com cruzeiros etc

dados <- dados %>% 
  rename(regiao = `Grande Região`,
         area_colhida = `Área colhida`,
         area_plantada = `Área plantada`,
         quantidade = `Quantidade produzida`,
         produtividade = `Rendimento médio da produção`,
         VBP = `Valor da produção`)
saveRDS(dados, "amostra-PAM.RDS")
```
