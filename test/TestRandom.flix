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

use Jls.Random

@test
def testOneOf01(): Option[Int32] \ IO = region rc {
    let rnd = Random.freshWithSystemSeed(rc);
    let arr = Array.repeat(rc, 10, 42i32);
    Random.oneOf(rnd, arr)
}

@test
def testOneOf02(): Option[String] \ IO = region rc {
    let rnd = Random.freshWithSystemSeed(rc);
    let arr = Array.repeat(rc, 10, "Hello World");
    Random.oneOf(rnd, arr)
}

@test
def testOneOf03(): Option[Result[Int32, Int32]] \ IO = region rc {
    let rnd = Random.freshWithSystemSeed(rc);
    let arr = Array#{Ok(123), Ok(456), Err(789)} @ rc;
    Random.oneOf(rnd, arr)
}

@test
def testNextBool(): Bool = region rc {
    let r = Random.fresh(rc, 0i64);
    Random.nextBool(r)
}

@test
def testNextFloat32(): Float32 \ IO = region rc {
    let r = Random.freshWithSystemSeed(rc);
    Random.nextFloat32(r)
}

@test
def testNextFloat64(): Float64 \ IO = region rc {
    let r = Random.freshWithSystemSeed(rc);
    Random.nextFloat64(r)
}

@test
def testNextGaussian(): Float64 \ IO = region rc {
    let r = Random.freshWithSystemSeed(rc);
    Random.nextGaussian(r)
}

@test
def testNextInt32(): Int32 \ IO = region rc {
    let r = Random.freshWithSystemSeed(rc);
    Random.nextInt32(r)
}

@test
def testNextInt64(): Int64 \ IO = region rc {
    let r = Random.freshWithSystemSeed(rc);
    Random.nextInt64(r)
}

@test
def testNextNatWithMax(): Int32 \ IO = region rc {
    let r = Random.freshWithSystemSeed(rc);
    Random.nextNatWithMax(r, 100)
}
