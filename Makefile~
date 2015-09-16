##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
#
RESOURCE = ./resource
BIN = ./bin
SRC = ./src

linux_x64:
	cp $(RESOURCE)/icon.png $(BIN)/linux_x64
	cp $(SRC)/package.json $(BIN)/linux_x64
	mkdir -p /usr/bin/skype_unofficial_client
	cp -R $(BIN)/linux_x64/* /usr/bin/skype_unofficial_client
	chmod +x -R /usr/bin/skype_unofficial_client
	cp $(SRC)/Skype.desktop ~/.local/share/applications

linux_x86:
	cp $(RESOURCE)/icon.png $(BIN)/linux_x86
	cp $(SRC)/package.json $(BIN)/linux_x86
	mkdir -p /usr/bin/skype_unofficial_client
	cp -R $(BIN)/linux_x86/* /usr/bin/skype_unofficial_client
	chmod +x -R /usr/bin/skype_unofficial_client
	cp $(SRC)/Skype.desktop ~/.local/share/applications
