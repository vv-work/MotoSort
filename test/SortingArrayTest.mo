import Sorting "../src/Sorting";

import Debug "mo:base/Debug";
import Order "mo:base/Order";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Array "mo:base/Array";

import M "mo:matchers/Matchers";
import S "mo:matchers/Suite";
import T "mo:matchers/Testable";
 

//Testing for Nat
let unsortedArr:[Nat] = [9,3,2,5,7,1,5,4];
let sortedArr:[Nat] = [1,2,3,4,5];

let isUnsortedSorted = Sorting.IsSorted(unsortedArr , Nat.compare);
let isSortedSorted = Sorting.IsSorted(sortedArr , Nat.compare);


//Testing for Char
let sortedC :[Char] =Iter.toArray( "abcde".chars());
let unsortedC :[Char] = Iter.toArray("uiqdgcs".chars());

let isUnsortedSortedChar = Sorting.IsSorted(unsortedC , Char.compare);
let isSortedSortedChar = Sorting.IsSorted(sortedC , Char.compare);


let isSorted = S.suite("IsSorted()", [

// Nat Tests
    S.test("Is unsorted Nat IsSorted()",
      isUnsortedSorted,
      M.equals(T.bool(false))),
    S.test("Is sorted Nat IsSorted()",
      isSortedSorted,
      M.equals(T.bool(true))),

//Char tests
    S.test("Is unorted Char IsSorted()",
      isUnsortedSortedChar,
      M.equals(T.bool(false))),
    S.test("Is sorted Char IsSorted()",
      isSortedSortedChar,
      M.equals(T.bool(true)))
]);

func arrayNat(xs : [Nat]) : T.TestableItem<[Nat]> {
  T.array(T.natTestable, xs)
};

let selectionSort = S.suite("Selection Sort", [
  S.test("empty array",
    Sorting.SelectionSort([], Nat.compare),
    M.equals(arrayNat([]))
  ),
  S.test("already sorted",
    Sorting.SelectionSort([1, 2, 3, 4, 5], Nat.compare),
    M.equals(arrayNat([1, 2, 3, 4, 5]))
  ),
  S.test("reversed array",
    Sorting.SelectionSort([3, 2, 1], Nat.compare),
    M.equals(arrayNat([1, 2, 3]))
  ),
  S.test("repeated elements",
    Sorting.SelectionSort([2, 2, 2, 2, 2], Nat.compare),
    M.equals(arrayNat([2, 2, 2, 2, 2]))
  )
]);


let suite = S.suite("Array", [
  isSorted,
  selectionSort
]);

S.run(suite);
