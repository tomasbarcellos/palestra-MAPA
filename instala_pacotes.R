# Instalar pacotes necessários para o curso:

pacotes <- dir(pattern = ".zip", recursive = TRUE)

sapply(pacotes, install.packages, repos = NULL, type = "source")
