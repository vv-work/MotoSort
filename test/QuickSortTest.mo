mport Array "mo:base/Array";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import M "mo:matchers/Matchers";
import Nat "../src/Nat";
import Result "mo:base/Result";
import Suite "mo:matchers/Suite";
import T "mo:matchers/Testable";
import Text "mo:base/Text";

let sort = Suite.suite("sort", [
  Suite.test("empty array",
    Array.sort([], Nat.compare),
    M.equals(arrayNat([]))
  ),
  Suite.test("already sorted",
    Array.sort([1, 2, 3, 4, 5], Nat.compare),
    M.equals(arrayNat([1, 2, 3, 4, 5]))
  ),
  Suite.test("reversed array",
    Array.sort([3, 2, 1], Nat.compare),
    M.equals(arrayNat([1, 2, 3]))
  ),
  Suite.test("repeated elements",
    Array.sort([2, 2, 2, 2, 2], Nat.compare),
    M.equals(arrayNat([2, 2, 2, 2, 2]))
  )
]);

let suite = Suite.suite("Array", [
  mapResult,
  sort,
  Suite.test(
    "append",
    Array.append<Int>([ 1, 2, 3 ], [ 4, 5, 6 ]),
    M.equals(T.array<Int>(T.intTestable, [ 1, 2, 3, 4, 5, 6 ]))),
  Suite.test(
    "chain",
    do {
      let purePlusOne = func (x : Int) : [Int] { [ x + 1 ] };
      Array.chain<Int, Int>([ 0, 1, 2 ], purePlusOne);
    },
    M.equals(T.array<Int>(T.intTestable, [ 1, 2, 3 ]))
  ),
  Suite.test(
    "filter",
    do {
      let isEven = func (x : Nat) : Bool { x % 2 == 0 };
      Array.filter([ 1, 2, 3, 4, 5, 6 ], isEven);
    },
    M.equals(T.array<Nat>(T.natTestable, [ 2, 4, 6 ]))
  ),
  Suite.test(
    "mapFilter",
    do {
      let isEven = func (x : Nat) : ?Nat { if (x % 2 == 0) ?x else null };
      Array.mapFilter([ 1, 2, 3, 4, 5, 6 ], isEven);
    },
    M.equals(T.array<Nat>(T.natTestable, [ 2, 4, 6 ]))
  ),
  findTest,
  Suite.test(
    "foldLeft",
    Array.foldLeft<Text, Text>([ "a", "b", "c" ], "", Text.concat),
    M.equals(T.text("abc"))
  ),
  Suite.test(
    "foldRight",
    Array.foldRight<Text, Text>([ "a", "b", "c" ], "", Text.concat),
    M.equals(T.text("abc"))
  ),
  Suite.test(
    "freeze",
    do {
      var xs : [var Int] = [ var 1, 2, 3 ];
      Array.freeze<Int>(xs);
    },
    M.equals(T.array<Int>(T.intTestable, [ 1, 2, 3 ]))
  ),
  Suite.test(
    "flatten",
    Array.flatten<Int>([ [ 1, 2, 3 ] ]),
    M.equals(T.array<Int>(T.intTestable, [ 1, 2, 3 ]))
  ),
  Suite.test(
    "map",
    do {
      let isEven = func (x : Int) : Bool {
        x % 2 == 0;
      };

      Array.map<Int, Bool>([ 1, 2, 3, 4, 5, 6 ], isEven);
    },
    M.equals(T.array<Bool>(T.boolTestable, [ false, true, false, true, false, true ]))
  ),
  mapEntriesTest,
  Suite.test(
    "make",
    Array.make<Int>(0),
    M.equals(T.array<Int>(T.intTestable, [0]))
  ),
  Suite.test(
    "thaw",
    do {
      let xs : [Int] = [ 1, 2, 3 ];
      Array.freeze(Array.thaw<Int>(xs))
    },
    M.equals(T.array<Int>(T.intTestable, [ 1, 2, 3]))
  ),
  Suite.test(
    "tabulateVar",
    do {
      // regression test for (fixed) issues in base cases, where func was called too often:
      let test0 = Array.tabulateVar<Nat>(0, func (i:Nat) { assert(false); 0 });
      let test1 = Array.tabulateVar<Nat>(1, func (i:Nat) { assert(i < 1); 0 });
      let test2 = Array.tabulateVar<Nat>(2, func (i:Nat) { assert(i < 2); 0 });
      let test3 = Array.tabulateVar<Nat>(3, func (i:Nat) { assert(i < 3); 0 });
      0
    },
    M.equals(T.nat(0))
  ),
  Suite.test(
    "reverse",
    Array.reverse<Nat>([0, 1, 2, 3]),
    M.equals(T.array<Nat>(T.natTestable, [3, 2, 1, 0]))
  )
]);

Suite.run(suite);