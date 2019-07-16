shift :: ((a,b),c) -> (a, (b,c))
shift ((x,y), z) = (x, (y,z))

--a função zip recebe duas listas e devolve uma lista de tuplas 
--contendo os elementos intercalados de cada lista.
zips :: [a] -> [b] -> [(a,b)]
zips [] qs = []
zips ps [] = []
zips (p:ps) (q:qs) = (p, q) : zips ps qs

numEqual :: (Eq a) => a -> [a] -> Int
numEqual n ns = sum [1 | z <- ns, z == n]

elem2 :: (Ord a) => a -> [a] -> Bool
elem2 x xs = if numEqual x xs > 0 then True else False

oneLookupFirst :: (Eq a) => a -> [(a,b)] -> b
oneLookupFirst n [] = error "nao existe"
oneLookupFirst n ((p,q):xs) 
 | n == p = q
 |otherwise = oneLookupFirst n xs

oneLookupSecond :: (Eq b) => b -> [(a,b)] -> a
oneLookupSecond n [] = error "nao existe"
oneLookupSecond n ((p,q):xs) 
 | n == q = p
 |otherwise = oneLookupSecond n xs


misterio :: (Show b, Ord b) => [b] -> [b] -> [String]
misterio ys xs = [show z | z <- xs, elem z ys]