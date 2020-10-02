.PHONY: update download template build clean

b build:
	make update
	make template

t template:
	cat ./wrenalyzer.wren ./template.wren > linter.wren

d download:
	# Download
	rm -rf wrenalyzer
	wget -O wrenalyzer.zip https://github.com/munificent/wrenalyzer/archive/master.zip
	unzip wrenalyzer.zip
	mv wrenalyzer-master wrenalyzer
	rm -f wrenalyzer.zip

u update:
	make download

	# Headers
	echo "/** doc-disable */" > wrenalyzer.wren
	echo "// automatically generated from https://github.com/munificent/wrenalyzer/archive/master.zip" >> wrenalyzer.wren
	echo "/*" >> wrenalyzer.wren
	cat ./wrenalyzer/LICENSE >> wrenalyzer.wren
	echo "*/" >> wrenalyzer.wren

	# Code
	cat ./wrenalyzer/ast.wren >> wrenalyzer.wren
	cat ./wrenalyzer/chars.wren >> wrenalyzer.wren
	cat ./wrenalyzer/token.wren >> wrenalyzer.wren
	cat ./wrenalyzer/visitor.wren >> wrenalyzer.wren

	# Remove imports since they are in the same file
	cat ./wrenalyzer/lexer.wren | sed 1,2d >> wrenalyzer.wren
	cat ./wrenalyzer/source_file.wren | sed 1d >> wrenalyzer.wren
	cat ./wrenalyzer/scope.wren | sed 1d >> wrenalyzer.wren
	cat ./wrenalyzer/reporter.wren | sed 1d >> wrenalyzer.wren
	cat ./wrenalyzer/resolver.wren | sed 1,2d >> wrenalyzer.wren
	cat ./wrenalyzer/parser.wren | sed 1,34d >> wrenalyzer.wren
	rm -rf wrenalyzer

c clean:
	rm -f DOME-out.log
	rm -rf temp
	mkdir temp
	touch temp/.gitkeep
