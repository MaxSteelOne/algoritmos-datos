{- Ejercicio 1
problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
}
1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las 
    componen (sin importar el orden)son iguales.

    pa ejemplos:
    [("maxi","juan"),("maxi","pedro"),("nahuel","maxi"),("nahuel","juan"),("maxi","zoro"),("juan","luffy")]
-}
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs)
    | comparaElemn x && xs == [] = True
    | relValAUX (x:xs) = relacionesValidas xs
    | otherwise        = False

relValAUX::[(String,String)] -> Bool
relValAUX (x:xs)
    | comparaElemn x && xs == []                    = True
    | comparaElemn x && distintasDuplas x (head xs)   = relValAUX (x:(tail  xs))
    | otherwise                                     = False

comparaElemn::(String,String)->Bool
comparaElemn (a,b) = a/=b

distintasDuplas::(String,String)->(String,String)->Bool
distintasDuplas (a,b) (c,d) = (a,b) /= (c,d) && (a,b) /= (d,c)

{- Ejercicio 2
problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
}
-}

pertenece::(Eq t)=>t->[t]->Bool
pertenece _ [] = False
pertenece y (x:xs)
    | y==x = True
    | otherwise = pertenece y xs

hayRepetidos::(Eq t)=>[t]->Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    | pertenece x xs = True
    | otherwise      =  hayRepetidos xs

quitar::(Eq t)=>t->[t]->[t]
quitar _ [] = []
quitar elem (x:xs)
    | elem == x  = xs
    | otherwise  = x:(quitar elem xs)

quitarTodos::(Eq t)=>t->[t]->[t]
quitarTodos _ [] = []
quitarTodos elem lista
    | pertenece elem lista = quitarTodos elem (quitar elem lista)
    | otherwise            = lista

quitarRep::(Eq t)=>[t]->[t]
quitarRep [] = []
quitarRep (x:xs)
    | hayRepetidos (x:xs) = x:(quitarRep(quitarTodos x xs))
    | otherwise           = (x:xs)

extraer::[(String,String)]->[String]
extraer [] = []
extraer (x:xs) = fst x : snd x : (extraer xs)

personas::[(String,String)]->[String]
personas [] = []
personas list = quitarRep(extraer(list))

{- Ejercicio 3
problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
}
-}

limpiar::[String]->[String]
limpiar [] = []
limpiar (x:xs)
    | x/=""     = x:(limpiar xs)
    | otherwise = limpiar xs
 
estaContenido::String->(String,String)->Bool
estaContenido x (a,b) = x==a || x==b 

noIdentico::String->(String,String)->String
noIdentico x (a,b)
    | x==a      = b
    | otherwise = a

combinacion::String->(String,String)->String
combinacion x (a,b)
    | estaContenido x (a,b) = noIdentico x (a,b)
    | otherwise             = ""

amigosDe::String->[(String,String)]->[String]
amigosDe _ [] = []
amigosDe persona ((x,y):xs) = limpiar(combinacion persona (x,y):(amigosDe persona xs))

{- Ejercicio 4
problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
}-}

cantApariciones::(Eq t)=>t->[t]->Int
cantApariciones t [] = 0
cantApariciones elem (x:xs)
    | elem==x   = 1 + cantApariciones elem xs
    | otherwise = cantApariciones elem xs

duoElementoApariciones::String->[String]->(String,Int)
duoElementoApariciones elem ls = (elem, cantApariciones elem ls)

listaDeDuplas::[String]->[(String,Int)]
listaDeDuplas [] = [("Nadie",0)]
listaDeDuplas (x:xs) = [duoElementoApariciones x (x:xs)]++listaDeDuplas (quitarTodos x (x:xs))
 
mayorCantElem::[(String,Int)]->String
mayorCantElem (x:xs)
    | xs == []               = fst x
    | snd x >= snd (head xs) = mayorCantElem (x:(tail xs))
    | otherwise              = mayorCantElem xs

personaConMasAmigos::[(String,String)]->String
personaConMasAmigos lista = mayorCantElem(listaDeDuplas(extraer lista))