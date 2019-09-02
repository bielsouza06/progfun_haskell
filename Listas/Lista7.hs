import Data.List
import Data.Char
--5.6
data Market = Produto String Float
 deriving (Show, Ord, Eq)
--definindo o banco de produtos como uma lista
data Lista a = Vazia | Celula a (Lista a)
 deriving (Show, Ord, Eq)
banco :: Lista (String,Float) 
banco = Celula ("Feijao", 2.0) (Celula ("Arroz", 3.0) Vazia)
--Exemplo de função para consultar o preço do Produto
produc :: Lista (String,Float) -> String -> Float
produc Vazia pr = error "produto nao encontrado"
produc (Celula (a, b) cs) pr
 |a == pr = b
 |otherwise = produc cs pr

--14.1
type Nome = String
type Livro = String
data Pessoa = Pessoa Nome Livro

--14.2
data Estoque = Livro String | CD String | Videos String
 deriving (Show, Ord, Eq)

data Artistas = Autor String [Estoque] | Banda String [Estoque]
 deriving (Show, Ord, Eq)

{-14.3
eval (Lit 67) = 67

eval (Add (Sub (Lit 3) (Lit 1)) (Lit 3))
eval  ((Lit 3) - (Lit 1)) + (Lit 3)
eval  (3 - 1) + 3   =>   2 + 3 => 5

show (Add (Lit 67) (Lit (-34)))
show ((Lit 67) + (Lit (-34)))
show (67 + (-34))
   =>  "33"
-}
 ------------Exercicios IO-------------
getInt :: IO Int
getInt = do num <- getLine
            return (read num :: Int)

--1. Testar se uma palavra é Plalindroma
palavra :: IO ()
palavra = do putStrLn "Insira uma palavra"
             line <- getLine 
             if line == reverse line
             then putStrLn "Esta é uma palavra Palindroma"
             else putStrLn "Não é uma palavra Palindroma"

--2. Elevar um Float à um Int
potencia :: IO ()
potencia = do putStrLn "Insira um numero"
              lin1 <- getLine
              let f = read lin1 :: Float
              putStrLn "Agora um expoente para ele"
              lin2 <- getLine
              let n = read lin2 :: Int
              putStrLn.show $ (show f) ++ " elevado a " ++ (show n) ++ ": " ++ (show (f^n))

--3. Somar os numeros inseridos em uma unica linha
soma :: IO ()
soma = do putStrLn "Insira numeros"
          lin <- getLine
          let n1 = map (\x -> read x :: Int) (words lin)
          putStrLn . show $ sum n1

--4. Ecoar um String n vezes
putNtimes :: Integer -> String -> IO ()
putNtimes 0 _ = return ()
putNtimes n str = do putStrLn str
                     putNtimes (n-1) str

--5. Soma n entradas de numeros
--chama a função com o acumulador
callsomaN :: Int -> IO ()
callsomaN x = somazeroN x 0
--faz o processo de acumular e somar  
somazeroN :: Int -> Int -> IO ()
somazeroN x acm =  
              if x == 0
              then putStrLn $ "A soma deles é: " ++ (show acm)
              else do putStrLn "Inisira um numero."
                      lin <- getInt
                      somazeroN (x-1) (acm+lin)

--6. Somas as linhas inseridas e encerra ao entrar 0
--callsoma chama a função com o acumulador
callsoma :: IO ()
callsoma = somazero 0
--somazero faz o processo de acumular e somar                     
somazero :: Int -> IO ()
somazero acm = do 
                putStrLn "Inisira um numero. (0 finaliza, e Soma as entradas)"
                lin <- getInt
                if lin == 0
                then putStrLn $ show $ acm
                else somazero (acm+lin)

--7. Contabiliza as linhas, palavras e caracteres das entradas
callreadlines :: IO ()
callreadlines = readlines 0 0 0

readlines :: Int -> Int -> Int -> IO ()
readlines x y z = do lin <- getLine
                     if lin == ""
                     then putStrLn $ "Linhas: " ++(show x)++"\n"++ 
                                     "Palavras: " ++(show y)++"\n"++
                                     "Caracteres: " ++(show z)
                     else readlines (x+1) (y+(length (words lin))) (z+(length lin))

--8. Recebe numeros e os devolve em uma lista ordenada
callreadnum :: IO ()
callreadnum = readnum []

readnum :: [Int] -> IO ()
readnum acm = do
              lin <- getInt
              if lin == 0
              then putStrLn $ show (sort acm)
              else readnum (acm ++ [lin])

--8.15 - Verifica se é um palindromo, sem considerar maiusculas, espaços e pontuações.
palindrome :: IO ()
palindrome = do lin <-getLine
                let clean = map toLower (filter isLetter lin)
                if clean == (reverse clean)
                then putStrLn "É um Palindromo"
                else putStrLn "Não é um Palindromo"