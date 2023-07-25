function marginalloglikelihood(α; x̄ = x̄, y = y, σ = σ, r = r)

    σᵦ = 10.0 # controls Gaussian prior of intercept

    N = length(x̄)

    𝟏 = ones(N)

    R = Diagonal(r.^2)

    logpdf(MvNormal(α * x̄, σ^2*I + R + σᵦ^2*(𝟏*𝟏')), y)

end


function marginalloglikelihood(α, β; x̄ = x̄, y = y, σ = σ, r = r)

    R = Diagonal(r.^2)

    logpdf(MvNormal(α * x̄ .+ β, σ^2*I + R), y)

end