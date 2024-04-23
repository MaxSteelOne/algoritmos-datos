{-ejercicio 1-}
fibonacci::Int-> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x-1) + fibonacci (x-2)

{-ejericio 2
parteEntera(x:R):Z{
    requiere:{True}
    asegura:{res <= x < res + 1}
}
-}
parteEntera::Float->Int
parteEntera x | x>=0 && x<1 = 0
              | x >= 1 = 1 + parteEntera (x-1)
              | x<0 && x>(-1) = -1
              | x<(-1) = -1 + parteEntera (x+1)
 
{-Ejercicio 3
Especificar e implementar la funcion esDivisible :: Integer ->Integer ->Bool que dados dos numeros
naturales determinar si el primero es divisible por el segundo. No est´a permitido utilizar las funciones mod ni div.

problema esDiv (x:Int, y:Int): Bool {
    req:{True}
    asegura:{x = y * K con k perteneciente a Int}
}
-}

esDivisible::Int->Int->Bool
esDivisible x y | x == y = True
                | x < y  = False 
                | otherwise = esDivisible (x-y) y

{-Ejercicio4 
Especificar e implementar la funci´on sumaImpares :: Integer ->Integer que dado n ∈ N sume los primeros
n n´umeros impares. Por ejemplo: sumaImpares 3 ❀ 1+3+5 ⇝ 9-

problema sumaImpares(x:Z):Z{
    req:{True}
    asegura:{res = sumatoria de k=1 hasta n de 2k-1}
    }
-}

sumaImpares::Int->Int
sumaImpares x | x==1 = 1
              | otherwise = 2*x - 1 + sumaImpares (x-1)

{-Ejercicio 5-}
medioFact::Int->Int
medioFact x | x==0 || x==1 = 1 
            | otherwise  = x * medioFact (x-2)

{-Ejercicio 6
Especificar e implementar la funci´on sumaDigitos :: Integer ->Integer que calcula la suma de d´ıgitos de
un n´umero natural. Para esta funci´on pueden utilizar div y mod
-}
ultimoDig:: Int -> Int
ultimoDig x = mod x 10

sacarUltDig::Int->Int
sacarUltDig x = div x 10

sumaDigitos::Int-> Int
sumaDigitos x | x<=10 = x
              | otherwise = ultimoDig x + sumaDigitos (sacarUltDig x)

{-Ejercicio 7
Implementar la funcion todosDigitosIguales :: Integer ->Bool que determina si todos los d´ıgitos de un
numero natural son iguales, es decir:

problema todosDigitosIguales (n: Z) : B {
requiere: { n > 0 }
asegura: { resultado = true ↔ todos los d´ıgitos de n son iguales }
}
-}

todosDigitosIguales::Int->Bool
todosDigitosIguales x | x<10 = True
                      | otherwise = ultimoDig x == ultimoDig (sacarUltDig x) && todosDigitosIguales (sacarUltDig x)

{-Ejercicio 8
Implementar la funcion iesimoDigito :: Integer ->Integer -> Integer que dado un n ∈ Z mayor o igual a 0
y un i ∈ Z mayor o igual a 1 menor o igual a la cantidad de dıgitos de n, devuelve el i-esimo dıgito de n.

problema iesimoDigito (n: Z, i: Z) : Z {
    requiere: { n >= 0 ∧ 1 <= i <= cantDigitos(n) }
    asegura: { resultado = mod (div (n  10^cantDigitos(n)−i) 10) }
}

problema cantDigitos (n: Z) : N {
    requiere: { n >= 0 }
    asegura: { n = 0 → resultado = 1}
    asegura: { n ̸= 0 → (div (n 10^resultado−1) > 0 ∧ div (n 10^resultado = 0)) }
}
-}

cantDigitos::Int->Int
cantDigitos x | x < 10  && x>=0 =1
              | x < 0 = cantDigitos (x*(-1))
              | otherwise = 1 + cantDigitos( sacarUltDig x)

iesimoDigito::Int -> Int ->Int
iesimoDigito x posX= mod (div x (10^(cantDigitos x - posX))) 10

{-Ejercicio 9
problema capicua(x:Z):Bool{
    req:{True}
    asegurar:{res= res invertido}
    }
-}

primerDigito::Int->Int
primerDigito x = div x (10^(cantDigitos x -1))

sacarPrimerDig::Int->Int
sacarPrimerDig x | x<10 = x
                 | otherwise = mod x (10^ ((cantDigitos x)-1))

sinPriNiUlt::Int->Int
sinPriNiUlt x = sacarPrimerDig(sacarUltDig x)

{-
capicua::Int->Bool
capicua x | x<10 && x>=0 = True
          | x<0 = capicua( x*(-1))
          | mod x 2 == 0 = primerDigito x == ultimoDig x && capicua (sinPriNiUlt x)
-}

