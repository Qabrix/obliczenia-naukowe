# author: Paweł Wilkosz

# types to check parameters for
types = [Float16, Float32, Float64]

# find macheps iteratively
function itereps(type)
  current_num = one(type)

  while (one(type) + current_num / 2) > one(type)
    current_num /= 2
  end

  return current_num
end

# find number eta iteratively
function itereta(type)
  current_num = one(type)

  while current_num / 2 > zero(type)
    current_num /= 2
  end

  return current_num
end

# find maximum number of given type
function itermax(type)
   current_num = prevfloat(one(type))

   while !isinf(current_num * 2)
    current_num *= 2
   end

   return current_num
end

# find macheps using kahan's method
function kahaneps(type)
  return type(3) * (type(4) / type(3) - type(1)) - type(1)
end

println("eps")
foreach(type -> println(type, " & ", eps(type)), types)

println("itereps")
foreach(type -> println(type, " & ", itereps(type)), types)

println("itereta")
foreach(type -> println(type, " & ", itereta(type)), types)

println("floatmin")
foreach(type -> println(type, " & ", floatmin(type), " \\\\"), types)

println("itermax")
foreach(type -> println(type, " & ", itermax(type), " & ", floatmax(type), " \\\\"), types)

println("kahaneps")
foreach(type -> println(type, " & ", kahaneps(type)), types)
