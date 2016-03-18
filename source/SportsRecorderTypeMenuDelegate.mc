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

class SportsRecorderTypeMenuDelegate extends Ui.MenuInputDelegate {

    var rootDelegate;

    function initialize(delegate) {
        MenuInputDelegate.initialize();

        rootDelegate = delegate;
    }

    function onMenuItem(item) {
        if ( item == :sport_running ) {
            rootDelegate.setActivity( Record.SPORT_RUNNING );
        }
        if ( item == :sport_cycling ) {
            rootDelegate.setActivity( Record.SPORT_CYCLING );
        }
        if ( item == :sport_transition ) {
            rootDelegate.setActivity( Record.SPORT_TRANSITION );
        }
        if ( item == :sport_fitness_equipment ) {
            rootDelegate.setActivity( Record.SPORT_FITNESS_EQUIPMENT );
        }
        if ( item == :sport_swimming ) {
            rootDelegate.setActivity( Record.SPORT_SWIMMING );
        }
        if ( item == :sport_basketball ) {
            rootDelegate.setActivity( Record.SPORT_BASKETBALL );
        }
        if ( item == :sport_soccer ) {
            rootDelegate.setActivity( Record.SPORT_SOCCER );
        }
        if ( item == :sport_tennis ) {
            rootDelegate.setActivity( Record.SPORT_TENNIS );
        }
        if ( item == :sport_american_football ) {
            rootDelegate.setActivity( Record.SPORT_AMERICAN_FOOTBALL );
        }
        if ( item == :sport_training ) {
            rootDelegate.setActivity( Record.SPORT_TRAINING );
        }
        if ( item == :sport_walking ) {
            rootDelegate.setActivity( Record.SPORT_WALKING );
        }
        if ( item == :sport_cross_country_skiing ) {
            rootDelegate.setActivity( Record.SPORT_CROSS_COUNTRY_SKIING );
        }
        if ( item == :sport_alpine_skiing ) {
            rootDelegate.setActivity( Record.SPORT_ALPINE_SKIING );
        }
        if ( item == :sport_snowboarding ) {
            rootDelegate.setActivity( Record.SPORT_SNOWBOARDING );
        }
        if ( item == :sport_rowing ) {
            rootDelegate.setActivity( Record.SPORT_ROWING );
        }
        if ( item == :sport_mountaineering ) {
            rootDelegate.setActivity( Record.SPORT_MOUNTAINEERING );
        }
        if ( item == :sport_hiking ) {
            rootDelegate.setActivity( Record.SPORT_HIKING );
        }
        if ( item == :sport_multisport ) {
            rootDelegate.setActivity( Record.SPORT_MULTISPORT );
        }
        if ( item == :sport_paddling ) {
            rootDelegate.setActivity( Record.SPORT_PADDLING );
        }
        if ( item == :sport_generic ) {
            rootDelegate.setActivity( Record.SPORT_GENERIC );
        }
    }

}