# The calculation of the coefficients of the Poisson model is done here. The optimal weight
# parameter lambdaOpt, obtained with CalculateLambda.R, is used.

# Read data
setwd(dirname(sys.frame(1)$ofile))
source("WDLClassifier.R")
source("PredictOutcome.R")
setwd("../Data")
years <- 11:17
dates <- NULL
teamA <- NULL
teamB <- NULL
goalA <- NULL
goalB <- NULL
for (y in years) {
  tab <- read.csv(paste0(toString(y), ".csv"))
  dates <- c(dates, as.character(tab$Date))
  teamA <- c(teamA, as.character(tab$HomeTeam))
  teamB <- c(teamB, as.character(tab$AwayTeam))
  goalA <- c(goalA, as.numeric(tab$FTHG))
  goalB <- c(goalB, as.numeric(tab$FTAG))
}
dates <- as.Date(dates, format = "%d/%m/%y")
numTeams <- length(levels(as.factor(teamA)))
load("../Simple Poisson model/Parameter/lambda.RData")

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
save(modelCoef, file = "../Simple Poisson model/Parameter/modelCoef.RData")
