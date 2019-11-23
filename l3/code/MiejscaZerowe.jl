# Paweł Wilkosz
"""
Moduł zawiera funkcje do obliczania miejsc zerowych przy używciu różnych metod.
"""
module MiejscaZerowe

using Test

"""
Opis:
Funkcja oblicza pierwiastki funkcji używając metody bisekcji.
Dane:
f – funkcja f(x) zadana jako anonimowa funkcja,
a,b – końce przedziału poczatkowego
delta,epsilon – dokładności obliczeń,
Wyniki:
(r,v,it,err) – czwórka, gdzie
r – przybliżenie pierwiastka równania f(x) = 0,
v – wartość f(r)
it – liczba wykonanych iteracji,
err – sygnalizacja błędu
    0 - metoda zbieżna
    1 - funkcja nie zmienia znaku w przedziale [a,b]
"""
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
  u = f(a)
  v = f(b)
  e = b-a

  if sign(u) == sign(v)
    return (0, 0, 0, 1)
  end

  k = 1
  while true
    e = e/2
    c = a+e
    w = f(c)

    if abs(e) < delta || abs(w) < epsilon
      return (c, w, k, 0)
    end

    if sign(w) != sign(u)
      b = c
      v = w
    else
      a = c
      u = w
    end

    k += 1
  end
end

"""
Opis:
Funkcja oblicza pierwiastki funkcji używając metody stycznych.
Dane:
f – funkcja f(x) zadana jako anonimowa funkcja,
x0,x1 – przybliżenia początkowe,
delta,epsilon – dokładności obliczeń,
maxit – maksymalna dopuszczalna liczba iteracji,
Wyniki:
(r,v,it,err) – czwórka, gdzie
r – przybliżenie pierwiastka równania f(x) = 0,
v – wartość f(r)
it – liczba wykonanych iteracji,
err – sygnalizacja błędu
    0 - metoda zbieżna
    1 - nie osiągnięto wymaganej dokładności w maxit iteracji
    2 - pochodna bliska zeru
"""
function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  v = f(x0)
  if abs(v) < epsilon
    return (x0, v, 0, 0)
  end

  for k in 1:maxit
    if abs(pf(x0)) < epsilon
      return (0, 0, k, 2)
    end
    x1 = x0 - v/pf(x0)
    v = f(x1)

    if abs(x1-x0) < delta || abs(v) < epsilon
      return (x1, v, k, 0)
    end

    x0 = x1
  end
  return (0, 0, 0, 1)
end

"""
Opis:
Funkcja oblicza pierwiastki funkcji używając metody siecznych.
Dane:
f – funkcja f(x) zadana jako anonimowa funkcja,
x0,x1 – przybliżenia początkowe,
delta,epsilon – dokładności obliczeń,
maxit – maksymalna dopuszczalna liczba iteracji,
Wyniki:
(r,v,it,err) – czwórka, gdzie
r – przybliżenie pierwiastka równania f(x) = 0,
v – wartość f(r)
it – liczba wykonanych iteracji,
err – sygnalizacja błędu
    0 - metoda zbieżna
    1 - nie osiągnięto wymaganej dokładności w maxit iteracji
"""
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  a = x0
  b = x1
  fa = f(a)
  fb = f(b)
  for k in 1:maxit
    if abs(fa) > abs(fb)
      tmp = a
      a = b
      b = tmp

      tmp = fa
      fa = fb
      fb = tmp
    end

    s = (b-a) / (fb-fa)
    b = a
    fb = fa
    a = a - fa*s
    fa = f(a)
    
    if abs(b-a) < delta || abs(fa) < epsilon
      return (a, fa, k, 0)
    end
  end

  return (0, 0, 0, 1)
end

export mbisekcji, mstycznych, msiecznych
end