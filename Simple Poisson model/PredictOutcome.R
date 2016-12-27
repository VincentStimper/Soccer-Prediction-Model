PredictOutcome <- function(teamA, teamB, modelCoef) {
  # Returns vector with Win, Draw or Loss prediction for the match of teamA and teamB
  res <- NULL
  resPoss <- c("Win", "Draw", "Loss")
  for (i in seq(teamA)) {
    attackA <- modelCoef[which(names(modelCoef) == paste0("attack", teamA[i]))]
    attackB <- modelCoef[which(names(modelCoef) == paste0("attack", teamB[i]))]
    defendA <- modelCoef[which(names(modelCoef) == paste0("defend", teamA[i]))]
    defendB <- modelCoef[which(names(modelCoef) == paste0("defend", teamB[i]))]
    g <- expand.grid(g1 = 0 : 15, g2 = 0 : 15)
    g$p <- dpois(g$g1, attackA * defendB) * dpois(g$g2, attackB * defendA)
    pGes <- sum(g$p)
    pWin <- sum(g$p[g$g1 > g$g2]) / pGes
    pLoss <- sum(g$p[g$g1 < g$g2]) / pGes
    pRes <- c(pWin, 1 - pWin - pLoss, pLoss)
    res <- c(res, resPoss[which.max(pRes)])
  }
  return(res)
}