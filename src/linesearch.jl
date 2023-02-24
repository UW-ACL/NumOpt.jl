function backtracking_ls(f::Function, xk, ∇fk, pk, ρ=0.9, c=0.1)
    α = 1
    while (f(xk .+ α*pk) > f(xk) + c*α*dot(∇fk, pk))
        α = ρ*α;
    end
    return α
end