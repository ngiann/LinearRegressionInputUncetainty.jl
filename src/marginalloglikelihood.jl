function marginalloglikelihood(α ; x̄ = x̄, y = y, σ = σ, ρ = ρ)

    σᵦ = 10.0 # controls Gaussian prior of intercept

    N = length(x̄)

    logℓ = 0.0

    for n in 1:N

        logℓ += logpdf(Normal(α * x̄[n], sqrt(σ^2 + ρ[n]^2 + σᵦ^2) ), y[n]) # sqrt because Normal requires std

    end

    logℓ

end