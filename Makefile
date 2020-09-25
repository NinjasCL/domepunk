DOME_VERSION = 1.2.1
.PHONY: test dm dl clean

dl dome-linux:
	wget https://github.com/avivbeeri/dome/releases/download/v${DOME_VERSION}/dome-${DOME_VERSION}-linux-x64.zip
	unzip dome-${DOME_VERSION}-linux-x64.zip
	rm -f dome-${DOME_VERSION}-linux-x64.zip
	rm -f main.wren

dm dome-macos:
	wget https://github.com/avivbeeri/dome/releases/download/v${DOME_VERSION}/dome-${DOME_VERSION}-macosx-x64.zip
	unzip dome-${DOME_VERSION}-macosx-x64.zip
	rm -f dome-${DOME_VERSION}-macosx-x64.zip
	rm -f main.wren

c clean:
	rm -f dome-${DOME_VERSION}-linux-x64.zip
	rm -f dome-${DOME_VERSION}-macosx-x64.zip
	rm -f dome
	rm -f main.wren

t test:
	./dome src/test/utils/Ease.test.wren
