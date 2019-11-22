# Paweł Wilkosz

using Polynomials

p1 = [1, -210.0, 20615.0, -1256850.0,
    53327946.0, -1672280820.0, 40171771630.0, -756111184500.0,
    11310276995381.0, -135585182899530.0, 1307535010540395.0,
    -10142299865511450.0, 63030812099294896.0, -311333643161390640.0,
    1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0,
    -12870931245150988800.0, 13803759753640704000.0, -8752948036761600000.0,
    2432902008176640000.0]

p2 = [1, -210.0-(1.0/(2.0^23)), 20615.0, -1256850.0,
    53327946.0, -1672280820.0, 40171771630.0, -756111184500.0,
    11310276995381.0, -135585182899530.0, 1307535010540395.0,
    -10142299865511450.0, 63030812099294896.0, -311333643161390640.0,
    1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0,
    -12870931245150988800.0, 13803759753640704000.0, -8752948036761600000.0,
    2432902008176640000.0]


function calc_polynomial(p)
    normal_poly = Poly(p[end:-1:1])
    roots_poly = poly(1.0:20.0)
    calculated_roots = roots(normal_poly)

    for i in 1:20
      normal_form_value = abs(polyval(normal_poly, calculated_roots[i]))
      roots_form_value = abs(polyval(roots_poly, calculated_roots[i]))
      error = abs(calculated_roots[i] - i)

      print(calculated_roots[i])
      print(" & ")
      print(i)
      print(" & ")
      print(normal_form_value)
      print(" & ")
      print(roots_form_value)
      print(" & ")
      print(error)
      println("\\\\")
    end
end

println("Wilkinson's polynomial")
calc_polynomial(p1)

println("Wilkinson's polynomial with small change")
calc_polynomial(p2)