import Sorting "../src/Sorting";
import Debug "mo:base/Debug";
import Order "mo:base/Order";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Iter "mo:base/Iter";

import M "mo:matchers/Matchers";
import S "mo:matchers/Suite";
import T "mo:matchers/Testable";
 
let unsortedArr:[Nat] = [9,3,2,5,7,1,5,4];
let sortedArr:[Nat] = [1,2,3,4,5];


let t:Text = "abcde";
let t2:Text = "uiqdgcs";
let sortedC :[Char] =Iter.toArray( t.chars());
let unsortedC :[Char] = Iter.toArray(t2.chars());
let isUnsortedSorted = Sorting.IsSorted(unsortedArr , Nat.compare);
Debug.print(debug_show(isUnsortedSorted));
let isSortedSorted = Sorting.IsSorted(sortedArr , Nat.compare);
Debug.print(debug_show(isSortedSorted));

let isUnsortedSortedChar = Sorting.IsSorted(unsortedC , Char.compare);
Debug.print(debug_show(isUnsortedSortedChar));

let isSortedSortedChar = Sorting.IsSorted(sortedC , Char.compare);
Debug.print(debug_show(isSortedSortedChar));

let suite = S.suite("IsSorted()", [
    S.test("Is unsorted sorted",
      isUnsortedSorted,
      M.equals(T.bool(false))),
    S.test("anna is a palindrome",
      isSortedSorted,
      M.equals(T.bool(true)))
]);

S.run(suite);