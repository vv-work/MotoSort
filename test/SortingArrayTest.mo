import Sorting "../src/Sorting";

import M "mo:matchers/Matchers";
import S "mo:matchers/Suite";
import T "mo:matchers/Testable";

let suite = S.suite("isPalindrome", [
    S.test("anna is a palindrome",
      Sorting.IsSorted(),
      M.equals(T.bool(true))),

    S.test("christoph is not a palindrome",
      Sorting.IsSorted(),
      M.equals(T.bool(true))),
]);

S.run(suite);