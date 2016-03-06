using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;


class SportsRecorderView extends Ui.View {

   var session;

    function initialize() {
        View.initialize();
        session = null;
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        if( Toybox has :ActivityRecording ) {
            // Draw the instructions
            if( ( session == null ) || ( session.isRecording() == false ) ) {
                setLayout(Rez.Layouts.MainLayout(dc));
            }
            else if( ( session != null ) && session.isRecording() ) {
                setLayout(Rez.Layouts.RecordingLayout(dc));
            }
        }
        // tell the user this sample doesn't work
        else {
            setLayout(Rez.Layouts.ErrorLayout(dc));
        }
        View.onUpdate(dc);
    }

    //! Load your resources here
    function onLayout(dc) {
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }

    // Session management
    function getSession() {
        return session;
    }

    function setSession(newSession) {
        session = newSession;
    }

    //! Stop the recording if necessary
    function stopRecording() {
        if( Toybox has :ActivityRecording ) {
            if( session != null && session.isRecording() ) {
                session.stop();
                session.save();
                session = null;
                Ui.requestUpdate();
            }
        }
    }


}
