DOME_VERSION = 1.2.1
WREN_VERSION = 0.3.0

.PHONY: test dm dl clean docs wm wl

t test:
	./dome --debug main.test.wren

c clean:
	rm -f dome-${DOME_VERSION}-linux-x64.zip
	rm -f dome-${DOME_VERSION}-macosx-x64.zip
	rm -f wren_cli-mac-${WREN_VERSION}.zip
	rm -f wren_cli-linux-${WREN_VERSION}.zip
	rm -f dome
	rm -f wren
	rm -f main.wren

d docs:
	python3 ./tools/docs/__main__.py .

dm dome-macos:
	wget https://github.com/avivbeeri/dome/releases/download/v${DOME_VERSION}/dome-${DOME_VERSION}-macosx-x64.zip
	unzip -o dome-${DOME_VERSION}-macosx-x64.zip
	rm -f dome-${DOME_VERSION}-macosx-x64.zip
	rm -f main.wren

dl dome-linux:
	wget https://github.com/avivbeeri/dome/releases/download/v${DOME_VERSION}/dome-${DOME_VERSION}-linux-x64.zip
	unzip -o dome-${DOME_VERSION}-linux-x64.zip
	rm -f dome-${DOME_VERSION}-linux-x64.zip
	rm -f main.wren

wm wren-macos:
	wget https://github.com/wren-lang/wren-cli/releases/download/${WREN_VERSION}/wren_cli-mac-${WREN_VERSION}.zip
	unzip -o wren_cli-mac-${WREN_VERSION}.zip
	rm -f wren_cli-mac-${WREN_VERSION}.zip
	rm -f readme.md
	mv wren_cli wren

wl wren-linux:
	wget https://github.com/wren-lang/wren-cli/releases/download/${WREN_VERSION}/wren_cli-linux-${WREN_VERSION}.zip
	unzip -o wren_cli-linux-${WREN_VERSION}.zip
	rm -f wren_cli-linux-${WREN_VERSION}.zip
	rm -f wren_cli-linux-${WREN_VERSION}/readme.md
	mv wren_cli-linux-${WREN_VERSION}/wren_cli wren
	rm -rf wren_cli-linux-${WREN_VERSION}
