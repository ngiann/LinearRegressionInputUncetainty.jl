function marginalloglikelihood(α; x̄ = x̄, y = y, σ = σ, r = r)

    σᵦ = 100.0 # controls Gaussian prior of intercept

    N = length(x̄)

    𝟏 = ones(N)

    R = Diagonal(r.^2)

    logpdf(MvNormal(α * x̄, σ^2*I + R + σᵦ^2*(𝟏*𝟏')), y)

end