## Preproccess files in a usable format

years <- 10 : 17
setwd("~/Downloads/")
countries <- NULL
countries$labelFd <- c("B", "D", "F", "I", "N", "P", "SC", "SP", "E", "E")
countries$labelVs <- c("Bel", "Ger", "Fra", "Ita", "Net", "Por", "Sco", "Spa", "Eng", "Eng")
countries$biasFd <- c(0, 0, 0, 0, 0, 0, -1, 0, -1, 0)
countries$biasVs <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 2)
countries$numLeagues <- c(1, 2, 2, 2, 1, 1, 4, 2, 1, 2)

# Unzip folder
for (y in years) {
  yearName <- toString(y)
  unzip(paste0(yearName, ".zip"), exdir = yearName)
  for (i in seq(countries$labelFd)) {
    for (j in seq(countries$numLeagues[i])) {
      file.copy(paste0(yearName, "/", countries$labelFd[i], toString(j + countries$biasFd[i]), ".csv"),
                paste0("../Documents/Soccer Prediction/Model/Data/", countries$labelVs[i], toString(j + countries$biasVs[i]), "/", yearName, ".csv"), overwrite = TRUE)
    }
  }
  file.copy(paste0(yearName, "/EC.csv"), paste0("../Documents/Soccer Prediction/Model/Data/Eng2/", yearName, ".csv"), overwrite = TRUE)
}

file.copy("test.txt", "../Documents/test.txt", overwrite = TRUE)