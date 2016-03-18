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
using Toybox.System as Sys;

class SportsRecorderMenuDelegate extends Ui.MenuInputDelegate {

    var rootDelegate;

    function initialize(delegate) {
        MenuInputDelegate.initialize();

        rootDelegate = delegate;
    }
    function onMenuItem(item) {
        if (item == :type) {
          Ui.pushView(new Rez.Menus.TypeMenu(), new SportsRecorderTypeMenuDelegate(rootDelegate), Ui.SLIDE_UP);
        }
    }

}