
if [[ "$XDG_SESSION_TYPE" == 'wayland' ]]
then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland-egl
    export SDL_VIDEODRIVER=wayland
    export CLUTTER_BACKEND=wayland
fi

