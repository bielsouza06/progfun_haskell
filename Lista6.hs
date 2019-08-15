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
Hipótese Indutiva : xs ++ (ys ++ zs) = (xs ++ ys) ++ zs
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