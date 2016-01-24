##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
##

RESOURCE = ./resource
BIN = ./bin
SRC = ./src
DESTDIR = /opt/skype_unofficial_client/
PREFIX = 

linux_x64:
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	cp -p -f $(SRC)/package.json $(BIN)/linux_x64
	cp -p -f $(SRC)/skype.html $(BIN)/linux_x64
	mkdir -p $(BIN)/linux_x64/js || echo "Skip"
	cp -p -f -R $(SRC)/js/* $(BIN)/linux_x64/js
	cp -p -f -R $(BIN)/linux_x64/* $(PREFIX)$(DESTDIR)
	chmod +x -R $(PREFIX)$(DESTDIR)
	cp -p -f $(SRC)/skype-desktop.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp -p -f $(SRC)/skype-desktop $(PREFIX)/usr/bin

linux_x86:
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	cp -p -f $(SRC)/package.json $(BIN)/linux_x86
	cp -p -f $(SRC)/skype.html $(BIN)/linux_x86
	mkdir -p $(BIN)/linux_x86/js || echo "Skip"
	cp -p -f -R $(SRC)/js/* $(BIN)/linux_x86/js
	cp -p -f -R $(BIN)/linux_x86/* $(PREFIX)$(DESTDIR)
	chmod +x -R $(PREFIX)$(DESTDIR)
	cp -p -f $(SRC)/skype-desktop.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp -p -f $(SRC)/skype-desktop $(PREFIX)/usr/bin


