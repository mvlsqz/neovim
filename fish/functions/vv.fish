function vv
    set configs nvim nvim-chad

    set selected (printf "%s\n" $configs | fzf --prompt="Select Neovim config: " --height=10 --layout=reverse)

    if test -n "$selected"
        set -x NVIM_APPNAME $selected
        nvim $argv
    end
end
