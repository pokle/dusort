build: dusort.pl test/*
	rm -rf build
	mkdir -p build
	test/dusort-test.sh
