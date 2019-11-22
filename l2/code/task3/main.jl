# Paweł Wilkosz

include("hilb.jl")
include("matcond.jl")

function calc_error(matrix, x, size, given_cond = "")
  b = matrix * x
  gauss_result = matrix \ b
  inv_result = inv(matrix) * b

  gauss_error = norm(gauss_result - x) / norm(x)
  inv_error = norm(inv_result - x) / norm(x)

  println("$size $(given_cond) & $(cond(matrix)) & $(rank(matrix)) & $(gauss_error) & $(inv_error)\\\\")
end


println("Hilbert matrix:")
for size in 1:20
  matrix = hilb(size)
  x = ones(Float64, size);
  calc_error(matrix, x, size)
end

println("\n\nRandom Matrix\n")
sizes = [5, 10, 20]
conds = [1.0, 10.0, 10^3, 10^7, 10^12, 10^16]
for size in sizes
  for cond in conds
    x = ones(Float64, size);
    matrix = matcond(size, cond)
    calc_error(matrix, x, size, "& $(cond)")
  end
end
