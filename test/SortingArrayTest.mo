import Sorting "../src/Sorting";

import M "mo:matchers/Matchers";
import S "mo:matchers/Suite";
import T "mo:matchers/Testable";
 
let unsortedArr = [9,3,2,5,7,1,5,4];

let isIt = IsSorted<X>(unsortedArr , f : (X, X) -> Order)



let suite = S.suite("isPalindrome", [
    S.test("anna is a palindrome",
      Sorting.IsSorted(),
      M.equals(T.bool(true)))
]);

S.run(suite);