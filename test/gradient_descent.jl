# using PyPlot
include("test_functions.jl")

α_list = []
gf_list = []
function mon(a, gf)
    push!(α_list, a)
    push!(gf_list, norm(gf))
end
n = 4

a = randn(n)
f(x) = sum((x .- a) .^ 4)
∇f(x) = 4 .* ((x .- a) .^ 3)

x0 = randn(n)

α = 0.1
ϵ = 1e-7
xopt = gradient_descent(f, ∇f, x0, ϵ)
xopt_banana = gradient_descent(banana, banana_grad, [10.0;10.0], ϵ, monitor=mon)

pygui(true)
plt.figure()
plt.plot(α_list)
plt.title("Stepsize vs Iteration")
plt.xlabel("Iteration")
plt.ylabel("Stepsize")
plt.grid(true)

plt.figure()
plt.plot(gf_list)
plt.yscale("log")
plt.title("Gradient Norm vs Iteration")
plt.xlabel("Iteration")
plt.ylabel("Gradient Norm")
plt.grid(true)

plt.show()

tol = 1e-2
@testset "Gradient Descent" begin
    @test norm(xopt .- a) ≤ tol
    @test norm(xopt_banana .- [1.0;1.0]) ≤ tol
end