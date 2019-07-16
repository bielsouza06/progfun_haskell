-- Gabriel Silva Souza - 2019.1 - T 01

import Prelude
-- 3.1
ouEx :: Bool -> Bool -> Bool
ouEx x y
 | x == True && y == False = True
 | y == True && x == False = True
 | otherwise               = False

-- 3.2

-- 3.3 
exOr :: Bool -> Bool -> Bool
exOr True True = False 
exOr True False = True
exOr False True = True
exOr False False = False

-- 3.4 
-- 3.5 
nAnd :: Bool -> Bool -> Bool
nAnd x y
 | x == True && y == True = True
 | otherwise              = False 

nAnd2 :: Bool -> Bool -> Bool
nAnd2 True True = True
nAnd2 True False = False
nAnd2 False True = False
nAnd2 False False = False

-- 3.6


-- 3.7 

-- 3.8
-- Essa função devolve a negação da equação apresentada, ou seja, o resultado será Falso
-- quando todos os argumentos forem iguais e Verdadeiro em qualquer outro caso.
mystery :: Integer -> Integer -> Integer -> Bool
mystery m n p = not ((m==n) && (n==p)) 

-- 3.9 
threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent x y z
 | x /= y && y /= z && z /= x = True
 | otherwise = False
 --threeDifferent 3 4 3 resultará em Falso pois só é Verdadeiro se todos os argumentos forem diferentes.

-- 3.10
fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual a b c d
 | a == b && b==c && c==d = True
 | otherwise = False 

-- 3.11
-- threeEqual (2+3) 5 (11 'div' 2) -> 5 5 (11 'div' 2) -> 5 5 5,5 
-- mystery (2+4) 5 (11 'div' 2) -> 6 5 (11 'div' 2) -> 6 5 5,5
-- threeDifferent (2+4) 5 (11 'div' 2) -> (11 'div' 2)
-- fourEqual (2+3) 5 (11 'div' 2) (21 'mod' 11) -> 5 5 (11 'div' 2) (21 'mod' 11) -> 5 5 5,5 (21 'mod' 11) -> 5 5 5,5 10

-- 3.12 

-- 3.13 
-- max (3-2) (3*8) -> 1 (3*8) -> 1 24 -> 24
-- masThree (4+5) (2*6) (100 'div' 7) -> 9 (2*6) (100 'div' 7) -> 9 12 (100 'div' 7) ->
-- 9 12 14 -> 14 

-- 3.14
minDois :: Int -> Int -> Int
minDois x y 
 = if x < y then x else y

 -- 3.15 

 -- 3.16
toUpper :: Char -> Char
toUpper ch = toEnum (fromEnum ch + (fromEnum 'A' - fromEnum 'a'))

-- 3.17
cToNum :: Char -> Int
cToNum x
 | x == '1' = 1  | x == '2' = 2
 | x == '3' = 3  | x == '4' = 4
 | x == '5' = 5  | x == '6' = 6
 | x == '7' = 7  | x == '8' = 8
 | x == '9' = 9  | otherwise = 0

-- 3.18
onthreeLines :: String -> String -> String -> String
onthreeLines a b c = a ++ b ++ c

-- 3.19
romanDigit :: Char -> String
romanDigit x
 | x == '1' = "I" 
 | x == '2' = "II"
 | x == '3' = "III"
 | x == '4' = "IV"
 | x == '5' = "V"
 | x == '6' = "VI"
 | x == '7' = "VII"
 | x == '8' = "VIII"
 | x == '9' = "IX"
 | otherwise = "Validos apenas caracteres entre 1 e 9"

-- 3.20
media :: Integer -> Integer -> Integer -> Float
media a b c = fromIntegral ( a + b + c) / 3

-- 3.21 

-- 3.22
realRoots :: Float -> Float -> Float -> Integer
realRoots a b c
 | quad > bhask = 2
 | quad == bhask = 1
 | quad < bhask = 0
 where bhask = 4.0 * a * c
       quad = b ^ 2

-- 3.26 

-- 3.27
funny x = x + x
peculiar y = y
 -- Ao remover o espaço que estava a frente de "peculiar"
 -- a função desempenhou seu papel normalmente

-- 4.1
-- 4.1 a)
maxFour :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour a b c d
 | a >= b && a >= c && a >= d = a
 | b >= c && b >= d           = b
 | c >= d                     = c
 | otherwise                  = d
-- 4.1 b)
maxFour2 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour2 a b c d = ((a `max` b) `max` c) `max` d
-- a ---> |max|
-- b ---> |   |-->|max| 
-- c ------------>|   |--->|max|
-- d --------------------->|   |--->
--4.1 c)
maxFour3 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour3 a b c d =  max maxThree d
 where 
 	
-- a ------------>|        |
-- b ------------>|maxThree|    |   | 
-- c ------------>|        |--->|max|
-- d -------------------------->|   |--->

-- 4.3 
manyEqual :: Integer -> Integer -> Integer -> Integer
manyEqual a b c 
 | a == b && a == c = 3
 | a == b && a /= c = 2 
 | b == c && b /= a = 2
 | c == a && c /= b = 2 
 | otherwise        = 0

-- 4.4
