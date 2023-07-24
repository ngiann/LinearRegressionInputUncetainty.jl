# same as simulatemeasurements but know we do not know that measurement error
function simulatemeasurements_unknown_ρ(; seed = 1, attempts = 3)

    rg = MersenneTwister(seed) # fix random number generator

    # parameters of underlying idealised data source
    
    α = 2.0 # slope
    β = 1.0 # intercept
    σ = 0.2 # observation noise
    ρ₀ = 0.2 # measurement error

    # simulate latent (not observed!) values

    xclean = [0.3; 0.5; 0.9; 1.1; 1.7; 2.5]

    yclean = α.*xclean .+ β


    # simulate observed values, make multiple measurements 

    samples = [xclean + randn(rg, length(xclean)) * ρ₀ for _ in 1:attempts]

    x̄ = mean(samples)

    ρ = std(samples)

    y = yclean + randn(rg, length(yclean)) * σ

  
    return x̄, y, σ, ρ

end