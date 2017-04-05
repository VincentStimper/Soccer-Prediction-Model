PrintCoefficients <- function(leagueLabel, teamNames) {
  ## Print model coefficient in an resource xml file usable for app
  
  # Load model coefficients
  load(paste0("Parameter/modelCoef", leagueLabel, ".RData"))
  modelCoefNames <- names(modelCoef)
  
  # Extract relevant coefficients
  attackHome <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("attackHome", x)))]
  defendHome <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("defendHome", x)))]
  attackAway <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("attackAway", x)))]
  defendAway <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("defendAway", x)))]
  
  # Print coefficients to file
  fileName <- paste0("modelCoefficients/", tolower(leagueLabel), ".csv")
  coefs <- rbind(attackHome, attackAway, defendHome, defendAway)
  colnames(coefs) <- NULL
  rownames(coefs) <- NULL
  write.table(coefs, file = fileName, row.names = FALSE, col.names = FALSE, sep = ",")
}

