-- Ej 1.1
{-
longitud::(Eq t)=> [t] -> Int
longitud xs = auxLong 0 xs

auxLong::(Eq t)=>Int->[t]->Int
auxLong num lista 
    | lista == [] = num
    | otherwise   = auxLong (num+1) (tail lista)
-}

longitud2::[t]->Int
longitud2 [] = 0
longitud2 (x:xs) = 1 + longitud2 xs

-- Ej 1.2
ultimo::[t]->t
ultimo (x:xs)
    | longitud2 (x:xs) == 1 = x
    | otherwise             = ultimo xs

-- Ej 1.3 Dada una lista, devuelve toda la lista sin el final
principio::[t]->[t]
principio (x:xs)
    | longitud2 (x:xs) == 1 = []
    | otherwise             = x:(principio xs)

-- Ej 1.4
reverso::[t]->[t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

-- Ej 2.1
pertenece::(Eq t)=> t -> [t] -> Bool
pertenece _ [] = False
pertenece elem (x:xs)
    | elem==x        = True
    | otherwise      = pertenece elem xs

-- Ej 2.2
todosIguales::(Eq t)=>[t]->Bool
todosIguales [] = False
todosIguales [_] = True
todosIguales (x:y:xs)
    | x==y && xs == [] = True
    | x/=y             = False
    | otherwise        = todosIguales (x:xs)

-- Ej 2.3 
{-problema todosDistintos([t]):Bool{
   req:{True}
   asegura:{res=true (si y solo si) NO existen dos elementos con los mimsmos valores en [t]} 
}-}
-- OTRA FORMA
{-
pero no cubre ciertos casos :p
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs) | pertenece x xs = False
                      | otherwise = todosDistintos xs
-}


todosDistintos::(Eq t)=>[t]->Bool
todosDistintos [] = False
todosDistintos [_] = True
todosDistintos (x:y:xs)
    | auxTD (x:y:xs) = todosDistintos (y:xs)
    | otherwise      = False
    
auxTD::(Eq t)=>[t]->Bool
auxTD (x:y:xs)
    | x/=y && xs == [] = True
    | x==y             = False
    | otherwise        = auxTD (x:xs)

-- Ej 2.4
hayRepetidos::(Eq t)=>[t]->Bool
hayRepetidos [] = False
hayRepetidos [_] = False
hayRepetidos (x:xs)
    | pertenece x (xs) = True
    | otherwise = hayRepetidos xs

-- Ej 2.5
quitar::(Eq t)=>t->[t]->[t]
quitar _ [] = []
quitar elem (x:xs)
    | elem == x = xs
    | otherwise = x: (quitar elem xs)

-- Ej 2.6
quitarTodos::(Eq t)=>t->[t]->[t]
quitarTodos _ [] = []
quitarTodos elem xs
    | pertenece elem xs = quitarTodos elem (quitar elem xs)
    | otherwise         = xs

-- Ej 2.7
eliminarRepetidos::(Eq t)=>[t]->[t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs)
    | hayRepetidos (x:xs) == True = x: (eliminarRepetidos (quitarTodos x xs))
    | otherwise                   = (x:xs)

-- Ej 2.8
mismosElementos::(Eq t)=>[t]->[t]->Bool
mismosElementos [] [] = True
mismosElementos [_] [] = False
mismosElementos [] [_] = False
mismosElementos (x:xs) ys
    | auxME (x:xs) ys = auxME ys (x:xs)
    | otherwise = False


auxME::(Eq t)=>[t]->[t]->Bool
auxME (x:xs) ys
    | pertenece x ys && xs==[] = True
    | pertenece x ys           = auxME (xs) ys
    | otherwise                = False

-- Ej 2.9
capicua::(Eq t)=>[t]->Bool
capicua xs = xs == reverso xs

-- Ej 3.1
sumatoria::[Int]->Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- Ej 3.2
productoria::[Int]->Int
productoria [] = 1
productoria (x:xs) = x * (productoria xs)

-- Ej 3.3
maximo::[Int]->Int
maximo [x] = x
maximo (x:y:xs)
    | x>=y      = maximo (x:xs)
    | otherwise = maximo (y:xs)

-- Ej 3.4
sumarN::Int->[Int]->[Int]
sumarN _ [] = []
sumarN n (x:xs) = (n+x):(sumarN n xs) 

-- Ej 3.5
sumarPrimero::[Int]->[Int]
sumarPrimero (x:xs) = sumarN x (x:xs)

-- Ej 3.6
sumarUltimo::[Int]->[Int]
sumarUltimo [] = []
sumarUltimo xs = sumarN (ultimo xs) xs

-- Ej 3.7
esPar::Int->Bool
esPar x = mod x 2 == 0

pares::[Int]->[Int]
pares [] = []
pares (x:xs)
    | esPar x    = x:(pares xs)
    | otherwise  = pares xs

-- Ej 3.8
multiplosDeN::Int->[Int]->[Int]
multiplosDeN _ [] = []
multiplosDeN 0 xs = xs
multiplosDeN n (x:xs)
    | mod x n ==0 = x: (multiplosDeN n xs)
    | otherwise   = multiplosDeN n xs

-- Ej 3.9
ordenar::[Int]->[Int]
ordenar [] = []
ordenar xs =  ordenar (quitar(maximo xs) xs) ++ [maximo xs]

-- Ej 4.1
sacarBlancos::[Char]->[Char]
sacarBlancos [] = []
sacarBlancos [x] = [x]
sacarBlancos (x:y:xs)
    | x==' ' && y==' '         = x:(sacarBlancos xs)
    | otherwise                = x:(sacarBlancos (y:xs))

-- Ej 4.2
-- ['h','a','b','i','a',' ','u','n','a',' ','v','e','z']
scPrincipio::[Char]->[Char]
scPrincipio (x:xs)
    | x==' '    = xs
    | otherwise = x:xs

scFinal::[Char]->[Char]
scFinal xs = reverso(scPrincipio(reverso xs))

cleanString::[Char]->[Char]
cleanString xs = scPrincipio(scFinal(sacarBlancos(xs)))

contarBlancos::[Char]->Int
contarBlancos [] = 0
contarBlancos (x:xs)
    | x==' ' = 1 + contarBlancos xs
    | otherwise = contarBlancos xs

hayBlancos::[Char]->Bool
hayBlancos (x:xs)
    | x== ' '     = True
    | xs== []     = False
    | otherwise   = hayBlancos xs

contarPalabras::[Char]->Int
contarPalabras [] = 0
contarPalabras xs
    | hayBlancos xs == False = 1
    | otherwise = 1 +  contarBlancos (cleanString xs)

-- Ej 4.3
aux::[Char]->[Char]
aux [] = []
aux (x:xs)
    | x/=' '    = [x]:[aux xs]
    | otherwise = aux xs

-- Ej 5.1
sumarAcumulado::(Num t)=>[t]->[t]
sumarAcumulado [] = []
sumarAcumulado [x] = [x]
sumarAcumulado (x:xs)