if status is-interactive
    # Commands to run in interactive sessions can go here
    if test (uname -s) = "Darwin"
        set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
        set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

    # .zprofile:

        set -x PATH /usr/local/bin $PATH
        set -x PATH /opt/homebrew/bin $PATH

        # Java:
        set -x PATH /opt/homebrew/opt/openjdk/bin $PATH

        # Pyenv setup for login shell:
        set -x PYENV_ROOT $HOME/.pyenv
        set -x PATH $PYENV_ROOT/bin $PATH
        eval "$(pyenv init --path)"

        # Cargo setup:
        set -x PATH $HOME/.cargo/bin $PATH

        # Ruby setup:
        set -x RBENV_ROOT $HOME/.rbenv
        set -x PATH $RBENV_ROOT/bin $PATH
        # ?:
        #set -x PATH $HOME/.rbenv/shims $PATH
        set -x PATH $HOME/.rbenv/versions/3.3.1/bin $PATH
        set -x PATH $HOME/.rbenv/versions/3.3.1/lib/ruby/gems/3.3.0 $PATH
        set -x PATH $HOME/.gem/ruby/3.3.0 $PATH

        # LuaRocks paths
        set -x PATH /opt/homebrew/bin $PATH
        set LUA_PATH "/opt/homebrew/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?/init.lua;$LUA_PATH"
        set LUA_CPATH "/opt/homebrew/lib/lua/5.4/?.so;$LUA_CPATH"

        # For fish theme
        set -x PATH /opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH        

    # .zshrc:

        # fzf
        alias fzf="fzf --preview 'bat --color=always {}' --preview-window '~3'"        



    # other:

        if status is-interactive

            # Set the cursor shapes for the different vi modes.
            set fish_cursor_default     block
            set fish_cursor_insert      line       blink
            set fish_cursor_replace_one underscore blink
            set fish_cursor_visual      block

            # Apply custom Fish vi key bindings
            function fish_user_key_bindings
                # Use default Fish vi key bindings
                fish_vi_key_bindings

                # "delault" = Normal Mode

                # Basic
                bind -M default q close_kitty

                # Windows (split screen)
                # Bind "ss" to split the Kitty window in normal mode
                bind -M default ss split_kitty_window
            end

        end


        
        # Keymaps functions
        if test -n "$KITTY_WINDOW_ID"
            # Function to close Kitty items
            function close_kitty
                kitty @ close-window
            end

            # Function to split the Kitty window
            function split_kitty_window
                kitty @ launch --type=window --location=hsplit
            end
        else
            echo "Not running in Kitty terminal."
        end

    end
end
