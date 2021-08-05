#!/usr/bin/python3

import os
import subprocess

from i3ipc import Connection


def getLayoutName(layout):
    return os.path.splitext(os.path.basename(layout))[0]


class LayoutSwitcher:
    def __init__(self):
        config_dir = os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME")
        self.LAYOUT_STATE_FILE = os.path.join(config_dir, "screenlayout.state")
        self.LAYOUTS_DIR = os.path.join(os.getenv("HOME"), ".screenlayout")

        self.loadAvailableLayouts(self.LAYOUTS_DIR)
        self.loadCurrentLayout(self.LAYOUT_STATE_FILE)
        self.i3control = Connection()

    def loadAvailableLayouts(self, layoutsDir):
        self.AVAILABLE_LAYOUTS = [getLayoutName(
            l) for l in os.listdir(layoutsDir)]
        self.AVAILABLE_LAYOUTS.sort()
        print(self.AVAILABLE_LAYOUTS)

        self.NUM_AVAILABLE_LAYOUTS = len(self.AVAILABLE_LAYOUTS)
        if self.NUM_AVAILABLE_LAYOUTS == 0:
            raise Exception("No layouts defined in {}".format(layoutsDir))

    def loadCurrentLayout(self, stateFile):
        self.CURRENT_LAYOUT = self.__readCurrentLayoutOrNull(stateFile)

    def __readCurrentLayoutOrNull(self, stateFile):
        try:
            return open(stateFile, "r").readline()
        except:
            return self.AVAILABLE_LAYOUTS[0]

    def __loadLayout(self, layout):
        layoutFile = os.path.join(self.LAYOUTS_DIR, layout+".sh")
        print("loading layout {}".format(layout))
        open(self.LAYOUT_STATE_FILE, "w").writelines([layout])
        subprocess.run(layoutFile)
        print(subprocess.run(
            ["notify-send", "Layout-Switcher", "selected layout: {}".format(layout)], capture_output=True))

    def __loadLayoutByIndex(self, index):
        self.__loadLayout(self.AVAILABLE_LAYOUTS[index])

    def __getCurrentLayoutIndexOrNull(self):
        try:
            return self.AVAILABLE_LAYOUTS.index(self.CURRENT_LAYOUT)
        except:
            return 0

    def cycleLayouts(self):
        currentLayoutIndex = self.__getCurrentLayoutIndexOrNull() or 0
        print("current layout idx: {}".format(currentLayoutIndex))

        nextLayoutIndex = (currentLayoutIndex + 1) % self.NUM_AVAILABLE_LAYOUTS
        print("next layout: {}".format(nextLayoutIndex))

        self.__loadLayoutByIndex(nextLayoutIndex)
        self.i3control.command("restart")


if __name__ == "__main__":
    LayoutSwitcher().cycleLayouts()
