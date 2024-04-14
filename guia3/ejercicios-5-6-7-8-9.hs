{-
problema todosMenores (t : Z × Z × Z) : Bool {
requiere: {True}
asegura: {(res = true) si y solo si ((f(t0) > g(t0)) ∧ (f(t1) > g(t1)) ∧ (f(t2) > g(t2)))}
}

problema f (n: Z) : Z {
requiere: {True}
asegura: {(n ≤ 7 → res = n^2) ∧ (n > 7 → res = 2n − 1)}
}
problema g (n: Z) : Z {
requiere: {True}
asegura: {Si n es un n´umero par, entonces res = n/2, en caso contrario, res = 3n + 1}
}
-}

todosMenores::(Int,Int,Int)->Bool
todosMenores (a,b,c) | (f a) > (g a) && (f b) > (g b) && (f c) > (g c) = True
                     | otherwise = False

g::Int->Int
g x | mod x 2 == 0 = div x 2
    | otherwise = 3*x + 1

f::Int->Int
f x | x<=7 = x^2
    | otherwise = 2*x -1 

{-
Programar una funci´on 
bisiesto :: Integer ->Bool seg´un la siguiente especificaci´on:
problema bisiesto (YEAR: Z) : Bool {
requiere: {True}
asegura: {res = False si y solo si YEAR no es multiplo de 4 o YEAR es multiplo de 100 pero no de 400}
}
-}

bisiesto::Integer->Bool
bisiesto x | mod x 4 /= 0 = False 
           | (mod x 100 == 0 && mod x 400 /= 0) = False
           | otherwise = True

{-

problema distanciaManhattan (p : R × R × R, q : R × R × R) : R {
requiere: {T rue}
asegura: {res = Sumatoria desde i=0 a 2 para |p(i) - q(i)|
-}

thrd::(Float,Float,Float) -> Float
thrd (_,_,c) = c

distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float

distanciaManhattan (x,y,z) (a,b,c) = abs (x-a) + abs (y-b) + abs (z-c)

{-
problema sumaUltimosDosDigitos (x: Z) : Z {
requiere: {True}
asegura: {res = (|x| mod 10) + (⌊(|x|/10)⌋ mod 10)}
}
-}

sumaUltimosDosDigitos::Int->Int
sumaUltimosDosDigitos x = mod (abs x) 10 + mod (div (abs x) 10) 10

{-
problema comparar (a:Z, b:Z) : Z {
requiere: {True}
asegura: {(res = 1 ↔ sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b))}
asegura: {(res = −1 ↔ sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b))}
asegura: {(res = 0 ↔ sumaUltimosDosDigitos(a) = sumaUltimosDosDigitos(b))}
}
-}

comparar::Int->Int->Int
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
             | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = (-1)
             | otherwise = 0