import Sorting "../src/Sorting";

import Order "mo:base/Order";
import Nat "mo:base/Nat";

import M "mo:matchers/Matchers";
import S "mo:matchers/Suite";
import T "mo:matchers/Testable";
 
let unsortedArr:[Nat] = [9,3,2,5,7,1,5,4];
let sortedArr:[Nat] = [1,2,3,4,5];

let isUnsortedSorted = Sorting.IsSorted(unsortedArr , Nat.compare);
let isSortedSorted = Sorting.IsSorted(sortedArr , Nat.compare);


let suite = S.suite("IsSorted()", [
    S.test("Is unsorted sorted",
      isUnsortedSorted,
      M.equals(T.bool(false))),
    S.test("anna is a palindrome",
      isSortedSorted,
      M.equals(T.bool(true)))
]);

S.run(suite);