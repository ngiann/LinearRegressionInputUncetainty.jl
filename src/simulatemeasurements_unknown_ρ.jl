function simulatemeasurements_unknown_r(; N = 10, seed = 1, num_measurements = 3)
    
    # same as simulatemeasurements but know we do not know that measurement error
    
    rg = MersenneTwister(seed) # fix random number generator

    # parameters of underlying idealised data source
    
    α  = 2.0 # slope
    β  = 1.0 # intercept
    σ  = 0.1 # observation noise
    r₀ = 0.1 # measurement error

    # simulate latent (not observed!) values

    xclean = rand(rg, Uniform(0, 3), N)

    yclean = α.*xclean .+ β


    # simulate observed values, make multiple measurements 

    samples = [xclean + randn(rg, length(xclean)) * r₀ for _ in 1:num_measurements]

    x̄ = mean(samples)

    r = std(samples)

    y = yclean + randn(rg, length(yclean)) * σ

  
    return x̄, y, σ, r

end