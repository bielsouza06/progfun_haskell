palavra :: IO ()
palavra = do putStrLn "Insira uma palavra"
             line <- getLine 
             if line == reverse line
             then putStrLn "Esta é uma palavra Palindroma"
             else putStrLn "Não é uma palavra Palindroma"

soma :: IO ()
soma = do putStrLn "Insira numeros"
          lin <- getLine
          let n1 = map (\x -> read x :: Int) (words lin)
          putStrLn . show $ sum n1