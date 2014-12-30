threads 4,4

bind  "unix:///home/deploy/apps/devgui/shared/tmp/devgui-puma.sock"
pidfile "/home/deploy/apps/devgui/tmp/puma/pid"
state_path "/home/deploy/apps/devgui/tmp/puma/state"

activate_control_app
