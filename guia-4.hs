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

sumatoria:: Int -> Int -> Int
sumatoria base expo | expo == 1 = base
                    | otherwise = base^expo + sumatoria base (expo-1)

sumatoriaDoble:: Int -> Int -> Int
sumatoriaDoble base expo | base == 1 = sumatoria base expo
                         | otherwise = sumatoria base expo + sumatoriaDoble (base-1) (expo) 

{-
Ejercicio 16. Recordemos que un entero p > 1 es primo si y solo si no existe un entero k tal que 1 < k < p y k divida a p.
a) Implementar menorDivisor :: Integer ->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado
como parametro.

b) Implementar la funcion esPrimo :: Integer ->Bool que indica si un numero natural pasado como parametro es primo.

c) Implementar la funcion sonCoprimos :: Integer ->Integer ->Bool que dados dos numeros naturales indica si no
tienen algun divisor en comun mayor estricto que 1.

d) Implementar la funcion nEsimoPrimo :: Integer ->Integer que devuelve el n-esimo primo (n ≥ 1). Recordar que el
primer primo es el 2, el segundo es el 3, el tercero es el 5, etc
-}
 
menorDivisor::Int-> Int
menorDivisor x = menorDivDesde 2 x
 
menorDivDesde :: Int -> Int -> Int
menorDivDesde n m | mod m n == 0 = n
                  | otherwise = menorDivDesde (n+1) m

{-posible prueba-}
esPrimo :: Int -> Bool
esPrimo x | menorDivisor x == x && x>= 1 = True
          | otherwise = False

sonCoprimos :: Int -> Int -> Bool 
sonCoprimos x y | (menorDivDesde 2 x) /= (menorDivDesde 2 y) = True
                | otherwise = False

nEsimoPrimo :: Int -> Int
nEsimoPrimo x | x==1 = 2
              |

