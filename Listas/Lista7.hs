--5.6
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

