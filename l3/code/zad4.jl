# Paweł Wilkosz
include("./MiejscaZerowe.jl")
using .MiejscaZerowe

f(x::Float64) = sin(x) - (x/2.0)^2.0
fp(x::Float64) = cos(x) - x/2.0

println(mbisekcji(f, 1.5, 2.0, 10^(-5)/2, 10^(-5)/2))
println(mstycznych(f, fp,  1.5, 10^(-5)/2, 10^(-5)/2, 50))
println(msiecznych(f, 1.0, 2.0, 10^(-5)/2, 10^(-5)/2, 50))