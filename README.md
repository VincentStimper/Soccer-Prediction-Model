# Model of the Soccer Prediction app
The app returns the expected result (rounded) and the probability of each possible outcome given the guess of the user, the certainty of his/her guess and the results of the Bundesliga matches of the seasons 2010/11 until 2016/17. Let <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/44bc9d542a92714cac84e01cbbb7fd61.svg?invert_in_darkmode" align=middle width=8.656725pt height=14.10255pt/> be the number of goals of the home team <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/7651ba0e8e29ee7537841a819041a172.svg?invert_in_darkmode" align=middle width=13.07658pt height=22.38192pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/4bdc8d9bcfb35e1c9bfb51fc69687dfc.svg?invert_in_darkmode" align=middle width=7.0284885pt height=22.74591pt/> the number of goals of the guest <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/99fe4d8255dd7318412c8dbe107b71ce.svg?invert_in_darkmode" align=middle width=11.25465pt height=22.38192pt/>. As underlying probability distribution I assumed
<p align="center"><img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/e8dad6a341f59f791a3f2907de136bc0.svg?invert_in_darkmode" align=middle width=413.81835pt height=16.376943pt/></p>
Here, <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/2ef64c697e99180e2608a32c50efab8d.svg?invert_in_darkmode" align=middle width=21.27312pt height=22.38192pt/> is the probability measure of the model, <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/6fc16cb6c5b0ef4d46f024b56abfab6a.svg?invert_in_darkmode" align=middle width=17.7474pt height=22.38192pt/> that one of the users guess and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/b96b689f8337de769135aa4f07d55c50.svg?invert_in_darkmode" align=middle width=14.06262pt height=14.10255pt/> is the certainty of the users guess. We assume conditional independence of <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/44bc9d542a92714cac84e01cbbb7fd61.svg?invert_in_darkmode" align=middle width=8.656725pt height=14.10255pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/4bdc8d9bcfb35e1c9bfb51fc69687dfc.svg?invert_in_darkmode" align=middle width=7.0284885pt height=22.74591pt/> given <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/7651ba0e8e29ee7537841a819041a172.svg?invert_in_darkmode" align=middle width=13.07658pt height=22.38192pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/99fe4d8255dd7318412c8dbe107b71ce.svg?invert_in_darkmode" align=middle width=11.25465pt height=22.38192pt/>, i.e. <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/b76a9062c98dc8c1d58bc9c55479b743.svg?invert_in_darkmode" align=middle width=301.057845pt height=24.56553pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/95676fad9e478ec31ff5126c60c4842b.svg?invert_in_darkmode" align=middle width=290.440095pt height=24.56553pt/>.
To model the users guess it is convenient to choose a dirac distribution, i.e. if the user guesses <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/7651ba0e8e29ee7537841a819041a172.svg?invert_in_darkmode" align=middle width=13.07658pt height=22.38192pt/> to score <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/63bb9849783d01d91403bc9a5fea12a2.svg?invert_in_darkmode" align=middle width=9.041505pt height=22.74591pt/> goals against <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/99fe4d8255dd7318412c8dbe107b71ce.svg?invert_in_darkmode" align=middle width=11.25465pt height=22.38192pt/>
<p align="center"><img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/59f9bae98a258c5e7938a2dcfa0b25ab.svg?invert_in_darkmode" align=middle width=267.7059pt height=49.13139pt/></p>
and so on.
To model the data I assumed the goals to by Poisson distributed, i.e.
<p align="center"><img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/a66117b55d94e2b70833d74f9a33b1db.svg?invert_in_darkmode" align=middle width=233.18625pt height=35.353065pt/></p>
and so on. This is reasonable since the number of occurences of events happening with a constant rate <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/07617f9d8fe48b4a7b3f523d6730eef0.svg?invert_in_darkmode" align=middle width=9.86799pt height=14.10255pt/> are Poisson distributed. The model coefficients <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/295a6a5911d5b6e9997be384a7ff05e4.svg?invert_in_darkmode" align=middle width=33.195195pt height=14.10255pt/> are obtained by a generalized linear model using the team and the opponent as features. Each match is weighted by <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/f3598c9e1381cc2ddc5c41650074edf7.svg?invert_in_darkmode" align=middle width=30.57615pt height=27.85299pt/> where <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/4f4f4e395762a3af4575de74c019ebb5.svg?invert_in_darkmode" align=middle width=5.913963pt height=20.1465pt/> is the time when the match happend and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/fd8be73b54f5436a5cd2e73ba9b6bfa9.svg?invert_in_darkmode" align=middle width=9.553335pt height=22.74591pt/> a constant. This constant is obtained by trying different values and choosing the one with the highest accuracy on a test set.
