WDLClassifier <- function(goalA, goalB) {
  # Classifies whether a game is a Win, Draw, or Loss
  res <- rep(NA, length(goalA))
  ind <- setdiff(1 : length(goalA), union(which(is.na(goalA)), which(is.na(goalB))))
  res[ind] <- ifelse(goalA[ind] == goalB[ind], "Draw", res[ind])
  res[ind] <- ifelse(goalA[ind] > goalB[ind], "Win", res[ind])
  res[ind] <- ifelse(goalA[ind] < goalB[ind], "Loss", res[ind])
  return(res)
}