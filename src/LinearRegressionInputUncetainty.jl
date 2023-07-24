module LinearRegressionInputUncetainty

    using LinearRegression, Random, Distributions, Plots

    include("simulatemeasurement.jl")
    include("simulatemeasurements_unknown_ρ.jl")
    include("simulatemanymeasurements.jl")
    include("marginalloglikelihood.jl")

    export simulatemeasurements, simulatemeasurements_unknown_ρ, simulatemanymeasurements
    export marginalloglikelihood

end
