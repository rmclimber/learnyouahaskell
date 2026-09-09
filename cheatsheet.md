
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