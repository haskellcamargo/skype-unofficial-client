##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
##

RESOURCE = ./resource
BIN = ./bin
SRC = ./src
DESTDIR = /opt/skype_unofficial_client
SHARE_APPS_DIR = /usr/share/applications
SHARE_APPS_FILE = $(SHARE_APPS_DIR)/skype-desktop.desktop
SYS_BIN_DIR = /usr/bin
SYS_BIN_FILE = $(SYS_BIN_DIR)/skype-desktop
PREFIX = 

linux_x64: create_bin create_link_to_lib_if_exists create_desktop_shortcut copy_source
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	cp -p -f -R $(BIN)/linux_x64/* $(PREFIX)$(DESTDIR)/
	chmod +x $(PREFIX)$(DESTDIR)/skype
	
linux_x86: create_bin create_link_to_lib_if_exists create_desktop_shortcut copy_source
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	cp -p -f -R $(BIN)/linux_x86/* $(PREFIX)$(DESTDIR)/
	chmod +x $(PREFIX)$(DESTDIR)/skype

copy_source:
	mkdir -p $(PREFIX)$(DESTDIR)/js || echo "Skip"
	cp -p -f $(SRC)/package.json $(PREFIX)$(DESTDIR)/
	cp -p -f $(SRC)/skype.html $(PREFIX)$(DESTDIR)/
	cp -p -f -R $(SRC)/js/* $(PREFIX)$(DESTDIR)/js
	cp -p -f -R $(RESOURCE)/skypeweb/* $(PREFIX)$(DESTDIR)/
	

create_bin:
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	mkdir -p $(PREFIX)$(SYS_BIN_DIR) || echo "Skip"
	echo '#!/bin/sh' > $(PREFIX)$(SYS_BIN_FILE)
	echo "cd $(PREFIX)$(DESTDIR)" >> $(PREFIX)$(SYS_BIN_FILE)
	echo './skype --enable-spell-checking' >> $(PREFIX)$(SYS_BIN_FILE)
	chmod +x $(PREFIX)$(SYS_BIN_FILE)


create_desktop_shortcut:
	mkdir -p $(PREFIX)$(SHARE_APPS_DIR) || echo "Skip"
	echo "[Desktop Entry]" > $(PREFIX)$(SHARE_APPS_FILE)
	echo "Version=1.0" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "Type=Application" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "Name=Skype" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "Comment=An unofficial client of Skype for Linux, running on top of Node Webkit." >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "Icon=$(PREFIX)/opt/skype_unofficial_client/skype.png" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "Exec=$(PREFIX)/opt/skype_unofficial_client/skype --enable-spell-checking %U" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "StartupWMClass=crx_monljlleikpphbhopghghdbggidfahha" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "NoDisplay=false" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "Categories=Network;" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "StartupNotify=false" >> $(PREFIX)$(SHARE_APPS_FILE)
	echo "Terminal=false" >> $(PREFIX)$(SHARE_APPS_FILE)


create_link_to_lib_if_exists:
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	if [ -d /opt/google/chrome/PepperFlash ] && [ ! -d $(PREFIX)$(DESTDIR)/PepperFlash ]; then ln -s /opt/google/chrome/PepperFlash $(PREFIX)$(DESTDIR)/PepperFlash; fi
	if [ -d ~/.config/chromium/PepperFlash ] && [ ! -d $(PREFIX)$(DESTDIR)/PepperFlash ]; then ln -s ~/.config/chromium/PepperFlash $(PREFIX)$(DESTDIR)/PepperFlash; fi
	if [ -d /usr/lib/PepperFlash ] && [ ! -d $(PREFIX)$(DESTDIR)/PepperFlash ]; then ln -s /usr/lib/PepperFlash $(PREFIX)$(DESTDIR)/PepperFlash; fi


