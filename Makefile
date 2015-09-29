##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
#
RESOURCE = ./resource
BIN = ./bin
SRC = ./src
PREFIX = 

linux_x64:
	cp $(RESOURCE)/skype.png $(PREFIX)/usr/share/icons/hicolor/512x512/apps/
	cp $(SRC)/package.json $(BIN)/linux_x64
	mkdir -p $(PREFIX)/opt/skype_unofficial_client
	cp -R $(BIN)/linux_x64/* $(PREFIX)/opt/skype_unofficial_client
	chmod +x -R $(PREFIX)/opt/skype_unofficial_client
	cp $(SRC)/Skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp $(SRC)/skype-desktop $(PREFIX)/usr/bin
         
linux_x86:
	cp $(RESOURCE)/skype.png $(PREFIX)/usr/share/icons/hicolor/512x512/apps/
	cp $(SRC)/package.json $(BIN)/linux_x86
	mkdir -p $(PREFIX)/opt/skype_unofficial_client
	cp -R $(BIN)/linux_x86/* $(PREFIX)/opt/skype_unofficial_client
	chmod +x -R $(PREFIX)/opt/skype_unofficial_client
	cp $(SRC)/Skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp $(SRC)/skype-desktop $(PREFIX)/usr/bin
