.PHONY: build
build: $(wildcard src/*)
	mkdir -p build/
	cd src/ && zip -r ../build/clear-top-bar@superterran.net.zip .

.PHONY: clean
clean:
	rm -rf build/
