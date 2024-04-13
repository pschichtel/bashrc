alias vnc_connect='x11vnc -pointer_mode 3 -geometry 1920x1080 -connect '
export MOZ_USE_XINPUT2=1

update_mirrors() {
    sudo reflector --age 6 --country "${1:-DE}" --score 5 --save /etc/pacman.d/mirrorlist
}

upgrade() {
    sudo pacman -Syu
    if [ -n "$(which trizen 2> /dev/null)" ]
    then
        trizen -Syua
    fi
    if [ -n "$(which yay 2> /dev/null)" ]
    then
        yay -Syua
    fi
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
    flatpak --unused uninstall -y
    if [[ ! -z "$(which docker)" ]]
    then
        docker image prune --force
    fi
}

compress-pdf() {
    local input="${1?no input}"
    local output="${2?no output}"

    shrinkpdf -r 150 -o "$output" "$input"
}

