try {
    win.on('new-win-policy', function (frame, url, policy) {
        gui.Shell.openExternal(url);
        //notify("asd");
        policy.ignore();
    });
    var __dirname = document.currentScript.src.slice(7, document.currentScript.src.lastIndexOf('.js'));
    console.log(__dirname + " script successfully loaded");    
}
catch(err) {
    console.log(err.message + "in" + __dirname);
}         
