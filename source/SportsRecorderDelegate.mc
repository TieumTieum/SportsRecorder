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
using Toybox.ActivityRecording as Record;

class SportsRecorderDelegate extends Ui.BehaviorDelegate {

    var parentView;
    var currentActivity = Record.SPORT_RUNNING ;

    function initialize( view ) {
        BehaviorDelegate.initialize();
        parentView = view;
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new SportsRecorderMenuDelegate(self), Ui.SLIDE_UP);
        return true;
    }

    function setActivity(activity) {
        currentActivity = activity;
    }

    function onKey(event) {
        var key = event.getKey();
        if ( key == KEY_ENTER) {
            if( Toybox has :ActivityRecording ) {
                var session = parentView.getSession();
                if( ( session == null ) || ( session.isRecording() == false ) ) {
                    session = Record.createSession({:name=>"Activity", :sport=>currentActivity});
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
        }
        else {
            // Transmit behavior to parent
            return false;
        }
        return true;
    }

}