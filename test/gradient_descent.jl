n = 4

a = randn(n)
f(x) = sum((x .- a) .^ 4)
∇f(x) = 4 .* ((x .- a) .^ 3)

x0 = randn(n)

α = 0.1
ϵ = 1e-9
xopt = gradient_descent(x0,∇f,α,ϵ)

tol = 1e-2
@testset "Gradient Descent" begin
    @test norm(xopt .- a) ≤ tol
end