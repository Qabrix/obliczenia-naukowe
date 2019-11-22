# Paweł Wilkosz

# calculate given function
function calculate(startp, r, repetitions, type=Float32)
  p = type(startp)
  for i in 1:repetitions
    p = p + type(r)*p*(type(1)-p)
  end 
  return p
end

# cut number  to n numbers after comma
function cut(number, n)
  m = 10^n
  return floor(m*number)/m
end


# 1
print("Float32 (bez obcięcia) & ")
print(calculate(0.01, 3, 40))
println("\\\\")

print("Float32 (z obcięciem) & ")
print(calculate(cut(calculate(0.01, 3, 10), 3), 3, 30))
println("\\\\")

# 2
print("Float64 & ")
print(calculate(0.01, 3, 40, Float64))
println("\\\\")

