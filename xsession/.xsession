# avoid .xsession-errors pollution
exec &>/dev/null

# setup
xset r rate 200 50 b off mouse 4 &
feh --bg-center ~/.background &

# autostart
~/.dropbox-dist/dropboxd &
#google-chrome &

# wm
exec i3

###################

# avoid .xsession-errors pollution
exec &>/dev/null

# setup
conky &
xset r rate 200 50 b off mouse 4 &

# wm
openbox-session &
WM=$!

# delay
sleep 1

# autostart
if ! tmux has-session -s root; then
    tmux new-session -d -s root ncmpc
    tmux new-window
fi

while urxvt -name root-terminal -title root-terminal -e tmux attach -t root; do :; done &
~/.dropbox-dist/dropboxd &
google-chrome &

# wait
wait $WM
