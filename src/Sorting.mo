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

public func Sort<X>(arr:[X], f : (X, X) -> Order):  [X] {
    return arr;
};

public func QuickSort<X>(arr:[X], f : (X, X) -> Order):  [X] {
    return arr;
};

public func SelectionSort<X>(arr:[X], f : (X, X) -> Order):  [X] {
    return _selectionSort(arr,f);
};

public func SwapElements(arr:[Nat],i:Nat,j:Nat):[Nat]{

  return _swap(arr,i,j);
};

private func _swap<T>(arr:[T],i:Nat,j:Nat):[T]{

    let mArr = Array.thaw<T>(arr);
    let tmp = arr[i];
    mArr[i] := mArr[j];
    mArr[j] := tmp;
    return(Array.freeze<T>(mArr));
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

private func _selectionSort<X>(arr : [X],f : (X,X) -> Order) : [X] {
    var sorted = arr;
    let size = arr.size();
    // Init cycle
    for(i in Iter.range(0,size-1)){
      var min =i ;
      //Sub loop to determen minimum in subarray
      for(j in Iter.range(i,size-1)){
          if(Order.isGreater(f(sorted[min],sorted[j]))){
            min:=j;
          };
      };
      sorted := _swap(sorted,i,min);
    };

    return sorted;
};

//
public func IsSorted<X>(xs : [X], f : (X, X) -> Order) :Bool{
  let size = xs.size();
  var i = 0;

  while (i < size-1){
    if(Order.isGreater(f(xs[i], xs[i+1]))){
      return false;
    };
    i += 1;
  };
  return true;
};


}