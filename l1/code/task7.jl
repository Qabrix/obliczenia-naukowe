# author: Paweł Wilkosz

# calculate approximate value of derivative of given function
function approx_derivative(func, point, precision)
  return (func(point + precision) - func(point)) / precision
end

# examined function
function f(x)
  return sin(x) + cos(3*x)
end

# actual derivative of examined function
function f_derivative(x)
  return cos(x) - 3*sin(3*x)
end

# exact derivative in point 1.0
der = f_derivative(Float64(1))
for i = 0:54
  # approximate value of derivative in point 1.0
  appr = approx_derivative(f, Float64(1), Float64(2)^(-i))
  println("\$2^{$(-i)}\$ & $(appr) & $(abs(der-appr)) \\\\")
end
  
