function _expand-on-space {
    if [[ -n "${EXPAND_ON_SPACE_ACCEPT[(r)${LBUFFER}]}" ]]; then
        zle accept-line
    elif (( ${+EXPAND_ON_SPACE[${LBUFFER}]} )); then
        LBUFFER="${EXPAND_ON_SPACE[${LBUFFER}]} "
        if command -v "_zsh_highlight" >/dev/null 2>&1; then
            _zsh_highlight
        fi
    else
        zle magic-space
    fi
}
zle -N _expand-on-space
bindkey ' ' _expand-on-space
