# Model of the Soccer Prediction app
The app returns the expected result (rounded) and the probability of each possible outcome given the guess of the user, the certainty of his/her guess and the results of the Bundesliga matches of the season 2010/11 until 2016/17. Let $a$ be the number of goals of the home team $\mathcal{A}$ and $b$ the number of goals of the guest $\mathcal{B}$. As underlying probability distribution I assumed
$$
P(a,b|\mathcal{A},\mathcal{B})=P_\text{m}(a,b|\mathcal{A},\mathcal{B})(1-p_\text{c})+P_\text{u}(a,b|\mathcal{A},\mathcal{B})p_\text{c}.
$$
Here, $P_\text{m}$ is the probability measure of the model and $P_\text{u}$ that one of the users guess. We assume conditional independence of $a$ and $b$ given $\mathcal{A}$ and $\mathcal{B}$, i.e. $P_\text{m}(a,b|\mathcal{A},\mathcal{B})=P_\text{m}(a|\mathcal{A},\mathcal{B})P_\text{m}(b|\mathcal{A},\mathcal{B})$ and $P_\text{u}(a,b|\mathcal{A},\mathcal{B})=P_\text{u}(a|\mathcal{A},\mathcal{B})P_\text{u}(b|\mathcal{A},\mathcal{B})$.
To model the users guess it is convenient to choose a dirac distribution, i.e. if the user guesses $\mathcal{A}$ to score $k$ goals against $\mathcal{B}$
$$
P(a|\mathcal{A},\mathcal{B})=\delta_k(a)=\begin{cases}1$\text{if }a=k\ 0&\text{if }a\neqk\end{cases},
$$
and so on.
