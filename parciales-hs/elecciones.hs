{- Ejercicio 2
Formulas Inválidas [3 puntos]
    problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {
    requiere: {True}
    asegura: {(res = true) <=> formulas contiene un candidato se propone 
    para presidente y vicepresidente en la misma fórmula; o algún candidato se postula para presidente o vice 
    en más de una fórmula }
-}

extraer::[(String,String)]->[String]
extraer [] =[]
extraer (x:xs) = fst x : snd x : (extraer xs)

pertenece::String->[String]->Bool
pertenece _ [] = False
pertenece nn (x:xs)
    | nn==x     = True
    | otherwise = pertenece nn xs

aux1::[String]->Bool
aux1 (x:xs)
    | pertenece x xs = True
    | xs== []        = False
    | otherwise      = aux1 xs

formulasInvalidas::[(String,String)]->Bool
formulasInvalidas [] = False
formulasInvalidas formulas = aux1 (extraer formulas)

{- Ejercicio 1
Porcentaje de Votos Afirmativos [1 punto]
problema porcentajeDeVotosAfirmativos (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : R {
    requiere: {¬formulasInvalidas(formulas)}
    requiere: {|formulas| = |votos|}
    requiere: {Todos los elementos de votos son mayores o iguales a 0}
    requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}

    asegura: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las fórmulas) 
            sobre el total de votos emitidos}

}
-}

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

sumatoria::[Int]->Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

porcentajeDeVotosAfirmativos::[(String,String)]->[Int]->Int->Float
porcentajeDeVotosAfirmativos formulas votos votosTotales = division (sumatoria votos*100) votosTotales

{-Ejercicio 3
Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
    requiere: {La segunda componente de algún elemento de formulas es vice}
    requiere: {¬formulasInvalidas(formulas)}
    requiere: {|formulas| = |votos|}
    requiere: {Todos los elementos de votos son mayores o iguales a 0}
    requiere: {Hay al menos un elemento de votos mayores estricto a 0}

    asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
}
Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio 1.
ej = [("zoro","luffy"),("edward","alphonso"),("maxi","nahuel"),("eren","armin"),("levi","erwin")] [15,12,90,51,33]
-}

duoViceVoto::[(String,String)]->[Int]->[(String,Int)]
duoViceVoto [] [] = []
duoViceVoto ((x,y):xs) (a:as) = (y,a) : duoViceVoto xs as

aux2::String->[(String,Int)]->Int->Float
aux2 vice ((x,y):xs) tVotos
    | vice==x   = division (y*100) tVotos
    | otherwise = aux2 vice xs tVotos

porcentajeDeVotos::String->[(String,String)]->[Int]->Float
porcentajeDeVotos _ [] [] = 0
porcentajeDeVotos vice listaCandidatos listaVotos = aux2 (vice) (duoViceVoto listaCandidatos listaVotos) (sumatoria listaVotos)

{-Ejercicio 4
 Menos Votado [3 puntos]
    problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
        requiere: {¬formulasInvalidas(formulas)}
        requiere: {|formulas| = |votos|}
        requiere: {Todos los elementos de votos son mayores o iguales a 0}
        requiere: {Hay al menos un elemento de votos mayores estricto a 0}
        requiere: {|formulas| > 0}

        asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados 
        en votos}
}-}

duoPresiVotos::[(String,String)]->[Int]->[(String,Int)]
duoPresiVotos [] [] = []
duoPresiVotos ((x,y):xs) (a:as) = (x,a) : duoPresiVotos xs as 

aux3::[(String,Int)]->String
aux3 ((x,y):xs)
    | xs==[]             = x
    | y <= snd (head xs) = aux3((x,y):(tail xs))
    | otherwise          = aux3(xs)

menosVotado::[(String,String)]->[Int]->String
menosVotado listaCandidatos listaVotos = aux3 (duoPresiVotos  listaCandidatos listaVotos)