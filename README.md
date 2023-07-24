# LinearRegressionInputUncetainty

[![Build Status](https://github.com/ngiann/LinearRegressionInputUncetainty.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ngiann/LinearRegressionInputUncetainty.jl/actions/workflows/CI.yml?query=branch%3Amain)


# Example:

```
using Plots, LinearRegressionInputUncetainty, StatsFuns # load packages and code

x̄, y, σ, ρ = simulatemeasurements(); # generate toy data

scatter(x̄, y, aspect_ratio=:equal, title="data")

m(α) =  marginalloglikelihood(α ; x̄ = x̄, y = y, σ = σ, ρ = ρ) # auxiliary function

αrange = -5:0.001:20

logprob = m.(αrange)

prob = exp.(logprob .- logsumexp(logprob))

plot(αrange, prob, title="posterior of slope α")

```