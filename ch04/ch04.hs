-- Recursive function to find max of array
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list" -- base case 1
maximum' [x] = x -- base case 2
maximum' (x:xs)
  | x > maxTail = x
  | otherwise = maxTail
  where maxTail = maximum' xs -- recursive call to maximum' on the tail of the list

-- Recursive function to replicate a number
replicate' :: Int -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x : replicate' (n-1) x

-- take the first n elements of a list
take' :: Int -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

-- infinite list
repeat' :: a -> [a]
repeat' x = x : repeat' x

-- reverse list
reverse' :: [a] -> [a]
reverse' [] -> []
reverse' [x:xs] = reverse' xs ++ x

-- zip two lists
zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

-- check for membership
elem' :: (Eq a) =? a -> [a] -> Bool -- => separates constraints from the type signature
elem' _ [] = False
elem' y (x:xs)
    | y == x = True
    | otherwise = y `elem'` xs

-- quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerOrEqual = [ a | a <- xs, a <= x]
        larger = [ a | a <- xs, a > x]
    in smallerOrEqual ++ [x] ++ larger