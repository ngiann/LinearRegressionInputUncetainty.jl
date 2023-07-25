module LinearRegressionInputUncetainty

    using LinearRegression, Random, Distributions, Plots, QuadGK, LinearAlgebra

    include("simulatemeasurement.jl")
    include("simulatemeasurements_unknown_ρ.jl")
    include("marginalloglikelihood.jl")

    include("testintegral.jl")
    export testintegral

    export simulatemeasurements, simulatemeasurements_unknown_ρ
    export marginalloglikelihood, marginalloglikelihood_usual

end
