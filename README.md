# Regioned Random Library

A version of
`https://github.com/flix/flix/blob/master/main/src/library/Random.flix` with
regions instead of `IO`. This is correct since, after seed choice, a random
object is just a regular iterator.
