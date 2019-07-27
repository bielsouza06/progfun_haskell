import Data.Char

--Questão 4 da prova
separaDigitos :: String -> (String, String)
separaDigitos cs = (num, str)
 where num = (filter isDigit cs)
       str = (filter isAlpha cs)

--Defina length usando map e sum
sumap :: [a] -> Int
sumap as = sum (map change as)
 where change _ = 1

--Como pode redefinir addUp de tal forma que seja feito o filter antes
--do map, como em:  addUp ns = map fun1 (filter fun2 ns)
addUp :: (Ord a, Num a) => [a] -> [a]
addUp ns = map addOne (filter greaterZero ns)
  where greaterZero n = n>0
        addOne n = n+1

--Qual é o o efeito de map addOne (map addOne ns)
--Basicamente o map ta aplicando uma função em toda lista ns (função dentro dos parênteses)
--e aplicando a mesma função sobre a lista gerada pela ação anterior. (Em outros casos poderiam ser funções distintas)

--Defina funções que tomem uma lista, ns, e...
--retorne a lista consistindo dos quadrados dos inteiros em ns
quadra :: (Num a) => [a] -> [a]
quadra ns = map eleva ns
 where eleva x = x*x

--retorne a soma dos quadrados dos itens em ns
sumqua :: (Num a) => [a] -> a
sumqua ns = sum (quadra ns)

--verifique se todos os itens da lista são maiores que zero
maiorZero :: (Ord a, Num a) => [a] -> Bool
maiorZero ns = and (map (\x-> x>0) ns)

--Defina funções para...
--calcular o menor valor de uma função f aplicada de 0 até n
menor :: Int -> (Int -> Int) -> Int
menor n f = foldr min (f 0) (map f [0..n])

--verificar se os valores de f aplicados de 0 até n são todos iguais
iguais :: Int -> (Int -> Int) -> Bool
iguais n f = and (map (\x-> x==(f 0)) (map f [0..n]))

--verificar se todos os valores de f aplicados de 0 até n são maiores que 0
fzero :: Int -> (Int -> Int) -> Bool
fzero n f = maiorZero (map f [0..n])

--verificar se os valores de f aplicados de 0 até n estão em ordem crescente
ordem :: Int -> Bool
ordem n = and (map g ls)
    where
          ls = map f [0..n]
          f x = x
          g x = if succ x >= x then True else False


--Defina uma função p que receba uma lista de strings strs e uma lista de
--caracteres cs e retorne um string contendo cada string em str acrescido,
--ao fim dele, o correspondente caractere da lista cs.
shallownow :: [String] -> [Char] -> String
shallownow strs cs = foldr (++) [] (map (\(x,y)->x++[y]) juntos)
  where juntos = zip strs cs

{-Estabeleça o tipo e defina uma função twice que aceita uma
função e um valor e aplica esta função duas vezes.-}
twice :: (a -> a) -> a -> a
twice f n = (f (f n))

{-Defina o tipo e defina a função iter tal que
iter n f x = f (f (f ... (f x)...))
onde f ocorre n vezes no lado direito da equação. Por
exemplo, deveríamos ter que
iter 3 f x = f (f (f x)))-}
iter :: Int -> (a -> a) -> (a -> a)
iter n f = foldr (.) id fs
  where fs = map g [1..n]
        g _ = f

double :: (Num a) => a -> a
double x = x*2

{-Usando iter e double defina uma função a qual para a
entrada n retorna 2n-}
pot2 :: Int -> Int
pot2 n = (iter n double) 1


init' :: [a]->[a]
init' xs = foldr1 (++) listanova
 where listanova = reverse (drop 1 (reverse (map (\x->[x]) xs)))
