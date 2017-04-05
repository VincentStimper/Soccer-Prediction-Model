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
  fileName <- paste0("teamNames/", tolower(leagueLabel), ".csv")
  write.table(t(teamNames), file = fileName, col.names = FALSE, row.names = FALSE, sep = ",")
  
  # Return team names
  return(teamNames)
}