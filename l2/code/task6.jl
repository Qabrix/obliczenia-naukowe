# Paweł Wilkosz
using Plots

#calculate given sequence
function calculate(xstart, cstart, repetitions=40)
  x = Float64(xstart)
  c = Float64(cstart)

  result = zeros(Float64, 0)
  append!(result, x)

  for i in 1:repetitions
    x = x^2 + c
    append!(result, x)
  end

  return result
end


results = [
  calculate(1, -2),
  calculate(2, -2),
  calculate(1.999999999999999, -2),
  calculate(1, -1),
  calculate(-1, -1),
  calculate(0.75, -1),
  calculate(0.25, -1)
]

pyplot()
for i in 1:length(results)
  scatter(1:40, results[i], title="Ciąg $(i)", label="x_n")
  savefig("img/t6plots/$(i).png")
end

