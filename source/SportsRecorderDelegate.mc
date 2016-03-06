using Toybox.WatchUi as Ui;

class SportsRecorderDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new SportsRecorderMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

}