{-Ejercicio 10-}

f1::Int->Int
f1 x | x==0 = 1
     | otherwise = 2^x + f1(x-1)
          
f2::Float->Int->Float
f2 base expo | expo==1 = base
             | otherwise = base^expo + f2 base (expo-1)

f3::Float->Int->Float
f3 base expo | expo==1 = base
             | otherwise = base^(expo*2) + f2 base ((2*expo) - 1)

{-Ejercicio 11-}

factorial::Float->Float
factorial x | x==0 = 1
            | otherwise = x* factorial (x-1)

eeAprox::Float->Float
eeAprox x | x==0 = 1
          | otherwise= 1/(factorial x) + eeAprox (x-1)

{-Ejercicio 12-}

sqrt2Aux::Int->Float
sqrt2Aux x | x==1 = 2
           | otherwise = 2 + 1/(sqrt2Aux (x-1))

raiz2Aprox::Int->Float
raiz2Aprox x = sqrt2Aux x -1

{-Ejercicio 13-}

sumatoria:: Int -> Int -> Int
sumatoria base expo | expo == 1 = base
                    | otherwise = base^expo + sumatoria base (expo-1)

sumatoriaDoble:: Int -> Int -> Int
sumatoriaDoble base expo | base == 1 = sumatoria base expo
                         | otherwise = sumatoria base expo + sumatoriaDoble (base-1) (expo) 

{-Ejercicio 14-}

mayorQue::Int->Int->Int
mayorQue x y | x>=y = x 
             | otherwise = y

menorQue::Int->Int->Int
menorQue x y | x<=y = x
             | otherwise = y

sumaPotencias::Int->Int->Int->Int
sumaPotencias q x y | x+y==2 = q^2
                    | otherwise = q^(x+y) + sumaPotencias q ((mayorQue x y) -1) (menorQue x y)

{-Ejercicio 15-}

auxSumRac::Int->Int->Float
auxSumRac p q | q==1 = fromIntegral p
              | otherwise = fromIntegral p / fromIntegral q + auxSumRac p (q-1)

sumaRacionales::Int->Int->Float
sumaRacionales p q | p==1 = auxSumRac p q
                   | otherwise = auxSumRac p q + sumaRacionales (p-1) q

{-Ejercicio 16-}

auxMenDiv::Int->Int->Int
auxMenDiv x y | mod x y == 0 = y
              | x==1         = 1
              | otherwise    = auxMenDiv x (y+1)

menorDiv::Int->Int
menorDiv x = auxMenDiv x 2


esPrimo::Int->Bool
esPrimo x | x==1            = False
          | menorDiv x == x = True
          | otherwise       = False

auxSonCop::Int->Int->Int->Bool
auxSonCop x y z | mod x z == 0 && mod y z == 0 = False
                | x <= z || y <= z             = True
                | otherwise                    = auxSonCop x y (z+1)

sonCoprimos::Int->Int->Bool
sonCoprimos x y = auxSonCop x y 2

{-Ejercicio 17-}

esFibo::Int->Bool
esFibo x = auxEsFibonacci x 1

auxEsFibonacci::Int->Int->Bool
auxEsFibonacci x y | x == fibonacci y = True
                   | x < fibonacci y  = False
                   | otherwise        = auxEsFibonacci x (y+1)

{-Ejercicio 18-}

esPar::Int->Bool
esPar x = mod x 2 == 0

mayorDigitoPar::Int->Int
mayorDigitoPar x = auxMDPar x (-1)

auxMDPar::Int->Int->Int
auxMDPar x mayorValor | x == 0                                         = mayorValor
                      | esPar(ultimoDig x) && ultimoDig x > mayorValor = auxMDPar (sacarUltDig x) (ultimoDig x)
                      | otherwise                                      = auxMDPar (sacarUltDig x) mayorValor
{-lo de hoy-}
{-2.1-}
pertenece:: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x      = True
                   | otherwise   = pertenece n xs

{-2.4-}
hayRepetidos:: (Eq t) => [t] -> Bool
hayRepetidos (x:xs) | xs == [] = False
                    | pertenece x xs = True
                    | otherwise      = hayRepetidos xs

{-2.5-}
quitar::(Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar q (x:xs) | q==x = xs
                | otherwise = x: quitar q xs

{-3.3-}

maximo::(Ord t) => [t] -> t
maximo [x] = x
maximo (x:y:xs) | x > y =   maximo (x:xs)
                | otherwise = maximo (y:xs)


{-3.9-}
ordenar::(Ord t) => [t] -> [t]
ordenar xs | xs == [] = []
           | otherwise = ordenar( quitar (maximo xs) xs) ++ [maximo xs]
