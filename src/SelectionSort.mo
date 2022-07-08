import Array "mo:base/Array";
import Order "mo:base/Order";
import Int "mo:base/Int";

module Quicksort {

  type Order = Order.Order;

  public func selectionSort(array : [Nat]) : async [Nat] {
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

};
