/home/james/.scripts/monitors.sh 

xrdb -merge ~/.Xresources
eval $(dbus-launch --sh-syntax --exit-with-session bspwm)


# Ensure dbus is either already running, or safely start it
if [[ -z "${DBUS_SESSION_BUS_ADDRESS}" ]];
then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

# Make the keyring daemon ready to communicate with nm-applet
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
nm-applet &

exec bspwm
