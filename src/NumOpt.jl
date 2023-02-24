module NumOpt
using LinearAlgebra

export gradient_descent, backtracking_ls

include("firstorder.jl")
include("linesearch.jl")

end # module
