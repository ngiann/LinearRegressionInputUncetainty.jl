function simulatemanymeasurements(; seed = 1)

    rg = MersenneTwister(seed) # fix random number generator

    # parameters of underlying idealised data source
    
    α = 2.0 # slope
    β = 1.0 # intercept
    σ = 0.2 # observation noise
    ρ = 0.2 # measurement error

    # simulate latent (not observed!) values

    xclean = rand(rg, 10000)*3.5

    yclean = α.*xclean .+ β


    # simulate observed values

    x̄ = xclean + randn(rg, length(xclean)) * ρ

    y = yclean + randn(rg, length(yclean)) * σ

  
    return x̄, y, σ, ρ * ones(length(x̄))

end