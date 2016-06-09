const AVAILABLE_STATUS_CLASS = "PresencePopup-status--online";
const AWAY_STATUS_CLASS = "PresencePopup-status--idle";
const BUSY_STATUS_CLASS = "PresencePopup-status--dnd";
const HIDDEN_STATUS_CLASS = "PresencePopup-status--hidden";

var isVisible = true;

try {
	if(trayAlwaysVisible) {
		showTray();
	} else {
		showTrayWhenMinimize();
	}

	var __dirname = document.currentScript.src.slice(7, document.currentScript.src.lastIndexOf('.js'));
	console.log(__dirname + " script successfully loaded");
}
catch(err) {
	var __dirnameErr = document.currentScript.src.slice(7, document.currentScript.src.lastIndexOf('.js'));
	console.log(err.message + "in" + __dirnameErr);
}

function showTray() {
	createTray();
	win.on('minimize', function() {
		isVisible=false;
	});
	win.on('restore', function() {
		isVisible=true;
	});
}

function showTrayWhenMinimize() {
	win.on('minimize', function() {
		isVisible=false;
		this.hide();
		createTray();
	});
	win.on('restore', function() {
		isVisible=true;
	});
}

function createTray() {
	var tray = new gui.Tray({ title: "Skype", icon: 'skype.png' });
	tray.on('click', function() {
		showOrHideWindowWithOptionalRemoveTray(this);
	});
	createMenu(tray);
	return tray;
}

function showOrHideWindowWithOptionalRemoveTray(tray) {
	if(!isVisible) {
		win.show();
		if(!trayAlwaysVisible) {
			removeTray(tray);
		}
	} else {
		win.minimize();
	}
	isVisible = !isVisible;
}

function removeTray(tray) {
	tray.remove();
	tray = null;
}

function createMenu(tray) {
	var menu = new gui.Menu();
	menu.append(createShowMenuItem());
	menu.append(new gui.MenuItem({ type: 'separator' }));
	menu.append(createAvailableMenuItem());
	menu.append(createAwayMenuItem());
	menu.append(createBusyMenuItem());
	menu.append(createNotAvailableMenuItem());
	menu.append(new gui.MenuItem({ type: 'separator' }));
	menu.append(createExitMenuItem());
	tray.menu = menu;
}

function createShowMenuItem() {
	var showMenuItem = new gui.MenuItem({ label: 'Show/Hide' });
	showMenuItem.click = showOrHideWindowWithOptionalRemoveTray;
	return showMenuItem;
}

function createAvailableMenuItem() {
	var availableMenuItem = new gui.MenuItem({ label: 'Available', icon: 'available.png' });
	availableMenuItem.click = function() {
		clickStatus(AVAILABLE_STATUS_CLASS);
	};
	return availableMenuItem;
}

function createAwayMenuItem() {
	var awayMenuItem = new gui.MenuItem({ label: 'Away', icon: 'away.png' });
	awayMenuItem.click = function() {
		clickStatus(AWAY_STATUS_CLASS);
	};
	return awayMenuItem;
}

function createBusyMenuItem() {
	var busyMenuItem = new gui.MenuItem({ label: 'Busy', icon: 'busy.png' });
	busyMenuItem.click = function() {
		clickStatus(BUSY_STATUS_CLASS);
	};
	return busyMenuItem;
}

function createNotAvailableMenuItem() {
	var notAvailableMenuItem = new gui.MenuItem({ label: 'Not available', icon: 'hidden.png' });
	notAvailableMenuItem.click = function() {
		clickStatus(HIDDEN_STATUS_CLASS);
	};
	return notAvailableMenuItem;
}

function createExitMenuItem() {
	var exitMenuItem = new gui.MenuItem({ label: 'Exit' });
	exitMenuItem.click = function() {
		win.close(true);
	};
	return exitMenuItem;
}

function clickStatus(statusName) {
	var skypeFrame = getSkypeWebFrame();
	var status = getSkypeWebFrame().getElementsByClassName(statusName)
	if(status.length>0) {
		status[0].click();
	}
}

function getSkypeWebFrame() {
	return document.getElementById('skypeWebFrame').contentDocument;
}
