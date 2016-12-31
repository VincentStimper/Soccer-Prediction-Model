CalculateModelCoefficients <- function(leagueLabel, years) {
  ## The calculation of the coefficients of the Poisson model is done here. The optimal weight
  ## parameter lambdaOpt, obtained with CalculateLambda.R, is used.
  
  # Read data
  source("WDLClassifier.R")
  source("PredictOutcome.R")
  dates <- NULL
  teamA <- NULL
  teamB <- NULL
  goalA <- NULL
  goalB <- NULL
  for (y in years) {
    tab <- read.csv(paste0("../Data/", leagueLabel, "/", toString(y), ".csv"))
    ind <- tab[, 1] == tab[1, 1]
    dates <- c(dates, as.character(tab$Date[ind]))
    teamA <- c(teamA, as.character(tab$HomeTeam[ind]))
    teamB <- c(teamB, as.character(tab$AwayTeam[ind]))
    goalA <- c(goalA, as.numeric(tab$FTHG[ind]))
    goalB <- c(goalB, as.numeric(tab$FTAG[ind]))
  }
  dates <- as.Date(dates, format = "%d/%m/%y")
  numTeams <- length(levels(as.factor(teamA)))
  load("Parameter/lambda.RData")
  
  # Calculate coefficients
  w <- exp(- lambdaOpt * as.numeric(max(dates) - dates))
  fitA <- glm(goalA ~ 0 + teamA + teamB, family = poisson(link = "log"), weights = w)
  modelCoefA <- exp(c(coef(fitA)[1 : numTeams], 0, coef(fitA)[- (1 : numTeams)]))
  names(modelCoefA) <- gsub("teamA", "attackHome", names(modelCoefA))
  names(modelCoefA) <- gsub("teamB", "defendAway", names(modelCoefA))
  names(modelCoefA)[numTeams + 1] <- gsub("attackHome", "defendHome", names(modelCoefA)[1])
  fitB <- glm(goalB ~ 0 + teamB + teamA, family = poisson(link = "log"), weights = w)
  modelCoefB <- exp(c(coef(fitB)[1 : numTeams], 0, coef(fitB)[- (1 : numTeams)]))
  names(modelCoefB) <- gsub("teamB", "attackAway", names(modelCoefB))
  names(modelCoefB) <- gsub("teamA", "defendHome", names(modelCoefB))
  names(modelCoefB)[numTeams + 1] <- gsub("attackAway", "defendAway", names(modelCoefB)[1])
  modelCoef <- c(modelCoefA, modelCoefB)
  
  # Save model coefficients
  save(modelCoef, file = paste0("Parameter/modelCoef", leagueLabel, ".RData"))
}
