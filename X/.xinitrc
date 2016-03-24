[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
sh ~/.fehbg &
unclutter &
xset -b
exec i3
