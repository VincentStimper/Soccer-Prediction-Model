# Print model coefficient in an resource xml file usable for app


# Teams of current season (2016/17)
teams <- c("Augsburg", "Bayern", "Bremen", "Darmstadt", "Dortmund",
           "Frankfurt", "Freiburg", "M'gladbach", "Hamburg", "Hertha",
           "Hoffenheim", "Ingolstadt", "Koln", "Leipzig", "Leverkusen",
           "Mainz", "Schalke", "Wolfsburg")

# Load model coefficients
setwd(dirname(sys.frame(1)$ofile))
setwd("Parameter")
load("modelCoef.RData")
modelCoefNames <- names(modelCoef)

# Extract relevant coefficients
indAttackHome <- grep("attackHome", modelCoefNames)
indDefendHome <- grep("defendHome", modelCoefNames)
indAttackAway <- grep("attackAway", modelCoefNames)
indDefendAway <- grep("defendAway", modelCoefNames)
attackHome <- (modelCoef[indAttackHome])[sapply(teams, function(x) grep(x, modelCoefNames[indAttackHome]))]
defendHome <- (modelCoef[indDefendHome])[sapply(teams, function(x) grep(x, modelCoefNames[indDefendHome]))]
attackAway <- (modelCoef[indAttackAway])[sapply(teams, function(x) grep(x, modelCoefNames[indAttackAway]))]
defendAway <- (modelCoef[indDefendAway])[sapply(teams, function(x) grep(x, modelCoefNames[indDefendAway]))]

# Print coefficients to file
close(file("modelCoefficients.xml", open = "w"))
fileConn <- file("modelCoefficients.xml", open = "a")
writeLines(c("<?xml version=\"1.0\" encoding=\"utf-8\"?>", "<resources>", "\t<string-array name=\"lambda_attack_home\">"), fileConn)
sapply(attackHome, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
writeLines(c("\t</string-array>", "\t<string-array name=\"lambda_defence_home\">"), fileConn)
sapply(defendHome, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
writeLines(c("\t</string-array>", "\t<string-array name=\"lambda_attack_away\">"), fileConn)
sapply(attackAway, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
writeLines(c("\t</string-array>", "\t<string-array name=\"lambda_defence_away\">"), fileConn)
sapply(defendAway, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
writeLines(c("\t</string-array>", "</resources>"), fileConn)
close(fileConn)

# Copy file to resource folder
file.copy("modelCoefficients.xml", "../../../SoccerPrediction/app/src/main/res/values/modelCoefficients2.xml")

