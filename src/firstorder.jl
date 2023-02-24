function gradient_descent(f::Function,∇f::Function,x0,ϵ::Float64)
    xk = deepcopy(x0)
    while norm(∇f(xk)) ≥ ϵ
        ∇fk = ∇f(xk)
        pk = - ∇fk
        α = backtracking_ls(f, xk, ∇fk, pk)
        xk .= xk .+ α .* pk
    end
    return xk
end