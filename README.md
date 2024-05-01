# Regioned Random Library

A version of
`https://github.com/flix/flix/blob/master/main/src/library/Random.flix` with
regions instead of `IO`. This is correct since, after seed choice, a random
object is just a regular iterator.

## Docs

```scala
enum Jls.Random[_r: Region]

def Jls.Random.freshWithSystemSeed(_rc: Region[r]): Random[r] \ r + IO

def Jls.Random.fresh(_rc: Region[r], s: Int64): Random[r] \ r

def Jls.Random.oneOf(ran: Random[r1], a: Array[a, r2]): Option[a] \ r1 + r2

def Jls.Random.nextBool(ran: Random[r]): Bool \ r

def Jls.Random.nextFloat32(ran: Random[r]): Float32 \ r

def Jls.Random.nextFloat64(ran: Random[r]): Float64 \ r

def Jls.Random.nextInt32(ran: Random[r]): Int32 \ r

def Jls.Random.nextInt64(ran: Random[r]): Int64 \ r

def Jls.Random.nextGaussian(ran: Random[r]): Float64 \ r

def Jls.Random.nextNatWithMax(ran: Random[r], m: Int32): Int32 \ r

```
