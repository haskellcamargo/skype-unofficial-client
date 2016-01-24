##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
#

RESOURCE = ./resource
BIN = ./bin
SRC = ./src
DESTDIR = /opt/skype_unofficial_client/
PREFIX = 


linux_x64:
	rm -rf $(BIN)/linux_x64/js
	rm -rf $(PREFIX)$(DESTDIR)
	rm -f $(PREFIX)/usr/bin/skype-desktop
	rm -f $(PREFIX)/usr/share/applications/skype.desktop
	mkdir -p $(PREFIX)$(DESTDIR)
	cp -p $(SRC)/package.json $(BIN)/linux_x64
	cp -p $(SRC)/skype.html $(BIN)/linux_x64
	mkdir $(BIN)/linux_x64/js
	cp -p -R $(SRC)/js/* $(BIN)/linux_x64/js
	cp -p -R $(BIN)/linux_x64/* $(PREFIX)$(DESTDIR)
	chmod +x -R $(PREFIX)$(DESTDIR)
	cp -p $(SRC)/skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp -p $(SRC)/skype-desktop $(PREFIX)/usr/bin

linux_x86:
	rm -rf $(BIN)/linux_x86/js
	rm -rf $(PREFIX)$(DESTDIR)
	rm -f $(PREFIX)/usr/bin/skype-desktop
	rm -f $(PREFIX)/usr/share/applications/skype.desktop
	mkdir -p $(PREFIX)$(DESTDIR)
	cp -p $(SRC)/package.json $(BIN)/linux_x86
	cp -p $(SRC)/skype.html $(BIN)/linux_x86
	mkdir $(BIN)/linux_x86/js
	cp -p -R $(SRC)/js/* $(BIN)/linux_x86/js
	cp -p -R $(BIN)/linux_x86/* $(PREFIX)$(DESTDIR)
	chmod +x -R $(PREFIX)$(DESTDIR)
	cp -p $(SRC)/skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp -p $(SRC)/skype-desktop $(PREFIX)/usr/bin
