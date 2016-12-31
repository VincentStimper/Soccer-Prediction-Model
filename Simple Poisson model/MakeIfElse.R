## Make code fragment


# Set directory, load source files
setwd(dirname(sys.frame(1)$ofile))

countries <- NULL
countries$label <- c("bel", "eng", "fra", "ger", "ita", "net", "por", "sco", "spa")
countries$numLeagues <- c(1, 4, 2, 2, 2, 1, 1, 4, 2)

close(file("Code/IfElse.java", open = "w"))
fileConn <- file("Code/IfElse.java", open = "a")

for (i in seq(countries$label)) {
  for (j in seq(countries$numLeagues[i])) {
    leagueLabel <- paste0(countries$label[i], toString(j))
    # writeLines(c(paste0("} else if (id == R.id.nav_", leagueLabel, ") {"), paste0("\tif (leagueLabel != \"", leagueLabel, "\") {"),
    #              paste0("\t\tleagueLabel = \"", leagueLabel, "\";"), "\t\tchangeLeague();", "\t}"), fileConn)
    writeLines(c(paste0("} else if (leagueLabel == \"", leagueLabel, "\") {"),
                 paste0("\tidAttackHome = R.array.lambda_attack_home_", leagueLabel, ";"),
                 paste0("\tidAttackAway = R.array.lambda_attack_away_", leagueLabel, ";"),
                 paste0("\tidDefenceHome = R.array.lambda_defence_home_", leagueLabel, ";"),
                 paste0("\tidDefenceAway = R.array.lambda_defence_away_", leagueLabel, ";"),
                 paste0("\tidLeagueName = R.string.", leagueLabel, ";"),
                 paste0("\tsetSpinnerTeamAdapters(R.array.team_names_", leagueLabel, ");")), fileConn)
  }
}

close(fileConn)