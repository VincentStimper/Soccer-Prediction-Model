# Model of the Soccer Prediction app
The app returns the expected result (rounded) and the probability of each possible outcome given the guess of the user, the certainty of his/her guess and the results of the Bundesliga matches of the season 2010/11 until 2016/17. Let <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/44bc9d542a92714cac84e01cbbb7fd61.svg?invert_in_darkmode" align=middle width=8.656725pt height=14.10255pt/> be the number of goals of the home team <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/7651ba0e8e29ee7537841a819041a172.svg?invert_in_darkmode" align=middle width=13.07658pt height=22.38192pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/4bdc8d9bcfb35e1c9bfb51fc69687dfc.svg?invert_in_darkmode" align=middle width=7.0284885pt height=22.74591pt/> the number of goals of the guest <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/99fe4d8255dd7318412c8dbe107b71ce.svg?invert_in_darkmode" align=middle width=11.25465pt height=22.38192pt/>. As underlying probability distribution I assumed
<p align="center"><img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/98e591f792a40902cbb0deaaffdb78c0.svg?invert_in_darkmode" align=middle width=386.42175pt height=16.376943pt/></p>
Here, <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/1089ce9f91be656058881fa378146418.svg?invert_in_darkmode" align=middle width=21.27312pt height=22.38192pt/> is the probability measure of the model and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/03ff87536ac281d41daa5ee38826c5d8.svg?invert_in_darkmode" align=middle width=17.7474pt height=22.38192pt/> that one of the users guess. We assume conditional independence of <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/44bc9d542a92714cac84e01cbbb7fd61.svg?invert_in_darkmode" align=middle width=8.656725pt height=14.10255pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/4bdc8d9bcfb35e1c9bfb51fc69687dfc.svg?invert_in_darkmode" align=middle width=7.0284885pt height=22.74591pt/> given <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/7651ba0e8e29ee7537841a819041a172.svg?invert_in_darkmode" align=middle width=13.07658pt height=22.38192pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/99fe4d8255dd7318412c8dbe107b71ce.svg?invert_in_darkmode" align=middle width=11.25465pt height=22.38192pt/>, i.e. <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/203c1809ebe89c02cea8da2ecdf5283c.svg?invert_in_darkmode" align=middle width=273.661245pt height=24.56553pt/> and <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/6e58c28e1b1d858914b4f9b77946c5c7.svg?invert_in_darkmode" align=middle width=263.043495pt height=24.56553pt/>.
To model the users guess it is convenient to choose a dirac distribution, i.e. if the user guesses <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/7651ba0e8e29ee7537841a819041a172.svg?invert_in_darkmode" align=middle width=13.07658pt height=22.38192pt/> to score <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/63bb9849783d01d91403bc9a5fea12a2.svg?invert_in_darkmode" align=middle width=9.041505pt height=22.74591pt/> goals against <img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/99fe4d8255dd7318412c8dbe107b71ce.svg?invert_in_darkmode" align=middle width=11.25465pt height=22.38192pt/>
<p align="center"><img src="https://rawgit.com/VincentStimper/Soccer-Prediction-Model/master/svgs/23be10da4dd630f3e1c886b4119f1e3b.svg?invert_in_darkmode" align=middle width=277.9458pt height=29.478735pt/></p>
and so on.
