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
indAttack <- grep("attack", modelCoefNames)
indDefend <- grep("defend", modelCoefNames)
attackCoef <- (modelCoef[indAttack])[sapply(teams, function(x) grep(x, modelCoefNames[indAttack]))]
defendCoef <- (modelCoef[indDefend])[sapply(teams, function(x) grep(x, modelCoefNames[indDefend]))]

# Print coefficients to file
close(file("modelCoefficients.xml", open = "w"))
fileConn <- file("modelCoefficients.xml", open = "a")
writeLines(c("<?xml version=\"1.0\" encoding=\"utf-8\"?>", "<resources>", "\t<string-array name=\"lambda_attack\">"), fileConn)
sapply(attackCoef, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
writeLines(c("\t</string-array>", "\t<string-array name=\"lambda_defence\">"), fileConn)
sapply(defendCoef, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
writeLines(c("\t</string-array>", "</resources>"), fileConn)
close(fileConn)

# Copy file to resource folder
file.copy("modelCoefficients.xml", "../../../BundesligaPrediction/app/src/main/res/values/modelCoefficients2.xml")

