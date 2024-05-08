-- E1
hayQueCodificar::Char->[(Char,Char)]->Bool
hayQueCodificar _ [] = False  
hayQueCodificar cc ((x,y):xs)
    | cc==x     = True
    | otherwise = hayQueCodificar cc xs

-- E2
-- ['h','o','l','a',' ','q','u','e',' ','t','a','l'] [('c','v'),('e','t'),('a','c')]
cuantasVecesHayQueCodificar::Char->[Char]->[(Char,Char)]->Int
cuantasVecesHayQueCodificar cc frase mapeo
    | hayQueCodificar cc mapeo == False = 0 
    | otherwise                         = contarApariciones cc frase

contarApariciones::Char->[Char]->Int
contarApariciones _ [] = 0
contarApariciones elem (x:xs)
    | elem==x    = 1 + contarApariciones elem xs
    | otherwise  = contarApariciones elem xs

-- E3
pertenece::Char->[Char]->Bool
pertenece _ [] = False
pertenece el (x:xs)
    | el==x     = True
    | otherwise = pertenece el xs

quitarElemento::Char->[Char]->[Char]
quitarElemento el [] = []
quitarElemento el (x:xs)
    | el==x     = quitarElemento el xs
    | otherwise = x: (quitarElemento el xs) 

seqToSeqTup::[Char]->[(Char,Int)]
seqToSeqTup [] = []
seqToSeqTup (x:xs) = (x, contarApariciones x (x:xs)) : (seqToSeqTup (quitarElemento x (xs)))

auxE3::[(Char,Int)]->Char
auxE3 ((x,y):xs)
    | xs==[]            = x
    | y>= snd (head xs) = auxE3 ((x,y):(tail xs))
    | otherwise         = auxE3 xs

laQueMasHayQueCodificar::[Char]->[(Char,Char)]->Char
laQueMasHayQueCodificar frase mapea = auxE3 (seqToSeqTup frase)

-- E4
fraseCodificada::[Char]->[(Char,Char)]->Bool
fraseCodificada (x:xs) mapeo
    | hayQueCodificar x mapeo && xs==[] = True
    | hayQueCodificar x mapeo           = fraseCodificada xs mapeo
    | otherwise                         = False

auxE4::Char->[(Char,Char)]->Char
auxE4 ii ((x,y):xs)
    | ii==x      = y
    | otherwise  = auxE4 ii xs

codificarFrase::[Char]->[(Char,Char)]->[Char]
codificarFrase [] _ = []
codificarFrase (x:xs) mapeo
    | fraseCodificada (x:xs) mapeo = (auxE4 x mapeo) : codificarFrase xs mapeo
    | otherwise                    = (x:xs)