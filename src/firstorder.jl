function gradient_descent(x0,∇f::Function,α,ϵ)
    xk = similar(x0)
    xkp1 = similar(x0) .+ 100 
    while norm(xkp1 .- xk) ≥ ϵ
        xkp1 .= xk .- α .* ∇f(xk)
        xk .= xkp1
    end
    return xkp1
end