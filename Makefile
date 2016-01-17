##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
#
RESOURCE = ./resource
BIN = ./bin
SRC = ./src
PREFIX = 

linux_x64:
	cp -p $(SRC)/package.json $(BIN)/linux_x64
	rm -rf $(PREFIX)/opt/skype_unofficial_client
	mkdir -p $(PREFIX)/opt/skype_unofficial_client
	cp -p -R $(BIN)/linux_x64/* $(PREFIX)/opt/skype_unofficial_client
	chmod +x -R $(PREFIX)/opt/skype_unofficial_client
	rm -f $(PREFIX)/usr/share/applications/Skype.desktop
	rm -f $(PREFIX)/usr/share/applications/skype.desktop
	cp -p $(SRC)/Skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	rm -f $(PREFIX)/usr/bin/skype-desktop
	cp -p $(SRC)/skype-desktop $(PREFIX)/usr/bin
         
linux_x86:
	cp -p $(SRC)/package.json $(BIN)/linux_x86
	rm -rf $(PREFIX)/opt/skype_unofficial_client
	mkdir -p $(PREFIX)/opt/skype_unofficial_client
	cp -p -R $(BIN)/linux_x86/* $(PREFIX)/opt/skype_unofficial_client
	chmod +x -R $(PREFIX)/opt/skype_unofficial_client
	rm -f $(PREFIX)/usr/share/applications/Skype.desktop
	rm -f $(PREFIX)/usr/share/applications/skype.desktop
	cp -p $(SRC)/Skype.desktop $(PREFIX)/usr/share/applications
	chmod +x $(SRC)/skype-desktop
	rm -f $(PREFIX)/usr/bin/skype-desktop
	cp -p $(SRC)/skype-desktop $(PREFIX)/usr/bin
