-- Gabriel Silva Souza - 2019.1 - T 01

-- 5.1
-- Não entendi muito bem o enunciado. Estou levando em conta que está
-- pedindo o maximo dos numeros e quantas vezes esse numero aparece
maxOccurs :: Integer -> Integer -> (Integer, Integer)
maxOccurs a b
 | a == b = (a, 2)
 | a > b  = (a, 1)
 | b > a  = (b, 1)

maxThreeOccurs :: Integer -> Integer -> Integer -> (Integer, Integer)
maxThreeOccurs a b c
 | a == b && a == c = (a, 3)
 | a > (b `max` c)  = (a, 1)
 | b > (a `max` c)  = (b, 1)
 | c > (a `max` b)  = (c, 1)
 | a == b && b > c  = (a, 2)
 | a == c && c > b  = (a, 2)
 | b == c && b > a  = (b, 2)

-- 5.2
orderTriple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
orderTriple (a, b, c) = (minThree, middle, maxThree)

 where maxThree = ((a `max` b) `max` c)
       minThree = ((a `min` b) `min` c)  
       middle 
         | a == b && b == c = b
         | a == b = a
         | b == c = c
         | a == c = c
         | a > minThree && a < maxThree = a
         | b > minThree && b < maxThree = b
         | c > minThree && c < maxThree = c

-- 5.3 
-- 5.4

-- 5.18
doubleAll :: [Integer] -> [Integer]
doubleAll ds = [2*x | x <- ds]

-- 5.19
capitalize :: String -> String
capitalize ls = [toUpper x | x <- ls]
 where toUpper ls = toEnum (fromEnum ls + (fromEnum 'A' - fromEnum 'a'))

capitalizeLetters :: String -> String
capitalizeLetters ls = [toUpper x | x <- ls, x `elem` ['a'..'z'] || x `elem` ['A'..'Z']]
 where toUpper ls = toEnum (fromEnum ls + (fromEnum 'A' - fromEnum 'a'))

-- 5.20
divisors :: Integer -> [Integer]
divisors xs = [x | x <- [1..xs], xs `mod` x == 0]

isPrime :: Integer -> Bool
isPrime xs
 | length [x | x <- [1..xs], xs `mod` x == 0] == 2 = True 
 | otherwise = False

-- 5.21
matches :: Integer -> [Integer] -> [Integer]
matches x xs = [y | y <- xs, y == x]

eleme :: Integer -> [Integer] -> Bool
eleme x xs = if [y | y <- xs, y == x] /= [] then True else False

-- 5.22
onSeparate :: [String] -> String
onSeparate zs = concat [y | y <- zs]

-- 5.23
duplicate :: String -> Integer -> String
duplicate xs x = concat [xs | z <- [1..x]]
 
-- Base
type Person   = String
type Book     = String
type Database = [(Person , Book)] 
exampleBase :: Database
exampleBase = [("Alice" , "Tintin"), ("Anna" , "Little Women"),
              ("Alice" , "Asterix"), ("Rory" , "Tintin")]
-- 5.28
numBorrowed :: Database -> Person -> Int
numBorrowed dBase pers = length [n | (p,n) <- dBase, p == pers]

--Base para as Questões 6.39 a 6.50
type Name     = String
type Price    = Int
type BarCode  = Int
type TillType = [BarCode]
type BillType = [(Name,Price)]

type Datamkt = [(BarCode, Name, Price)]
codeIndex :: Datamkt
codeIndex = [(4719, "Fish Fingers", 121),
             (5643, "Nappies", 1010),
             (3814, "Orange Jelly", 56),
             (1111, "Hula Hoops", 21),
             (1112, "Hula Hoops (Giant)", 133),
             (1234, "Dry Sherry, 1Lt", 540)]

makeBillEx :: Datamkt -> TillType -> BillType
makeBillEx c cs = [(name,price ) | (code,name,price) <- c]


-- 6.39
formatPence :: Price -> String
formatPence p 
 |rest < 10 = show (divi)++(".")++("0")++(show rest)
 |otherwise = show (divi)++(".")++(show rest)
 where divi = p `div` 100
       rest = p `mod` 100

-- 6.40
formatLine :: (Name,Price) -> String
formatLine (nm,pc) = nm ++ replicPontos ++ formatPence pc ++ "\n"
 where pontos = 35 - (length nm + length (show pc))
       replicPontos = ['.' | p <- [1..pontos]]

-- 6.41 
formatLines :: [(Name,Price)] -> String
formatLines ls = concat [formatLine (x,y) | (x,y) <- ls]

-- 6.42
makeTotal :: BillType -> Price
makeTotal ts = sum [ pr | (nm,pr) <- ts]

-- 6.43 
formatTotal :: Price -> String
formatTotal pc = "Total" ++ replicPontos ++ formatPence pc
 where pontos = 31 - (length (show pc))
       replicPontos = ['.' | p <- [1..pontos]]

-- 6.44
formatBill :: BillType -> String
formatBill bt = 
 "\n     Amyr Knight Marketplace\n\n"++(formatLines bt)++"\n"++(formatDiscount (makeDiscount bt))++"\n\n"++(formatTotal (makeTotal bt))

-- 6.45
look :: Datamkt -> BarCode -> (Name,Price)
look dmk bc = if lisDup == [] then ("Unknow Item", 0) else head lisDup
 where lisDup = [(n,p) | (c,n,p) <- dmk, c == bc]
--6.46
lookup2 :: BarCode -> (Name,Price)
lookup2 bc = look codeIndex bc

-- 6.47
makeBill :: TillType -> BillType
makeBill mbs = [lookup2 mb | mb <- mbs]

-- 6.48
makeDiscount :: BillType -> Price
makeDiscount bt = 100*quant
 where quant = (sum [1 | (n,p) <- bt, n == "Dry Sherry, 1Lt" ]) `div` 2

formatDiscount :: Price -> String
formatDiscount pc = "Descount" ++ replicPontos ++ (formatPence pc)
 where pontos = 25 - (length (show pc))
       replicPontos = ['.' | p <- [1..pontos]]

-- 6.49
upData :: Datamkt -> BarCode -> (Name, Price) -> Datamkt
upData dmk bc (n,p) = [(bc,n,p)] ++ dmk




