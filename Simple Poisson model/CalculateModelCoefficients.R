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
homeTeam <- c(teamA, teamB)
awayTeam <- c(teamB, teamA)
goal <- c(goalA, goalB)
dates <- as.Date(dates, format = "%d/%m/%y")
numTeams <- length(levels(as.factor(teamA)))
load("../Simple Poisson model/Parameter/lambda.RData")

# Calculate coefficients
w <- exp(- lambdaOpt * as.numeric(max(dates) - dates))
w <- rep(w, 2)
fit <- glm(goal ~ 0 + homeTeam + awayTeam, family = poisson(link = "log"), weights = w)
modelCoef <- exp(c(coef(fit)[1 : numTeams], 0, coef(fit)[- (1 : numTeams)]))
names(modelCoef) <- gsub("homeTeam", "attack", names(modelCoef))
names(modelCoef) <- gsub("awayTeam", "defend", names(modelCoef))
names(modelCoef)[numTeams + 1] <- gsub("attack", "defend", names(modelCoef)[1])

# Save model coefficients
save(modelCoef, file = "../Simple Poisson model/Parameter/modelCoef.RData")
