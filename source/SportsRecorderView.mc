using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;


class SportsRecorderView extends Ui.View {

   var session;

    function initialize() {
        View.initialize();
        session = null;
    }

    //! Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Set background color
        dc.clear();
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        if( Toybox has :ActivityRecording ) {
            // Draw the instructions
            if( ( session == null ) || ( session.isRecording() == false ) ) {
                dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_WHITE);
                dc.drawText(20, 10, Gfx.FONT_MEDIUM, "Press Menu to", Gfx.TEXT_JUSTIFY_LEFT);
                dc.drawText(25, 40, Gfx.FONT_MEDIUM, "Start Recording", Gfx.TEXT_JUSTIFY_LEFT);
            }
            else if( ( session != null ) && session.isRecording() ) {
                dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_WHITE);
                dc.drawText(20, 10, Gfx.FONT_MEDIUM, "Recording...", Gfx.TEXT_JUSTIFY_LEFT);

                dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_WHITE);
                dc.drawText(20, 50, Gfx.FONT_MEDIUM, "Press Menu again", Gfx.TEXT_JUSTIFY_LEFT);
                dc.drawText(25, 80, Gfx.FONT_MEDIUM, "to Stop and Save", Gfx.TEXT_JUSTIFY_LEFT);
                dc.drawText(25, 110, Gfx.FONT_MEDIUM, "the Recording", Gfx.TEXT_JUSTIFY_LEFT);
            }
        }
        // tell the user this sample doesn't work
        else {
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_WHITE);
            dc.drawText(20, 20, Gfx.FONT_MEDIUM, "This product doesn't", Gfx.TEXT_JUSTIFY_LEFT);
            dc.drawText(25, 50, Gfx.FONT_MEDIUM, "have FIT Support", Gfx.TEXT_JUSTIFY_LEFT);
        }    }

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
