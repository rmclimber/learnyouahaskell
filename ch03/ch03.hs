luckySeven :: Int -> String
luckySeven 7 = "LUCKY NUMBER SEVEN!"
luckySeven x = "Sorry, you're out of luck, pal!"

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

catchAll :: [Char] -> String
catchall "hello" = "Hello there!"
catchAll x = x

addDoubles :: (Double, Double) -> (Double, Double) -> (Double, Double)
addDoubles a b = (fst a + fst b, snd a + snd b)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- Guards
bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "You're underweight, eat more!"
  | bmi <= 25.0 = "Looking good!"
  | bmi <= 30.0 = "You're overweight. Let's work out together!"
  | otherwise = "You're obese. Go see a doctor."

-- where
bmiTellWhere :: Double -> Double -> String
bmiTellWhere height weight
  | bmi <= skinny= "You're underweight, eat more!"
  | bmi <= normal = "Looking good!"
  | bmi <= overweight = "You're overweight. Let's work out together!"
  | otherwise = "You're obese. Go see a doctor."
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        overweight = 30.0

-- let
cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea
