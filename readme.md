| operator | pronunciation          | description                              |
|----------|------------------------|------------------------------------------|
| `>>=`    | bind                   |                                          |
| `>>`     | then                   |                                          |
| `*>`     | then                   |                                          |
| `->`     | to                     | a -> b: a to b                           |
| `<-`     | bind                   | (as it desugars to >>=)                  |
| `<$>`    | (f)map                 |                                          |
| `<$`     | map-replace by         | 0 <$ f: "f map-replace by 0"             |
| `<*>`    | ap(ply)                | (as it is the same as Control.Monad.ap)  |
| `$`      |                        | (none, just as " " [whitespace])         |
| `.`      | pipe to                | a . b: "b pipe-to a"                     |
| `!!`     | index                  |                                          |
| `!`      | index / strict         | a ! b: "a index b", foo !x: foo strict x |
| `<       | >`                     | or / alternative                         |
| `++`     | concat / plus / append |                                          |
| `[]`     | empty list             |                                          |
| `:`      | cons                   |                                          |
| `::`     | of type / as           | f x :: Int: f x of type Int              |
| `\`      | lambda                 |                                          |
| `@`      | as                     | go ll@(l:ls): go ll as l cons ls         |
| `~`      | lazy                   | go ~(a,b): go lazy pair a, b             |