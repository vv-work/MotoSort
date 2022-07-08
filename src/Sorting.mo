import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Char "mo:base/Char";
import Iter "mo:base/Iter";

import Array "mo:base/Array";
import Order "mo:base/Order";

import Int "mo:base/Int";
import Nat "mo:base/Nat";



module {

type Order = Order.Order;

private func _swap(arr:[Nat],i:Nat,j:Nat):[Nat]{

    let mArr = Array.thaw<Nat>(arr);
    let tmp = arr[i];
    mArr[i] := mArr[j];
    mArr[j] := tmp;
    return(Array.freeze<Nat>(mArr));
};
public func SwapElements(arr:[Nat],i:Nat,j:Nat):[Nat]{

  return _swap(arr,i,j);
};

public func selection_sort(array : [Nat]) : [Nat] {
    var sorted = array;
    let size = array.size();
    // First loop
    for(i in Iter.range(0, size - 1)){
      var index_minimum = i;
      // Second loop to determine the minimum in the sub array
      for(j in Iter.range(i, size - 1)){
        if(sorted[j] < sorted[index_minimum]){
          index_minimum := j;
        };
      };
    sorted := _swap(sorted, index_minimum, i);
    };  
    return(sorted);
};

public func IsSorted<X>(xs : [X], f : (X, X) -> Order) :Bool{
  return true;
};

public func SelectionSort(arr:[Nat]):  [Nat] {
    return arr;

};

}