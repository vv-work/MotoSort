# MotoSort

!["Bubble Sort gif"](./res/BubbleSort_Avg_case.gif)

> Bubble sort example onlie

Implementaion of difrent sorting algorithms in the motoko

## Getting started
<br/>

Easy to use, expressive API:

```motoko
...
import Debug "mo:base/Debug";
import Sorter "mo:sort/Sorter;

let arr:[Nat] = [5,2,3,4,1];	

//By default it uses Merge Sort
sorted = Sorter.Sort(arr);

//If needed can call
quickSort = Sorter.QueickSort(arr);

Debug.print(debug_show(sorted));
Debug.print(debug_show(quickSort));

);
```
## Sorting Implementations

### Merge Sort

!["Merge Sort gif"](./res/MergeSort_Avg_case.gif)


### Selection Sort

!["Selection Sort gif"](./res/SelectionSort_Avg_case.gif)

## Documentation

Further documentation for the latest release can be found at `docs` folder

If you'd like to generate documentation locally run $(vessel bin)/mo-doc && firefox docs/index.html
<br/>
<br/>

## Example
See the [example folder](https://github.com/ByronBecker/motoko-color/tree/main/example) for usage,
making sure that both [vessel](https://github.com/dfinity/vessel) and [wasmtime](https://wasmtime.dev/) are installed before running `make run-example` from the root directory.

<br/>
<br/>
<br/>
<br/>

## Credits
Credits to: 
-  [Ivan Miroshnichenko](https://github.com/Voice-of-Hollowness) for participation in developement
-  [Byson Becker](https://github.com/ByronBecker) for mentering in developement.
<br/>
<br/>

## License

motoko-color is distributed under the terms of the Apache License (Version 2.0).

See LICENSE for details.
