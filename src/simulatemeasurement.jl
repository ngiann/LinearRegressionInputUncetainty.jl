function simulatemeasurements(; σ = 0.5, r₀ = 0.5, seed = 1)

    rg = MersenneTwister(seed) # fix random number generator

    # parameters of underlying idealised data source
    N = 10
    α = 2.0 # slope
    β = 1.0 # intercept
    r = r₀*ones(N) # measurement errors

    # simulate latent (not observed!) values

    xclean = rand(rg, Uniform(-3, 3), N)

    yclean = α.*xclean .+ β


    # simulate observed values

    x̄ = xclean + randn(rg, length(xclean)) .* r

    y = yclean + randn(rg, length(yclean)) * σ

  
    return x̄, y, σ, r

end