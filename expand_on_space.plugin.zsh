function _expand-on-space {
    local new_line
    if [[ -n "${EXPAND_ON_SPACE_ACCEPT[(r)${BUFFER}]}" ]]; then
        zle accept-line
    elif (( ${+EXPAND_ON_SPACE[${BUFFER}]} )); then
        new_line="${EXPAND_ON_SPACE[${BUFFER}]} "    # ${BUFFER} is changed after line kill
        zle kill-whole-line
        zle -U "${new_line}"
    else
        zle magic-space
    fi
}
zle -N _expand-on-space
bindkey ' ' _expand-on-space
