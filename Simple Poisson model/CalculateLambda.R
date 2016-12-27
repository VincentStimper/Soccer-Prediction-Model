# For the calculation of the coefficients of the Poisson model the bundesliga games are weighted
# by a factor exp(- lambda * deltaT). Here, lambda is obtained by trying different lambdas and
# maximizing the prediction rate on the test set.

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

# Data and test set
indData <- which(dates < as.Date("20/09/16", format = "%d/%m/%y"))
indTest <- which(dates >= as.Date("20/09/16", format = "%d/%m/%y"))
teamAData <- c(teamA[indData], teamB[indData])
teamBData <- c(teamB[indData], teamA[indData])
goalData <- c(goalA[indData], goalB[indData])
datesData <- rep(dates[indData], 2)
teamATest <- teamA[indTest]
teamBTest <- teamB[indTest]
outcomeTest <- WDLClassifier(goalA[indTest], goalB[indTest])
datesTest <- dates[indTest]

# Initialize lambda
lambda <- 10 ^ seq(-5, -3, length.out = 200)

# Calculate and test coefficients
accuracy <- rep(0, length(lambda))
for (i in seq(lambda)) {
  # Calculate coefficients
  w <- exp(- lambda[i] * as.numeric(max(datesData) - datesData))
  fit <- glm(goalData ~ 0 + teamAData + teamBData, family = poisson(link = "log"), weights = w)
  modelCoef <- exp(c(coef(fit)[1 : numTeams], 0, coef(fit)[- (1 : numTeams)]))
  names(modelCoef) <- gsub("teamAData", "attack", names(modelCoef))
  names(modelCoef) <- gsub("teamBData", "defend", names(modelCoef))
  names(modelCoef)[numTeams + 1] <- gsub("attack", "defend", names(modelCoef)[1])
  # Test
  predictedOutcome <- PredictOutcome(teamATest, teamBTest, modelCoef)
  accuracy[i] <- sum(predictedOutcome == outcomeTest) / length(outcomeTest)
}

# Find and save optimal lambda
lambdaOpt <- lambda[which.max(accuracy)]
save(lambdaOpt, file = "../Simple Poisson model/Parameter/lambda.RData")
