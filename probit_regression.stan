
// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;
  int<lower=0,upper=1> y[N];
  vector[N] x;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real beta0;
  real beta1;
}

transformed parameters {
  real<lower = 0, upper = 1> p[N];
  for (i in 1:N) {
    p[i] = Phi(beta0 + beta1 * x[i]);
  }
}


// The model to be estimated. 
model {
  for (i in 1:N){
    y[i] ~ bernoulli(p[i]);
  }
}

