import Data.Char 
import Data.List

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

--4. Imprime umas String n vezes
putNtimes :: Integer -> String -> IO ()
putNtimes 0 _ = return ()
putNtimes n str = do putStrLn str
                     putNtimes (n-1) str

--5. Soma n entradas de numero
callsomaN :: Int -> IO ()
callsomaN x = somazeroN x 0

somazeroN :: Int -> Int -> IO ()
somazeroN x acm =  
              if x == 0
              then putStrLn $ "A soma deles é: " ++ (show acm)
              else do putStrLn "Inisira um numero."
                      lin <- getInt
                      somazeroN (x-1) (acm+lin)

--6. Aceita entrada de numero até que entre o 0, 
--então finaliza e soma todas as entradas
callsoma :: IO ()
callsoma = somazero 0

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

--8.15 - Verifica se é um palindromo, sem considerar espaços e pontuações.
palindrome :: IO ()
palindrome = do lin <-getLine
                let clean = map toLower (filter isLetter lin)
                if clean == (reverse clean)
                then putStrLn "É um Palindromo"
                else putStrLn "Não é um Palindromo"