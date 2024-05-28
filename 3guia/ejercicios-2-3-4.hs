-- EJERCICIO 2

{-
problema absoluto(x:Z):N{
    requiere:{true}
    asegura:{res>= 0}
    asegura:{res es (en matematicas) el valor absoluto de x}
}
-}

absoluto :: Integer -> Integer
absoluto x | x>=0 = x
           | otherwise = x*(-1)

{-
problema maximoAbsoluto(x:Z,y:Z):N {
    requiere:{True}
    asegura: {res es el mayor o igual entre x & y }
}
-}

maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y | absoluto x >= absoluto y = x
                   | otherwise = y

{-
maximo3: devuelve el m´aximo entre tres n´umeros enteros.

problema maximo3(x,y,z :Z):Z{
    requiere:{True}
    asegura:{res >= x o res >=y o res >=z}
}
-}

maximo3 :: Int -> Int ->Int -> Int
maximo3 x y z | x>=y && x>=z = x
              | y>=x && y>=z = y
              | otherwise = z
              
{-
 algunoEs0: dados dos n´umeros racionales, decide si alguno de los dos es igual a 0
-}

algunoEs0::Int->Int->Bool
algunoEs0 0 x= True
algunoEs0 y 0= True
algunoEs0 a b = False 

algunoEs0v2 a b | a==0 || b==0 = True
                | otherwise = False

{-
mismoIntervalo: dados dos n´umeros reales, indica si est´an relacionados considerando la relaci´on de equivalencia en R
cuyas clases de equivalencia son: (−∞, 3],(3, 7] y (7, ∞), o dicho de otra forma, si pertenecen al mismo intervalo.

problema mismoIntervalo(x,y:Real):Real{
    requiere:{True}
    asegura:{xRy y yRx; en otras palabras ambos pertenecen al mimso intervalo}
}

-}

mismoIntervalo:: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True
                   | x>3 && y>3 && x <=7 && y <=7 = True
                   | x>7 && y>7 = True
                   | otherwise = False

{-
sumaDistintos: dados 3 numeros, sumar los 3 numeros que sean distintos

problema sumaDistintos(x:Real,y:Real,z:Real): Real{
    requiere:{True}
    asegura:{res = x+y+z en caso de que x,y,z sean distintos}
    asegura:{res= x+y o res=x+z o res=y+z en caso de haber un numero repetido}
    asegura:{res=x o res=y o res=z en caso de haber dos repetidos}
}
-}
comparaNum :: Int -> Int -> Bool
comparaNum a b = a/=b

sumaDistintos:: Int -> Int -> Int -> Int
sumaDistintos x y z
    | x/=y && x/=z && y/=z = x+y+z
    | x==y && y/=z = x + z
    | x==z && y/=x = x + y
    | y==z && x/=z = x + z 
    |otherwise = x

{-
esMultiploDe: dados dos n´umeros naturales, decidir si el primero es m´ultiplo del segundo
problema esMultiploDe (a:N,b:n): Bool{
    requiere:{True}
    asegura:{a = b*k con k perteneciente a N}
}
-}
esMultiploDe::Int->Int->Bool
esMultiploDe x y = mod x y == 0 

{-
digitoUnidades: dado un n´umero entero, extrae su d´ıgito de las unidades.
problema digitoUnidades(a:Z):Z{
    requiere:{True}
    asegura:{res pertenece a los numeros enteros}
    asegura:{a - res va a ser un numero con decimales}
}
-}
digitoUnidades::Int -> Int
digitoUnidades x = mod x 10

digitoDecenas::Int->Int
digitoDecenas x = mod x 100

-- PUNTO 3
{-
problema estanRelacionados (a:Z, b:Z) : Bool {
    requiere: {a ̸= 0 ∧ b ̸= 0}
    asegura: {(res = true) ↔ a ∗ a + a ∗ b ∗ k = 0 para alg´un k ∈ Z con k ̸= 0)}
}
-}

estanRelacionados::Int->Int->Bool
estanRelacionados x y | (mod x y ==0) = True
                      | x == 0 && y==0 = False
                      | otherwise = False

-- PUNTO 4
{-
prodInt: calcula el producto interno entre dos tuplas R × R
problema prodInt(t1:(RxR),t2:(RxR)):(RxR){
    requiere:{True}
    asegura:{res= suma componente a componente de los parametros de entrada}
}
-}

prodInt::(Int,Int)->(Int,Int)->(Int,Int)
prodInt (a1,a2) (b1,b2) = (a1+b1,a2+b2)

{-
todoMenor: dadas dos tuplas R×R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada
correspondiente de la segunda tupla

problema todoMenor:(t1:(R,R),t2:(R,R)):Bool{
    requiere:{True}
    asegura:{res=True en caso de que cada elemento de t1 sea mayor a los de t2}
    asegura:{res=False en caso de que cada elemento de t1 NO sea mayor a los de t2}  
}
-}

todoMenor::(Int,Int)->(Int,Int)->Bool
todoMenor (x1,x2) (y1,y2) = x1>y1 && x2>y2

distanciaPuntos::(Int,Int)->(Int,Int)->(Int,Int)
distanciaPuntos (a1,b1) (a2,b2) = (a2-a1,b2-b1) 

{-
sumarSoloMultiplos: dada una terna de n´umeros enteros y un natural, calcula la suma de los elementos de la terna que
son m´ultiplos del n´umero natural.

problema sumarSoloMultiplos ((a:Z,b:Z,c:Z),d:Z): Z {
    requiere:{d =/= 0}
    asegura={res es la suma de los aquellos numeros que sean multiplos de d}
}
-}

sumarSoloMultiplos:: (Int,Int,Int) -> Int -> Int

sumarSoloMultiplos (a,b,c) d | esMultiploDe a d && esMultiploDe b d && esMultiploDe c d = a+b+c
                             | esMultiploDe a d && esMultiploDe b d = a+b
                             | esMultiploDe a d && esMultiploDe c d = a+c
                             | esMultiploDe b d && esMultiploDe c d = b+c
                             | esMultiploDe a d = a
                             | esMultiploDe b d = b
                             | esMultiploDe c d = c
                             |otherwise = (-9999999999)
                             
{-
 posPrimerPar: dada una terna de enteros, devuelve la posici´on del primer n´umero par si es que hay alguno, y devuelve
4 si son todos impares

problema posPrimerPar:( (Z,Z,Z)): Z{
    requiere:{True}
    asegura:{res va a ser la poscion del primer numero par de la terna}
}
-}

posPrimerPar::(Int,Int,Int)->Int

posPrimerPar (a,b,c) | mod a 2 == 0 = 0
                     | mod b 2 == 0 = 1
                     | mod b 2 == 0 = 2
                     |otherwise = 4

{-
invertir :: (a, b) ->(b, a): invierte los elementos del par pasado como par´ametro (debe funcionar para elementos
de cualquier tipo).
-}

invertir::Ord a=> (a,a) -> (a,a)
invertir (x,y) = (y,x)