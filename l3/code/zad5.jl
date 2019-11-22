# Paweł Wilkosz
include("./MiejscaZerowe.jl")
using .MiejscaZerowe

f(x::Float64) = 3*x - exp(x)

println(mbisekcji(f, 0.0, 1.0, 10^(-4), 10^(-4)))
println(mbisekcji(f, 1.1, 5.0, 10^(-4), 10^(-4)))