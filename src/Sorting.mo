import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Char "mo:base/Char";

import Array "mo:base/Array";
import Order "mo:base/Order";

import Int "mo:base/Int";
import Nat "mo:base/Nat";



module {

public func swap(arr:[Nat],i:Nat,j:Nat):[Nat]{

    let mArr = Array.thaw<Nat>(arr);
    let tmp = arr[i];
    mArr[i] := mArr[j];
    mArr[j] := tmp;
    return(Array.freeze<Nat>(mArr));
};



public func SelectionSort(arr:[Nat]):[Nat]
{
    return arr;

};

}