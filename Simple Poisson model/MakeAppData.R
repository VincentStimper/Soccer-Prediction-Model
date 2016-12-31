## Calculate coefficients, print team names, print coefficients


# Set directory, load source files
setwd(dirname(sys.frame(1)$ofile))
source("CalculateModelCoefficients.R")
source("PrintTeams.R")
source("PrintCoefficients.R")

countries <- NULL
countries$label <- c("Bel", "Ger", "Fra", "Ita", "Net", "Por", "Sco", "Spa", "Eng")
countries$numLeagues <- c(1, 2, 2, 2, 1, 1, 4, 2, 4)

years <- 10 : 17

# Calculate coefficients
for (i in seq(countries$label)) {
  for (j in seq(countries$numLeagues[i])) {
    leagueLabel <- paste0(countries$label[i], toString(j))
    CalculateModelCoefficients(leagueLabel, years)
    teamNames <- PrintTeams(leagueLabel, 17)
    PrintCoefficients(leagueLabel, teamNames)
  }
}
