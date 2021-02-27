export OOO_FORCE_DESKTOP=none
export SAL_USE_VCLPLUGIN=gtk

xrdb -merge ~/.Xdefaults

#xbindkeys
#xautolock &

#openbox-session
#exec startfluxbox
#exec startxfce4

setxkbmap -layout us,cz -option grp:caps_switch
#exec awesome
exec dbus-launch --exit-with-session i3
