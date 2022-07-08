default:
	$(shell vessel bin)/moc $(shell vessel sources) -wasi-system-api -o SortingArrayTest.wasm SortingArrayTest.mo && wasmtime SortingArrayTest.wasm
	rm -f SortingArrayTest.wasm
