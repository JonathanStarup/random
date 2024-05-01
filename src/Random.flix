// Copyright 2024 Jonathan Lindegaard Starup
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

mod Jls {
///
/// Represents a random number generator.
///
pub enum Random[_r: Region](##java.util.Random)

mod Random {

    ///
    /// Returns a fresh random number generator initialized with a system chosen
    /// seed.
    ///
    pub def freshWithSystemSeed(_rc: Region[r]): Random[r] \ r + IO =
        import java_new java.util.Random(): ##java.util.Random \ r + IO as newRandom;
        Random(newRandom())

    ///
    /// Returns a fresh random number generator initialized with the given seed
    /// `s`.
    ///
    pub def fresh(_rc: Region[r], s: Int64): Random[r] \ r =
        import java_new java.util.Random(Int64): ##java.util.Random \ r as newRandom;
        Random(newRandom(s))

    ///
    /// Returns a pseudorandom element from the given array `a` using the random
    /// number generator `ran`.
    ///
    /// Returns `None` if the given array `a` is empty.
    ///
    pub def oneOf(ran: Random[r1], a: Array[a, r2]): Option[a] \ r1 + r2 =
        if (Array.length(a) == 0) {
            None
        } else {
            let m = Array.length(a);
            let i = nextNatWithMax(ran, m);
            Some(Array.get(i, a))
        }

    ///
    /// Returns the next pseudorandom boolean from the given random number
    /// generator `ran`.
    ///
    pub def nextBool(ran: Random[r]): Bool \ r =
        import java.util.Random.nextBoolean(): Bool \ r;
        let Random(o) = ran;
        nextBoolean(o)

    ///
    /// Returns the next pseudorandom 32-bit floating point number from the
    /// given random number generator `ran`.
    ///
    pub def nextFloat32(ran: Random[r]): Float32 \ r =
        import java.util.Random.nextFloat(): Float32 \ r;
        let Random(o) = ran;
        nextFloat(o)

    ///
    /// Returns the next pseudorandom 64-bit floating point number from the
    /// given random number generator `ran`.
    ///
    pub def nextFloat64(ran: Random[r]): Float64 \ r =
        import java.util.Random.nextDouble(): Float64 \ r;
        let Random(o) = ran;
        nextDouble(o)

    ///
    /// Returns the next pseudorandom 32-bit integer value from the given random
    /// number generator `ran`.
    ///
    pub def nextInt32(ran: Random[r]): Int32 \ r =
        import java.util.Random.nextInt(): Int32 \ r;
        let Random(o) = ran;
        nextInt(o)

    ///
    /// Returns the next pseudorandom 64-bit integer value from the given random
    /// number generator `ran`.
    ///
    pub def nextInt64(ran: Random[r]): Int64 \ r =
        import java.util.Random.nextLong(): Int64 \ r;
        let Random(o) = ran;
        nextLong(o)

    ///
    /// Returns the next pseudorandom Gaussian distributed 64-bit floating point
    /// number.
    ///
    pub def nextGaussian(ran: Random[r]): Float64 \ r =
        import java.util.Random.nextGaussian(): Float64 \ r;
        let Random(o) = ran;
        nextGaussian(o)

    ///
    /// Returns the next pseudorandom 32-bit integer value between `0` and `m`
    /// (exclusive) using the given random number generator `ran`.
    ///
    pub def nextNatWithMax(ran: Random[r], m: Int32): Int32 \ r =
        import java.util.Random.nextInt(Int32): Int32 \ r;
        let Random(o) = ran;
        nextInt(o, m)
}

}
