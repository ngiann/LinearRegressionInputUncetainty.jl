function testintegral()

    rg = MersenneTwister(1)
    D = 3
    x = randn(rg, D)
    y = randn(rg, D)
    σ = 1.1
    σb = 0.75

    prior_b = Normal(0, σb)


    function f(x) 
        
       local h(b) = pdf(MvNormal(x + ones(D)*b, σ), y) * pdf(prior_b, b)
    
       quadgk(h, -13.0, 13.0)[1]

    end


    𝟏 = ones(D)

    g(x) = pdf(MvNormal(x, σ^2*I + (𝟏*𝟏')*σb^2), y)

    h(x) = pdf(MvNormal(x, (σ^2+σb^2)*Matrix(I, D, D)) , y)

    
    f, g, h
end