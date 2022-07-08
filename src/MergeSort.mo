import Array "mo:base/Array";
import Order "mo:base/Order";
import Int "mo:base/Int";

module MergeSort {

  /// Sorts the given array according to the `cmp` function.
  /// This is a _stable_ sort.
  ///
  /// ```motoko
  /// import Array "mo:base/Array";
  /// import Nat "mo:base/Nat";
  /// let xs = [4, 2, 6];
  /// assert(Array.sort(xs, Nat.compare) == [2, 4, 6])
  /// ```
  public func sort<A>(xs : [A], cmp : (A, A) -> Order.Order) : [A] {
    let tmp : [var A] = thaw(xs);
    sortInPlace(tmp, cmp);
    freeze(tmp)
  };

  /// Sorts the given array in place according to the `cmp` function.
  /// This is a _stable_ sort.
  ///
  /// ```motoko
  /// import Array "mo:base/Array";
  /// import Nat "mo:base/Nat";
  /// let xs : [var Nat] = [var 4, 2, 6, 1, 5];
  /// Array.sortInPlace(xs, Nat.compare);
  /// assert(Array.freeze(xs) == [1, 2, 4, 5, 6])
  /// ```
  public func sortInPlace<A>(xs : [var A], cmp : (A, A) -> Order.Order) {
    if (xs.size() < 2) return;
    let aux : [var A] = tabulateVar<A>(xs.size(), func i { xs[i] });

    func merge(lo : Nat, mid : Nat, hi : Nat) {
      var i = lo;
      var j = mid + 1;
      var k = lo;
      while(k <= hi) {
        aux[k] := xs[k];
        k += 1;
      };
      k := lo;
      while(k <= hi) {
        if (i > mid) {
          xs[k] := aux[j];
          j += 1;
        } else if (j > hi) {
          xs[k] := aux[i];
          i += 1;
        } else if (Order.isLess(cmp(aux[j], aux[i]))) {
          xs[k] := aux[j];
          j += 1;
        } else {
          xs[k] := aux[i];
          i += 1;
        };
        k += 1;
      };
    };
};
