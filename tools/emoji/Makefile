.PHONY: emoji update

e emoji:
	python3 . > ../../domepunk/misc/emoji/codes.wren
	cat ../../domepunk/misc/emoji/*.wren > ../../domepunk/misc/emoji.wren

u update:
	wget -O codes.py https://raw.githubusercontent.com/carpedm20/emoji/master/emoji/unicode_codes.py
	wget -O LICENSE https://raw.githubusercontent.com/carpedm20/emoji/master/LICENSE.txt
	echo '# -*- coding: UTF-8 -*-' > emojis.py
	echo '"""' >> emojis.py
	cat ./LICENSE >> emojis.py
	echo '\n"""\n' >> emojis.py
	cat ./codes.py >> emojis.py
	rm -f ./LICENSE
	rm -f ./codes.py

