import Data.List
 
type Reply = [(Int,String)]
 
someReplies :: [Reply]
someReplies =[[(1, "very good"), (3, "bad"), (4, "normal")],
              [(2,"good"), (3,"bad"), (4,"good"), (5,"difficult")],
              [(4,"normal"), (5,"very difficult")]]
 
validReply :: Reply -> Bool
validReply x = chk $ map fst x
               where chk [] = True
                     chk (y:ys) | y `elem` ys = False
                                | otherwise   = chk ys
                                
questions :: [Reply] -> [Int]
questions r =  map head $ group $ sort $ concatMap (\ x -> map fst x) r
                
answers :: Int -> [Reply] -> [String]
answers k r =  map snd $ concatMap (\ x -> filter (\ (p,_) -> p==k) x) r
 
setof :: [Int] -> [Int]
setof [] = []
setof (x:xs) = x : (setof $ filter (/= x) xs)
 
summary rs = zip [1,2..] ss
             where na = sort $ setof $ map fst aa
                   aa = concatMap id rs
                   ss = map action $ map (\ n -> filter (\ (a,s) -> a==n) aa) na   
            
action cs = qsort $ map (\ x -> ((length x),(head x))) $ group $ sort $ map snd cs                   
             
                   
qsort :: [(Int,String)] -> [(Int,String)]                   
qsort [] = []
qsort (x:xs) = (qsort $ filter (\ (z,s) -> (z > fst x)) xs) ++ 
               [x] ++ 
               (qsort $ filter (\ (z,s) -> (z <= fst x)) xs)
