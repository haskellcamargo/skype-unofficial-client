##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
#
RESOURCE = ./resource
BIN = ./bin
SRC = ./src

linux_x64:
	cp $(RESOURCE)/icon.png $(BIN)/linux_x64
	cp $(SRC)/package.json $(BIN)/linux_x64
	mkdir -p /opt/skype_unofficial_client
	cp -R $(BIN)/linux_x64/* /opt/skype_unofficial_client
	chmod +x -R /opt/skype_unofficial_client
	cp $(SRC)/Skype.desktop /usr/share/applications
	cp $(SRC)/skype-desktop /usr/bin
         
linux_x86:
	cp $(RESOURCE)/icon.png $(BIN)/linux_x86
	cp $(SRC)/package.json $(BIN)/linux_x86
	mkdir -p /opt/skype_unofficial_client
	cp -R $(BIN)/linux_x86/* /opt/skype_unofficial_client
	chmod +x -R /opt/skype_unofficial_client
	cp $(SRC)/Skype.desktop /usr/share/applications
	cp $(SRC)/skype-desktop /usr/bin