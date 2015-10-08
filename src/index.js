(function () {
    var path = require('path').resolve('./resource/skype.png');
    var spawn = require('child_process').spawn;
    var gui = require('nw.gui');

    if (process.platform === 'linux') {
      window.Notification = function (title, data) {
        gui.Window.get().requestAttention(1);
        spawn('notify-send', ['-i', path, title, data.body ]);
      };
    }

    window.Notification.permission = 'granted';
})();
