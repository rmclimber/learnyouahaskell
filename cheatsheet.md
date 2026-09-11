
# Notes on *Learn you a Haskell for great good*

## Chapter 1: Starting out
- To run the interpreter: `ghci`
- To load `baby.hs` from the interpreter: `ghci> :l baby`

### Functions
- prefix place function call before args, e.g. `succ 5`
- infix: place function call between args, e.g. `5 * 3` 
- if we want to check the type of an infix function or otherwise
place it between expressions, we need to put it in parentheses, e.g. `:t (==)`
- `succ`
- Boolean: `/=`, `==`, `||`, `not`, `&&`
- `min`, `max`
- use backticks to make prefix with two args an infix
- simple complete function definition: `doubleMe x = x + x`.
- simple conditional: 

```
doubleSmallNumber x = if x > 100: 
                        then x 
                        else x*2
```
In Haskell, the else is mandatory. (I think this is because the language is declarative, whereas in an imperative language the false branch can be ignored in execution.)

### Lists
- `let nums = [1, 2, 3, 4, 5]` (`let` is necessary in GHCi, not in a script)
- strings are just lists of characters
- to concatenate a char to beginning of string: `5:[1,2,3,4]` -> `[5,1,2,3,4]`.
- concatenate two lists: `nums1 ++ nums2`
- for access by 0-indexed index: `[1,2,3] !! 2` -> `3`
- lists within a list must be of the same type
- `head`, `tail`, `last`, `init`
- `take` vs `drop`
- `maximum` vs `minimum`
- `sum`, `product`
- `elem`: `elem 3 [1,2,3]` -> `True` (membership)


### Ranges
- basic syntax: `[<start>..<finish>]`
- `<start>, <next>` will iterate through list by distance between first two elements
- dropping `<finish>` makes an infinite list (evaluated lazily)
- `cycle`, `repeat`, `replicate`

### List comprehensions
- `[x*2 | x <- [1..10]]` will pipe the elements of 1->10 into the doubling operation and create a new list from it
- `[x*2 | x <- [1..10], x*2 >= 12]` will do the same thing, but only retain those elements no less than 12. The part after the comma is the *predicate*.
- any number of sets can be used in a list comprehension
- multiple lists can be used (also comma-separated), and the list comprehension will automatically create all combinations of multiple lists of args

### Pairs, triples, tuples
- `fst (3, 5)` returns 3
- `snd (3, 4)` returns 5
- just like Python, can `zip` two lists

## Chapter 2: believe the type

### Explicit types
- `:t x` will give the type for any valid expression `x`
- `::` means 'has type of'

### Common types
- `Int` capacity is determined by the size of the system
- `Integer` is unbounded but is less efficient.

### Type variables
- a type name starts with a capital letter
- type variables can operate on various types in a safe way
- functions using type variables are *polymorphic functions*

### Type classes 101
- `Eq` type class is any class that supports equality testing
- `Ord` class supports ordering/comparison
- with `:t`, everything before the `=>` is a class constraint
- the `Show` type class can be represented as a string
- `Bounded` applies to functions showing the limits of another type, e.g. `Int`

## Chapter 3: syntax in functions

### Pattern-matching
- first line: `sayMe :: Int -> String` specifies input and output
- `Int -> Int -> Int` is equivalent to `Int -> (Int -> Int)`, or in other words this function takes an `Int` and returns a function which takes an `Int` and returns an `Int`
- currying occurs like so: `add 2 3` is equivalent to `(add 2) 3`, which means something like 'take 2 and then add it to whatever argument you give me'
- second line: `sayMe 3 = "three!"` will produce `three` as an output if the input is `3` (matching the pattern of input = 3)
- `sayMe x = "Not between 1 and 5!"`, will take any other input `x` and print the string
- recursion: first few lines are base cases, then the recursive case(s)
- functions are written in a pattern-matching way
- equivalent: `[1, 2, 3]`, `1:2:3:[]`, `1:(2:(3:[]))`. a list is recursively constructed from an empty list by adding elements to the front

### Guards
- we use guards to check whether a property of the input is true or false, rather
than *pattern-matching* the input
- guard is indicated by a pipe, then Boolean expression, then the return value:
`| x <=5 = "Less than 6!"`a
- final guard should be: `| otherwise = < return value >`

### where
- the `where` keyword is used to define elements of computation within a function (makes me think of lambdas in Python)
- `where` comes after guards and is used to define variables or functions, e.g.
in a BMI calculator you might have `where bmi = weight / height ^ 2` after the guards
giving the return values of the function for particular values of `bmi`
- `where` bindings are not shared across function bodies of different patterns, even if the patterns are both part of the same function

### let
- `let` can be used to bind variables anywhere, but they don't span across guards
- `let < bindings > in < expression >`
- different from guards in that `let` is an expression, which means it has a *value* and can be used anywhere in code that an expression can be used
- `let` variables can also be separated by semicolons with the `let` expressions separated by commas: `(let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)`

### case
- `case` can be used anywhere in a function, whereas pattern-matching can only be used when defining the function