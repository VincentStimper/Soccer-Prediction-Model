PrintTeams <- function(leagueLabel, year) {
  ## Prints team names in for app usable format
  ## wd: dir where script is located
  
  # Get team names
  tab <- read.csv(paste0("../Data/", leagueLabel, "/", toString(year), ".csv"))
  ind <- tab[, 1] == tab[1, 1]
  teams <- NULL
  teams <- c(teams, as.character(tab$HomeTeam[ind]))
  teams <- c(teams, as.character(tab$AwayTeam[ind]))
  teamNames <- levels(as.factor(teams))
  
  # Print team names
  fileName <- paste0("Printed teams/teamNames", leagueLabel, ".xml")
  close(file(fileName, open = "w"))
  fileConn <- file(fileName, open = "a")
  writeLines(c("<?xml version=\"1.0\" encoding=\"utf-8\"?>", "<resources>", paste0("\t<string-array name=\"team_names_", tolower(leagueLabel), "\">")), fileConn)
  sapply(teamNames, function(x) write(paste0("\t\t<item>", x, "</item>"), fileConn))
  writeLines(c("\t</string-array>", "</resources>"), fileConn)
  close(fileConn)
  
  # Return team names
  return(teamNames)
}