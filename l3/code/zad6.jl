# Paweł Wilkosz
include("./MiejscaZerowe.jl")
using .MiejscaZerowe

f1(x::Float64) = exp(1-x) - 1
f1p(x::Float64) = -exp(1-x)
f2(x::Float64) = x*exp(-x)
f2p(x::Float64) = -(x-1)*exp(-x)

epsilon = 10^(-5)
delta = 10^(-5)

println(mbisekcji(f1, 0.0, 10.0, delta, epsilon))
println(mstycznych(f1, f1p, 0.0, delta, epsilon, 100))
println(msiecznych(f1, 0.0, 0.1, delta, epsilon, 100))


println(mbisekcji(f2, -1.0, 1.0, delta, epsilon))
println(mstycznych(f2, f2p, -1.0, delta, epsilon, 100))
println(msiecznych(f2, -1.0, -0.5, delta, epsilon, 100))


println(mstycznych(f1, f1p, 50.0, delta, epsilon, 100))
println(mstycznych(f2, f2p, 50.0, delta, epsilon, 100))
println(mstycznych(f2, f2p, 1.0, delta, epsilon, 100))
