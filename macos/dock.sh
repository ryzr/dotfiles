#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Brave Browser.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/TablePlus.app"

killall Dock
