## Make code fragment


# Set directory, load source files
setwd(dirname(sys.frame(1)$ofile))

countries <- NULL
countries$label <- c("bel", "eng", "fra", "ger", "ita", "net", "por", "sco", "spa")
countries$numLeagues <- c(1, 4, 2, 2, 2, 1, 1, 4, 2)

close(file("Code/menu.xml", open = "w"))
fileConn <- file("Code/menu.xml", open = "a")

for (i in seq(countries$label)) {
  writeLines(c(paste0("<item android:title=\"@string/", countries$label[i],"\">"), "\t<menu>"), fileConn)
  for (j in seq(countries$numLeagues[i])) {
    leagueLabel <- paste0(countries$label[i], toString(j))
    writeLines(c("\t\t<item", paste0("\t\t\tandroid:id=\"@+id/nav_", leagueLabel, "\""), 
                 paste0("\t\t\tandroid:title=\"@string/", leagueLabel, "\" />")), fileConn)
  }
  writeLines(c("\t</menu>", "</item>", ""), fileConn)
}

close(fileConn)