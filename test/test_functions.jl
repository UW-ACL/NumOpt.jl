function banana(x)
    return (1.0 - x[1]) ^ 2 + 100.0 * (x[2] - x[1]^2)^2
end
function banana_grad(x)
    return [-400.0*(x[2]-x[1]^2)*x[1] - 2.0*(1-x[1]);
            200.0*(x[2]-x[1]^2)]
end