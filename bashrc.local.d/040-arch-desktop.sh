alias vnc_connect='x11vnc -pointer_mode 3 -geometry 1920x1080 -connect '

upgrade() {
    trizen -Syu
    flatpak update -y
    trizen -Fy
    fwupdmgr refresh
    fwupdmgr update
}

cleanup() {
    local packages=($(pacman -Qdtq))
    if [[ ${#packages[@]} > 0 ]]
    then
        sudo pacman -Rs "${packages[@]}"
    else
        echo "Pacman all clean!"
    fi
    flatpak --unused uninstall
    docker image prune
}

