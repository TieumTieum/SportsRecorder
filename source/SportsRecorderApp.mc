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

using Toybox.Application as App;
using Toybox.Position as Position;
using Toybox.Sensor as Sensor;

class SportsRecorderApp extends App.AppBase {

    var sportsRecorderView;
    var sportsRecorderDelegate;

    function initialize() {
        AppBase.initialize();
    }

    //! onStart() is called on application start up
    function onStart() {
        Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
        Sensor.setEnabledSensors( [Sensor.SENSOR_HEARTRATE] );
    }

    //! onStop() is called when your application is exiting
    function onStop() {
        sportsRecorderView.stopRecording();
        Position.enableLocationEvents(Position.LOCATION_DISABLE, method(:onPosition));
        Sensor.setEnabledSensors( [] );
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
