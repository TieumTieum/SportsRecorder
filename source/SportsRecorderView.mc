// This file is part of SportsRecorder

// SportsRecorder is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// SportsRecorder is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with SportsRecorder.  If not, see <http://www.gnu.org/licenses/>.

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
