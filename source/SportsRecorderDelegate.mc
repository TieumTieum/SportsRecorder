using Toybox.WatchUi as Ui;
using Toybox.ActivityRecording as Record;

class SportsRecorderDelegate extends Ui.BehaviorDelegate {

    var parentView;

    function initialize( view ) {
        BehaviorDelegate.initialize();
        parentView = view;
    }

    function onMenu() {
        if( Toybox has :ActivityRecording ) {
            var session = parentView.getSession();
            if( ( session == null ) || ( session.isRecording() == false ) ) {
                session = Record.createSession({:name=>"Walk", :sport=>Record.SPORT_WALKING});
                session.start();
                Ui.requestUpdate();
            }
            else if( ( session != null ) && session.isRecording() ) {
                session.stop();
                session.save();
                session = null;
                Ui.requestUpdate();
            }
            parentView.setSession(session);
        }
        return true;
    }

}