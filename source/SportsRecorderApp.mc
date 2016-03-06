using Toybox.Application as App;
using Toybox.Position as Position;

class SportsRecorderApp extends App.AppBase {

    var sportsRecorderView;
    var sportsRecorderDelegate;

    function initialize() {
        AppBase.initialize();
    }

    //! onStart() is called on application start up
    function onStart() {
        Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
    }

    //! onStop() is called when your application is exiting
    function onStop() {
        sportsRecorderView.stopRecording();
        Position.enableLocationEvents(Position.LOCATION_DISABLE, method(:onPosition));
    }

    function onPosition(info) {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        sportsRecorderView = new SportsRecorderView();
        sportsRecorderDelegate = new SportsRecorderDelegate(sportsRecorderView);
        return [ sportsRecorderView, sportsRecorderDelegate ];
    }

}
