PrintCoefficients <- function(leagueLabel, teamNames) {
  ## Print model coefficient in an resource xml file usable for app
  
  # Load model coefficients
  load(paste0("Parameter/modelCoef", leagueLabel, ".RData"))
  modelCoefNames <- names(modelCoef)
  
  # Extract relevant coefficients
  # indAttackHome <- grep("attackHome", modelCoefNames)
  # indDefendHome <- grep("defendHome", modelCoefNames)
  # indAttackAway <- grep("attackAway", modelCoefNames)
  # indDefendAway <- grep("defendAway", modelCoefNames)
  # attackHome <- (modelCoef[indAttackHome])[sapply(teamNames, function(x) grep(x, modelCoefNames[indAttackHome]))]
  # defendHome <- (modelCoef[indDefendHome])[sapply(teamNames, function(x) grep(x, modelCoefNames[indDefendHome]))]
  # attackAway <- (modelCoef[indAttackAway])[sapply(teamNames, function(x) grep(x, modelCoefNames[indAttackAway]))]
  # defendAway <- (modelCoef[indDefendAway])[sapply(teamNames, function(x) grep(x, modelCoefNames[indDefendAway]))]
  attackHome <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("attackHome", x)))]
  defendHome <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("defendHome", x)))]
  attackAway <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("attackAway", x)))]
  defendAway <- modelCoef[sapply(teamNames, function(x) which(modelCoefNames == paste0("defendAway", x)))]
  
  # Print coefficients to file
  fileName <- paste0("Printed model coefficients/modelCoefficients", leagueLabel, ".xml")
  close(file(fileName, open = "w"))
  fileConn <- file(fileName, open = "a")
  writeLines(c("<?xml version=\"1.0\" encoding=\"utf-8\"?>", "<resources>", paste0("\t<string-array name=\"lambda_attack_home_", tolower(leagueLabel),"\">")), fileConn)
  sapply(attackHome, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
  writeLines(c("\t</string-array>", paste0("\t<string-array name=\"lambda_defence_home_", tolower(leagueLabel),"\">")), fileConn)
  sapply(defendHome, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
  writeLines(c("\t</string-array>", paste0("\t<string-array name=\"lambda_attack_away_", tolower(leagueLabel),"\">")), fileConn)
  sapply(attackAway, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
  writeLines(c("\t</string-array>", paste0("\t<string-array name=\"lambda_defence_away_", tolower(leagueLabel),"\">")), fileConn)
  sapply(defendAway, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
  writeLines(c("\t</string-array>", "</resources>"), fileConn)
  close(fileConn)
}

