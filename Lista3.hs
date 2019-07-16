import Data.Char
import Test.QuickCheck

--1. Defina a função multiplica que multiplica dois números. 
mult :: Int -> Int -> Int
mult m 0 = 0
mult m n = mult m (n-1) + m 

--2. Escreva uma função que receba n e devolva 2ⁿ.
expo :: Int -> Int
expo 0 = 1
expo n = expo (n-1) *2

--3. Escreva uma função pot que receba um inteiro m e um natural n e calcule mⁿ.
pot :: Int -> Int -> Int
pot m 0 = 1
pot m n = pot m (n-1) * m

--4.Escreva uma função que dado n, calcule: 0! + 1! + 2! + … + n!.
fator :: Int -> Int
fator 0 = 1
fator n = fator (n-1) * n

--5. Escreva uma função que calcule: 2º + 2¹ + 2² + … + 2ⁿ.
exFact :: Int -> Int
exFact 0 = 1 
exFact n = (exFact (n-1)*2)+1

f :: Int -> Int
f m 
 | m == 0 = 8
 | m == 1 = 44
 | m == 2 = 17
 | otherwise = 0
 

--Exercicios Listas

--O produto dos elementos de uma lista de inteiros.
produt :: [Int] -> Int
produt [] = 1
produt (l:ls) = produt ls * l 

--Filtrar (eliminar) os números pares, ou seja, ficar somente com os ímpares.
filt :: [Int] -> [Int]
filt [] = []
filt (n:ns)
 |(n `mod` 2) == 0 = filt ns
 |otherwise = n: filt ns

--Alpha

--Eliminar a primeira ocorrência de um dado elemento, se ele ocorrer, senão retornar a lista original.
delFirst :: Int -> [Int] -> [Int]
delFirst x [] = []
delFirst x (n:ns)
 | x == n = ns
 | otherwise = n: delFirst x ns

--Eliminar todas as ocorrências de um dado elemento.
delAll :: Int -> [Int] -> [Int]
delAll z [] = []
delAll z (n:ns)
 | z == n = delAll z ns
 | otherwise = n: (delAll z ns)

--Inverter um String.
invertStr :: String -> String
invertStr [] = []
invertStr (n:ns) = invertStr ns ++ [n]

--Aplica o operador ou lógico || a todos os elementos de uma lista.
ouLog :: [Bool] -> Bool
ouLog [] = False
ouLog (l:ls) = l || ouLog ls


--aula10
--Definir propriedades da função maior e testar com
maior :: [Int] -> Int
maior[a] = a
maior(a:x) = if a > maior x then a else maior x

prop_maior :: [Int] -> Bool
prop_maior [] = True
prop_maior [a] = True
prop_maior (a:x)
 | maior (a:x) == maximum (a:x) = True
 | otherwise = False

--Definir uma função menor para calcular o menor de uma lista de inteiros.
menor :: [Int] -> Int
menor[a] = a
menor(a:x) = if a < menor x then a else menor x

prop_menor :: [Int] -> Bool
prop_menor [] = True
prop_menor (a:x) = if menor (a:x) == minimum (a:x) then True else False

--Definir a função filtraPosicoesPares :: [Int] -> [Int]
--que retorna todos os elementos da lista de entrada que estão em posições impares
eliminarPosicoesPares :: [Int] -> [Int]
eliminarPosicoesPares [] = []
eliminarPosicoesPares [x] = []
eliminarPosicoesPares (x1:x2:xs) = x2:eliminarPosicoesPares(xs) 

 
--Definir a função filtraPosicoesImpares :: [Int] -> [Int]
--que retorna todos os elementos da lista de entrada queestão em posições pares
eliminarPosicoesImpares :: [Int] -> [Int]
eliminarPosicoesImpares [] = []
eliminarPosicoesImpares [x] = [x]
eliminarPosicoesImpares (x1:x2:xs) = x1:eliminarPosicoesImpares(xs)

--Redefina take de tal forma que take n xs retorne [] quando n < 0.
takeit :: Int -> [Int] -> [Int]
takeit n [] = []
takeit n (x:xs)
 |n <=0 = []
 |otherwise = x : takeit (n-1) xs

--Redefina drop de tal forma que drop n xs retorne xs quando n < 0.
dropit :: Int -> [Int] -> [Int]
dropit n [] = []
dropit n (x:xs)
 |n <= 0 = xs
 |otherwise = dropit (n-1) xs

-- 7.8
elemNum :: Integer -> [Integer] -> Integer
elemNum y [ ] = 0
elemNum y (x:xs)
    | y == x = 1 + elemNum y xs
    |otherwise = elemNum y xs

--7.9
unique :: [Integer] -> [Integer]
unique [] = []
unique (x:xs)
 | x `elem` xs = unique xs
 |otherwise = x: unique xs
