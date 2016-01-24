try {
    win.on('minimize', function() {                                              // Get the minimize event
        this.hide();                                                            // Hide window
        var tray = new gui.Tray({ title: "Skype", icon: 'skype.png' });        // Show tray and create a tray icon
        tray.on('click', function() {                                         // Show window and remove tray when clicked
        win.show();
        this.remove();                                                   
        tray = null;
        });
    });
    var __dirname = document.currentScript.src.slice(7, document.currentScript.src.lastIndexOf('.js'));
    console.log(__dirname + " script successfully loaded");    
}
catch(err) {
    console.log(err.message + "in" + __dirname);
}         


