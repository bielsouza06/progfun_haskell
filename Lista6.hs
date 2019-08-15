----------9.5-------------
[] ++ ys = ys              --(++.1)
(x:xs) ++ ys = x:(xs++ys)  --(++.2)

sum [] = 0                 --(sum.1)
sum (x:xs) = x + sum xs    --(sum.2)

Caso Base: sum ([]++ys) = sum [] + sum ys
Hipótese Indutiva: sum (xs++ys) = sum xs + sum ys --(HI)
Indução: sum ((x:xs)++ys) = sum (x:xs) + sum ys

Prova

Caso Base
Esquerda: 
sum ([]++ys) =
sum ys =         --(++.1)
Direita: 
sum [] + sum ys =
0 + sum ys =     --(sum.1)
sum ys           --(aritmética)

Passo Indutivo
Esquerda:
sum ((x:xs)++ys)=
sum (x:(xs++ys))=    --(++2)
x + sum (xs++ys)=    --(sum.2)
x + sum xs + sum ys  --(HI)
Direita:
sum (x:xs) + sum ys=
x + sum xs + sum ys  --(sum.2)

---------------9.6-----------------
xs ++ [] = xs              --(++.0)
[] ++ ys = ys              --(++.1)
(x:xs) ++ ys = x:(xs++ys)  --(++.2)

Provando o (++.0)

Caso Base: [] ++ [] = []
Hipótese Indutiva: xs ++ [] = xs
Indução: (x:xs) ++ [] = (x:xs)

Provas
Caso Base
[] ++ [] = []   
[] = []               --(++.1)

Passo Indutivo:
(x:xs) ++ [] = (x:xs)
x:(xs++[]) =          --(++.1)
(x:xs)                --(HI)

---------------------------------------

Caso Base: [] ++ (ys ++ zs) = ([] ++ ys) ++ zs
Hipótese Indutiva: xs ++ (ys ++ zs) = (xs ++ ys) ++ zs
Indução: (x:xs) ++ (ys ++ zs) = ((x:xs) ++ ys) ++ zs

Prova

