# author: Paweł Wilkosz

# test data
x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

# sum all products in standard order
function frontmultiplication(vec1, vec2, type=Float64)
  result = zero(type)
  for i = 1:length(vec1)
    result += type(vec1[i] * vec2[i])
  end
  return result
end

# sum all products in reversed order
function backmultiplication(vec1, vec2, type=Float64)
  result = zero(type)
  for i = length(vec1):-1:1
    result += type(vec1[i] * vec2[i])
  end
  return result
end

# sum all products from the furthest to zero to the closest
function bigtosmallmultiplication(vec1, vec2, type=Float64)
  positives = zeros(type, 0)
  negatives = zeros(type, 0)

  for i = 1:length(vec1)
    calc = vec1[i] * vec2[i]
    if calc > 0
      append!(positives, calc)
    else
      append!(negatives, calc)
    end
  end

  return sum(sort(positives, rev=true)) + sum(sort(negatives))
end

# sum all products from the closest to zero to the furthest
function smalltobigmultiplication(vec1, vec2, type=Float64)
  positives = zeros(type, 0)
  negatives = zeros(type, 0)

  for i = 1:length(vec1)
    calc = vec1[i] * vec2[i]
    if calc > 0
      append!(positives, calc)
    else
      append!(negatives, calc)
    end
  end

  return sum(sort(negatives, rev=true)) + sum(sort(positives))
end


println(frontmultiplication(x, y, Float32))
println(backmultiplication(x, y, Float32))
println(bigtosmallmultiplication(x, y, Float32))
println(smalltobigmultiplication(x, y, Float32))

println(frontmultiplication(x, y))
println(backmultiplication(x, y))
println(bigtosmallmultiplication(x, y))
println(smalltobigmultiplication(x, y))
