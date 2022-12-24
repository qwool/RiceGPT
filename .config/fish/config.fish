if status is-interactive
    ### functions made by other software
    function f
        fff $argv
        set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
        cd (cat $XDG_CACHE_HOME/fff/.fff_d)
    end
    function kiss_chroot
        sudo /mnt/kiss/bin/kiss-chroot /mnt/kiss
    end



    ### envvars
    set -gx EDITOR micro
    ## PATH
    set -gx PATH $PATH ~/.cargo/bin
    set -gx PATH $PATH ~/.local/bin
    set -gx PATH $PATH ~/bin
    set -gx PATH $PATH /opt/android-sdk/platform-tools

    ### aliases
    ## add flags
    # alias cp "advcp -g"

    # alias fd "fdfind -H"
    ## autoescalation
    alias apt "sudo apt"
    alias pacman "sudo pacman"
    alias apti "sudo apt install"
    alias cppr "rsync -ah --progress"
    alias cp "cp -r"
    # alias update-grub "sudo grub-mkconfig -o /etc/default/grub"
    ##
    alias python python3

    ## replacements
    ## "bat" as manpager
    # set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'"
    # alias sudo doas
    # alias vim nvim
    # alias c cd
    # alias cat batcat
    alias ls "exa -xa --icons -s type"
    alias l "exa -xa --icons -s type"
    alias ll "exa -1lUah --icons -s name --no-user"
    # alias grep rg
    # alias fd fdfind
    # alias spoti "LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
    # alias cd z

    ### keybindings
    bind \b backward-kill-word
    bind \e\[3\;3~ kill-word
    bind \e\[3\;5~ kill-word
    bind \cF f #shortuct for fff

    ### things on startup
    # qwelc
    pfetch
    # set colorScriptOptions {"blocks1", "bloks", "crunch",  "crunchbang-mini", "fade", "ghosts", "panes", "square", "zwaves"}
    # set colorScriptOptions $colorScriptOptions[(random 1 (count $colorScriptOptions))]
    # echo $colorScriptOptions:
    # colorscript -e $colorScriptOptions
    # 16
    # crunchbang
    # starship init fish | source

end
