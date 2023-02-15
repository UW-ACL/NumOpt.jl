using NumOpt, LinearAlgebra

n = 4

a = randn(n)

f(x) = (x .- a) .^ 4
∇f(x) = 4 .* ((x .- a) .^ 3)

x0 = randn(n)

α = 0.1
ϵ = 1e-5
xopt = gradient_descent(x0,∇f,α,ϵ)