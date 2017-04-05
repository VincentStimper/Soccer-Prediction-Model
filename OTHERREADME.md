# Model of the Soccer Prediction app
The app returns the expected result (rounded) and the probability of each possible outcome given the guess of the user, the certainty of his/her guess and the results of the Bundesliga matches of the seasons 2010/11 until 2016/17. Let $a$ be the number of goals of the home team $\mathcal{A}$ and $b$ the number of goals of the guest $\mathcal{B}$. As underlying probability distribution I assumed
$$P(a,b\mid\mathcal{A},\mathcal{B})=P_{\text{m}}(a,b\mid\mathcal{A},\mathcal{B})(1-p_{\text{c}})+P_\text{u}(a,b\mid\mathcal{A},\mathcal{B})p_{\text{c}}.$$
Here, $P_{\text{m}}$ is the probability measure of the model, $P_{\text{u}}$ that one of the users guess and $p_\text{c}$ is the certainty of the users guess. We assume conditional independence of $a$ and $b$ given $\mathcal{A}$ and $\mathcal{B}$, i.e. $P_\text{m}(a,b\mid\mathcal{A},\mathcal{B})=P_\text{m}(a\mid\mathcal{A},\mathcal{B})P_\text{m}(b\mid\mathcal{A},\mathcal{B})$ and $P_\text{u}(a,b\mid\mathcal{A},\mathcal{B})=P_\text{u}(a\mid\mathcal{A},\mathcal{B})P_\text{u}(b\mid\mathcal{A},\mathcal{B})$.
To model the users guess it is convenient to choose a dirac distribution, i.e. if the user guesses $\mathcal{A}$ to score $k$ goals against $\mathcal{B}$
$$
P_\text{u}(a\mid\mathcal{A},\mathcal{B})=\delta_k(a)=\begin{cases}1 & $\text{if $a=k$}\\ 0 & \text{if $a\neq k$}\end{cases},
$$
and so on.
To model the data I assumed the goals to by Poisson distributed, i.e.
$$
P_\text{m}(a=n\mid\mathcal{A},\mathcal{B})=e^{-\mu_{\mathcal{A},\mathcal{B}}}\frac{\mu_{\mathcal{A},\mathcal{B}}^n}{n!},
$$
and so on. This is reasonable since the number of occurences of events happening with a constant rate $\mu$ are Poisson distributed. The model coefficients $\mu_{\mathcal{A},\mathcal{B}}$ are obtained by a generalized linear model using the team and the opponent as features. Each match is weighted by $e^{-\lambda t}$ where $t$ is the time when the match happend and $\lambda$ a constant. This constant is obtained by trying different values and choosing the one with the highest accuracy on a test set.
