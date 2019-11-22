# author: Paweł Wilkosz

# check if x * 1/x == 1
function is_reversible(number::Float64)
  return number * (1 /number) == 1
end

# find smallest numver from [1,2] for which is_reversible returns false
function find_irreversible()
  number = one(Float64)
  
  while is_reversible(number) && number < 2.0
    number = nextfloat(number)
  end

  return number
end

println(find_irreversible())