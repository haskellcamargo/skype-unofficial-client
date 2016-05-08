##
# Copyright 2015 - Marcelo Camargo <marcelocamargo@linuxmail.org>
##

RESOURCE = ./resource
BIN = ./bin
SRC = ./src
DESTDIR = /opt/skype_unofficial_client/
PREFIX = 

linux_x64: create_bin create_link_to_lib_if_exists create_desktop_shortcut
	mkdir -p $(PREFIX)$(DESTDIR)/js || echo "Skip"
	mkdir -p $(PREFIX)/usr/share/applications || echo "Skip"
	cp -p -f $(SRC)/package.json $(PREFIX)$(DESTDIR)/
	cp -p -f $(SRC)/skype.html $(PREFIX)$(DESTDIR)/
	cp -p -f -R $(BIN)/linux_x64/* $(PREFIX)$(DESTDIR)
	cp -p -f -R $(SRC)/js/* $(PREFIX)$(DESTDIR)/js
	cp -p -f -R $(RESOURCE)/skypeweb/* $(PREFIX)$(DESTDIR)/
	chmod +x $(PREFIX)$(DESTDIR)/skype
	
linux_x86: create_bin create_link_to_lib_if_exists create_desktop_shortcut
	mkdir -p $(PREFIX)$(DESTDIR)/js || echo "Skip"
	mkdir -p $(PREFIX)/usr/share/applications || echo "Skip"
	cp -p -f $(SRC)/package.json $(PREFIX)$(DESTDIR)/
	cp -p -f $(SRC)/skype.html $(PREFIX)$(DESTDIR)/
	cp -p -f -R $(BIN)/linux_x86/* $(PREFIX)$(DESTDIR)
	cp -p -f -R $(SRC)/js/* $(PREFIX)$(DESTDIR)/js
	cp -p -f -R $(RESOURCE)/skypeweb/* $(PREFIX)$(DESTDIR)/
	chmod +x $(PREFIX)$(DESTDIR)/skype


create_bin:
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	mkdir -p $(PREFIX)/usr/bin || echo "Skip"
	echo '#!/bin/sh' > $(PREFIX)/usr/bin/skype-desktop
	echo "cd $(PREFIX)$(DESTDIR)" >> $(PREFIX)/usr/bin/skype-desktop
	echo './skype --enable-spell-checking' >> $(PREFIX)/usr/bin/skype-desktop
	chmod +x $(PREFIX)/usr/bin/skype-desktop


create_desktop_shortcut:
	mkdir -p $(PREFIX)/usr/share/applications/ || echo "Skip"
	echo "[Desktop Entry]" > $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Version=1.0" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Type=Application" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Name=Skype" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Comment=An unofficial client of Skype for Linux, running on top of Node Webkit." >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Icon=$(PREFIX)/opt/skype_unofficial_client/skype.png" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Exec=$(PREFIX)/opt/skype_unofficial_client/skype --enable-spell-checking %U" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "StartupWMClass=crx_monljlleikpphbhopghghdbggidfahha" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "NoDisplay=false" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Categories=Network;" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "StartupNotify=false" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop
	echo "Terminal=false" >> $(PREFIX)/usr/share/applications/skype-desktop.desktop


create_link_to_lib_if_exists:
	mkdir -p $(PREFIX)$(DESTDIR) || echo "Skip"
	if [ -d /opt/google/chrome/PepperFlash ] && [ ! -d $(PREFIX)$(DESTDIR)/PepperFlash ]; then ln -s /opt/google/chrome/PepperFlash $(PREFIX)$(DESTDIR)/PepperFlash; fi
	if [ -d ~/.config/chromium/PepperFlash ] && [ ! -d $(PREFIX)$(DESTDIR)/PepperFlash ]; then ln -s ~/.config/chromium/PepperFlash $(PREFIX)$(DESTDIR)/PepperFlash; fi
	if [ -d /usr/lib/PepperFlash ] && [ ! -d $(PREFIX)$(DESTDIR)/PepperFlash ]; then ln -s /usr/lib/PepperFlash $(PREFIX)$(DESTDIR)/PepperFlash; fi


