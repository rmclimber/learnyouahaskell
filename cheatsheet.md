
# Notes on *Learn you a Haskell for great good*

## Chapter 1: Starting out
- To run the interpreter: `ghci`
- To load `baby.hs` from the interpreter: `ghci> :l baby`

### Functions
- prefix place function call before args, e.g. `succ 5`
- infix: place function call between args, e.g. `5 * 3` 
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
- `let nums = [1, 2, 3, 4, 5]`
- strings are just lists of characters
- to concatenate a char to beginning of string: `5:[1,2,3,4]` -> `[5,1,2,3,4]`.
- concatenate two lists: `nums1 ++ nums2`
- for access by 0-indexed index: `[1,2,3] !! 2` -> `3`
- lists within a list must be of the same type
- `head`, `tail`, `last`, `init`
- `take` vs `drop`
- `maximum` vs `minimum`
- `sum`, `product`
- `elem`: `elem 3 [1,2,3]` -> `True`


### Ranges
- basic syntax: `[<start>..<finish>]`
- `<step>, <start>` will iterate through list by `step` each time
- dropping `<finish>` makes an infinite list (evaluated lazily)
- `cycle`, `repeat`, `replicate`