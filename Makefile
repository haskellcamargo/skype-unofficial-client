##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
#
RESOURCE = ./resource
BIN = ./bin
SRC = ./src
PREFIX = 

linux_x64:
	cp -p $(SRC)/package.json $(BIN)/linux_x64
	mkdir -p $(PREFIX)/opt/skype_unofficial_client
	cp -p -R $(BIN)/linux_x64/* $(PREFIX)/opt/skype_unofficial_client
	chmod +x -R $(PREFIX)/opt/skype_unofficial_client
	cp -p $(SRC)/Skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp -p $(SRC)/skype-desktop $(PREFIX)/usr/bin
         
linux_x86:
	cp -p $(SRC)/package.json $(BIN)/linux_x86
	mkdir -p $(PREFIX)/opt/skype_unofficial_client
	cp -p -R $(BIN)/linux_x86/* $(PREFIX)/opt/skype_unofficial_client
	chmod +x -R $(PREFIX)/opt/skype_unofficial_client
	cp -p $(SRC)/Skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	cp -p $(SRC)/skype-desktop $(PREFIX)/usr/bin
