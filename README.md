# LinearRegressionInputUncetainty

[![Build Status](https://github.com/ngiann/LinearRegressionInputUncetainty.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ngiann/LinearRegressionInputUncetainty.jl/actions/workflows/CI.yml?query=branch%3Amain)


# Example:

```
using Plots, LinearRegressionInputUncetainty, StatsFuns # load packages and code

let 

    x̄, y, σ, r = simulatemeasurements(σ = 0.5, r₀ = 0.5); # generate toy data
    
    scatter(x̄, y, title="data")

    m(α) =  marginalloglikelihood(α; x̄ = x̄, y = y, σ = σ, r = r) # auxiliary function

    αrange = -7:0.01:7

    logprob = m.(αrange)

    prob = exp.(logprob .- logsumexp(logprob))

    plot(αrange, prob, ticks = -7:1:7)
    
end


let 

    x̄, y, σ, r = simulatemeasurements(σ = 0.5, r₀ = 2.5); # generate toy data
    
    scatter(x̄, y, title="data")

    m(α, β) = marginalloglikelihood(α, β; x̄ = x̄, y = y, σ = σ, r = r)

    αrange = -7:0.01:7
    βrange = -7:0.01:7

    logprob = map(x -> m(x[1], x[2]), Iterators.product(αrange, βrange))'
    prob    = exp.(logprob .- logsumexp(logprob))

    contour(αrange, βrange, prob, xticks=-7:1:7, yticks=-7:1:7) # plot target

end
```