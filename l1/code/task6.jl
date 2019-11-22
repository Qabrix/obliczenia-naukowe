# author: Paweł Wilkosz

# examined function
function f(x::Float64)
  return sqrt(x^2+1)-1
end

# examined function but converted
function g(x::Float64)
  return x^2/(sqrt(x^2+1)+1)
end

for i = -1:-1:-10
  println("\$8^{$(i)}\$ & $(f(8.0^i)) & $(g(8.0^i)) \\")
end