build: submodules images

submodules:
	git submodule init
	git submodule update

images:
	cd base; ./build.sh
