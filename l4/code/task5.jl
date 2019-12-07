# Paweł Wilkosz
include("./Interpolacje.jl")
using .Interpolacje

ns = [5, 10, 15]

foreach(n -> rysujNnfx(x -> exp(x), 0.0, 1.0, n, "5a_$(n)"), ns)
foreach(n -> rysujNnfx(x -> x^2 * sin(x), -1.0, 1.0, n, "5b_$(n)"), ns)