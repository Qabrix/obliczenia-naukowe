# Paweł Wilkosz
include("./Interpolacje.jl")
using .Interpolacje
using Test

# Tests for zad1
x1 = [3.0, 1.0, 5.0, 6.0]
f1 = [1.0, -3.0, 2.0, 4.0]

x2 = [-1.0, 0.0, 1.0, 2.0, 3.0]
f2 = [2.0, 1.0, 2.0, -7.0, 10.0]

@testset "Test ilorazów różnicowych" begin
    @test isapprox(ilorazyRoznicowe(x1, f1), [1.0, 2.0, -3.0/8.0, 7.0/40.0])
    @test isapprox(ilorazyRoznicowe(x2, f2), [2.0, -1.0, 1.0, -2.0, 2.0])
end

fx2 = ilorazyRoznicowe(x2, f2)

@testset "Test warNewton" begin
    @test isapprox(warNewton(x2, fx2, 2.0), -7.0)
    @test isapprox(warNewton(x2, fx2, 10.0), 13961.0)
    @test isapprox(warNewton(x2, fx2, 5.0), 506.0)
    @test isapprox(warNewton(x2, fx2, -3.0), 298.0)
end

@testset "Test naturalna" begin
    @test isapprox(naturalna(x2, fx2), [1.0, 6.0, -1.0, -6.0, 2.0])
end