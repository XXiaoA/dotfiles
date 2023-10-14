function fish_user_key_bindings
    bind -M insert -m default jj backward-char force-repaint
    bind --preset H beginning-of-line
    bind --preset L end-of-line
    bind --preset -M visual H beginning-of-line
    bind --preset -M visual L end-of-line
    bind --preset -M visual -m default v end-selection repaint-mode
end
