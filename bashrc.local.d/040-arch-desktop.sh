alias vnc_connect='x11vnc -pointer_mode 3 -geometry 1920x1080 -connect '

upgrade() {
    sudo pacman -Syu
    trizen -Syua
    flatpak update -y
    sudo pacman -Fy
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
    paccache -r -k 1
    flatpak --unused uninstall
    if [[ ! -z "$(which docker)" ]]
    then
        docker image prune
    fi
}

