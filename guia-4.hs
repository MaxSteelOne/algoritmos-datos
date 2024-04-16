{-ejercicio 1-}
fibonacci::Int-> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x-1) + fibonacci (x-2)

{-Ejercicio 2
problema parteEntera (x: R) : Z {
    requiere: { True }
    asegura: { resultado ≤ x < resultado + 1 
}
-}
parteEntera::Float-> Int
parteEntera x =  round x

{-esto no sigue la logica, no trates de entenderlo. Disfrutalo-}
parteEntera2::Float->Int
parteEntera2 x | x>=0 && x<1 = 0
               | x>=1 = parteEntera2 (x-1) + 1
               | x>(-1) && x<0 = -1 
               | otherwise = parteEntera2 (x+1) - 1 
{-Ejercicio 3
Especificar e implementar la funcion esDivisible :: Integer ->Integer ->Bool que dados dos n´umeros
naturales determinar si el primero es divisible por el segundo. No est´a permitido utilizar las funciones mod ni div.

Especifiacar despues ZZZ-}

{-Ejercicio 7
Ejercicio 7. Implementar la funci´on todosDigitosIguales :: Integer ->Bool que determina si todos los d´ıgitos de un
n´umero natural son iguales, es decir:
problema todosDigitosIguales (n: Z) : B {
requiere: { n > 0 }
asegura: { resultado = true ↔ todos los d´ıgitos de n son iguales }
-}

ultimoDig::Int-> Int
ultimoDig x = mod x 10

sacarUltDig::Int->Int
sacarUltDig x = div x 10

todosDigitosIguales:: Int -> Bool
todosDigitosIguales x  | x<10 = True
                       | otherwise = ultimoDig x == ultimoDig (sacarUltDig x) && todosDigitosIguales (sacarUltDig x)
 {-falta chequear lo parte posterior del &&-}

 {-Ejercicio 8
 
 problema iesimoDigito (n: Z, i: N) : Z {
requiere: { n ≥ 0 ∧ 1 ≤ i ≤ cantDigitos(n) }
asegura: { resultado = ( n div 10 up (cantDigitos(n)−i) ) mod 10 }
}

problema cantDigitos (n: Z) : N {
requiere: { n ≥ 0 }
asegura: { n = 0 → resultado = 1}
asegura: { n/= 0 → (n div 10 up (res-1) > 0 ∧ n div 10 up (resultado) = 0) }
}
-}

cantDigitos::Int->Int
cantDigitos x | x<10 = 1
              | otherwise =  cantDigitos(sacarUltDig x) + 1

iesimoDigito::Int->Int->Int
iesimoDigito n i | i==cantDigitos n = ultimoDig n 
                 | otherwise = iesimoDigito (sacarUltDig n) i
