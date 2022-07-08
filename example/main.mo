import Debug "mo:base/Debug";
import Sorting "../src/Sorting";

let arr:[Nat] = [3,5,4,2,1];

let nArr = Sorting.swap(arr,0,1);

Debug.print(debug_show(nArr));