DOME_VERSION = 1.2.1
WREN_VERSION = 0.3.0

.PHONY: test dm dl clean docs wm wl

wm wren-macos:
	wget https://github.com/wren-lang/wren-cli/releases/download/${WREN_VERSION}/wren_cli-mac-${WREN_VERSION}.zip
	unzip wren_cli-mac-${WREN_VERSION}.zip
	rm -f wren_cli-mac-${WREN_VERSION}.zip
	rm -f readme.md
	mv wren_cli wren

dm dome-macos:
	wget https://github.com/avivbeeri/dome/releases/download/v${DOME_VERSION}/dome-${DOME_VERSION}-macosx-x64.zip
	unzip dome-${DOME_VERSION}-macosx-x64.zip
	rm -f dome-${DOME_VERSION}-macosx-x64.zip
	rm -f main.wren

dl dome-linux:
	wget https://github.com/avivbeeri/dome/releases/download/v${DOME_VERSION}/dome-${DOME_VERSION}-linux-x64.zip
	unzip dome-${DOME_VERSION}-linux-x64.zip
	rm -f dome-${DOME_VERSION}-linux-x64.zip
	rm -f main.wren

wl wren-linux:
	wget https://github.com/wren-lang/wren-cli/releases/download/${WREN_VERSION}/wren_cli-linux-${WREN_VERSION}.zip
	unzip wren_cli-linux-${WREN_VERSION}.zip
	rm -f wren_cli-linux-${WREN_VERSION}.zip
	rm -f readme.md
	mv wren_cli wren

c clean:
	rm -f dome-${DOME_VERSION}-linux-x64.zip
	rm -f dome-${DOME_VERSION}-macosx-x64.zip
	rm -f dome
	rm -f main.wren

t test:
	./dome --debug main.test.wren

d docs:
	python3 ./tools/docs/__main__.py .
