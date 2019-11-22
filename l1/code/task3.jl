# author: Paweł Wilkosz

delta = 2.0^(-52)
println(bitstring(1+delta))
println(bitstring(1+3*delta))
println(bitstring(1+4*delta))

delta = 2.0^(-51)
println(bitstring(2+delta))
println(bitstring(2+3*delta))
println(bitstring(2+4*delta))

delta = 2.0^(-53)
println(bitstring(0.5+delta))
println(bitstring(0.5+3*delta))
println(bitstring(0.5+4*delta))