Caso Base
Esquerda:
[] ++ (ys ++ zs)
[] ++ y:(ys++zs) =     --(++.2)
[] ++ (y:ys) =         --(associação)
(y:ys)                 --(++.1)
Direita:
([] ++ ys) ++ zs
ys ++ zs =             --(++.1)
(y:(ys++zs) =          --(++.2)
(y:ys)                 --(associação)

Passo Indutivo
Esquerda:
(x:xs) ++ (ys ++ zs)
(x:xs) ++ y:(ys++zs) =  --(++.2)
(x:xs) ++ (y:ys) =      --(associação)
(x:(xs++ys) =           --(++.2)
(x:xs)                  --(associação)
Direita:
((x:xs) ++ ys) ++ zs
(x:(xs++ys)) ++ zs =     --(++.2)
(x:xs) ++ zs =           --(associação)
(x:(xs++zs) =            --(++.2)
(x:xs)                   --(associação)

--------------- 9.7 ------------------------
reverse [] = []                     --(rev.1)
reverse (x:xs) = reverse xs ++ [x]  --(rev.2)

sum (reverse xs) = sum xs

Caso Base: sum (reverse []) = sum []
Hipótese Indutiva: sum (reverse xs) = sum xs
Indução: sum (reverse (x:xs)) = sum (x:xs)

Prova

Caso Base
Esquerda:
sum (reverse [])
sum [] =           --(rev.1)
0                  --(sum.1)
Direita:
sum []
0                  --(sum.1)

Passo Indutivo
Esquerda:
sum (revese (x:xs)) = 
x + sum (revese xs) =   --(sum.2)
x + sum xs              --(HI)
Direita:
sum xs =
x + sum xs              --(sum.2)

---------------------------------------
length [] = 0                    --(leng.1)
length (x:xs) = 1 + length xs    --(leng.2)

length (reverse xs) = length xs

Caso Base: length (reverse []) = length []
Hipótese Indutiva: length (reverse xs) = length xs
Indução: length (reverse (x:xs)) = length (x:xs)

Prova

Caso Base
Esquerda:
length (reverse []) =
length [] =             --(rev.1)
0                       --(leng.1)
Direita:
length [] = 
0                       --(leng.1)

Passo Indutivo
Esquerda:
length (reverse (x:xs)) =
1 + length (reverse xs) =       --(leng.2)
1 + lenght xs                   --(HI)
Direita:
length (x:xs) =
1 + length xs                   --(leng.2)       


-------------------- 9.9 ---------------------
zip _ [] = []                        --(zip.1)
zip [] _ = []                        --(zip.2)
zip (x:xs) (y:ys) = (x,y):zip xs ys  --(zip.3)

unzip [] = ([],[])                   --(unz.1)
unzip ((x,y):ps) = (x:xs, y:ys)      --(unz.2)
 where (xs,ys) = unzip ps            --(unz.3)
unzip

fst (f,s) = f                        --(fst)
snd (f,s) = s                        --(snd)

Caso Base: zip (fst (unzip [])) (snd (unzip [])) = []
Hipótese Indutiva: zip (fst (unzip ps)) (snd (unzip ps)) = ps
Indução: zip (fst (unzip (p:ps))) (snd (unzip (p:ps))) = (p:ps)

Prova
Caso Base
Trabalhando o lado Esquerdo:
zip (fst (unzip [])) (snd (unzip [])) = []
zip (fst ([],[])) (snd ([],[])) =  --(unz.1)
zip [] [] =                        --(fst e snd)
[]                                 --(zip.1)
--Esquerdo == Direito                             

Passo Indutivo
Esquerda: 
zip (fst (unzip (p:ps))) (snd (unzip (p:ps)))
zip (fst (x:xs, y:ys)) (snd (x:xs, y:ys)) =      --(unz.2)
zip (x:xs) (y:ys) =                              --(fst e snd)
(x,y): zip xs ys  =                              --(zip.3)
(p:ps)                                           --?? (associação) ??

----------------------------------------------------
Caso Base: unzip (zip [] []) = ([],[])
Hipótese Indutiva: unzip (zip xs ys) = (xs,ys)
Indução: unzip (zip (x:xs) (y:ys)) = (x:xs, y:ys)

Prova
Caso Base
unzip (zip [] []) = ([],[])
unzip [] =                  --(zip.1)
([],[])                     --(unz.1)

Passo Indutivo
Esquerda:
unzip (zip (x:xs) (y:ys)) = 
unzip ((x,y): zip xs ys) =      --(zip.1)
(x:xs, y:ys)                    --(unz.2)
Direta:
(x:xs, y:ys)

---------------------- 9.11 ----------------------------
--Teste - 9.5
prop_Sum :: [Int] -> [Int] -> Bool
prop_Sum xs ys = sum (xs++ys) == sum xs + sum ys

--Teste - 9.6
prop_Conc :: [Int] -> [Int] -> [Int] -> Bool
prop_Conc xs ys zs = xs ++ (ys ++ zs) == (xs ++ ys) ++ zs

--Teste - 9.7
prop_Sum_Rev :: [Int] -> Bool
prop_Sum_Rev xs = sum (reverse xs) == sum xs

prop_Len_Rev :: [Int] -> Bool
prop_Len_Rev xs = length (reverse xs) == length xs

--Teste - 9.9
prop_Zip :: [(Int,Int)] -> Bool
prop_Zip ps = zip (fst (unzip ps)) (snd (unzip ps)) == ps

prop_Un :: [Int] -> [Int] -> Bool
prop_Un xs ys = unzip (zip xs ys) == (xs,ys)

--11.25, 11.26, 11.29, 11.32 e 11.33