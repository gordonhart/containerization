all: submodules build push

submodules:
	git submodule init
	git submodule update

build:
	cd base; ./build.sh

push:
	cd base; ./push.sh
