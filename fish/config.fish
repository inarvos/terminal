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

                # Bind "space top" to move to the window on the top of current one
                bind -M default ' '\e\[A move_to_top_window
                # Bind "space bottom" to move to the window on the bottom of current one
                bind -M default ' '\e\[B move_to_bottom_window
                # Bind "space left" to move to the previous window in normal mode
                bind -M default ' '\e\[D move_to_left_window
                # Bind "space right" to move to the next window in normal mode
                bind -M default ' '\e\[C move_to_right_window



                # Tabs

                # Bind "te" and "to" to create a new tab
                bind -M default te 'kitty @ launch --type=tab'
                bind -M default to 'kitty @ launch --type=tab'
                # Bind "tx" and "tc" to close the current tab
                bind -M default tc 'kitty @ close-tab'
                bind -M default tx 'kitty @ close-tab'

                # Bindings for tab navigation
                # tn and tab to move to the next tab
                bind -M default tn move_to_next_tab
                bind -M default \t move_to_next_tab
                # tn and tab to move to the previous tab
                bind -M default tp move_to_previous_tab

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
                kitty @ launch --location=hsplit
            end
            # Function to move to the left window
            function move_to_left_window
                kitty @ focus-window --match neighbor:left
            end
            # Function to move to the right window
            function move_to_right_window
                kitty @ focus-window --match neighbor:right
            end
            # Function to move to the top window
            function move_to_top_window
                kitty @ focus-window --match neighbor:top
            end
            # Function to move to the bottom window
            function move_to_bottom_window
                kitty @ focus-window --match neighbor:bottom
            end

            # Function to move to the next tab
            function move_to_next_tab
                osascript -e 'tell application "System Events" to keystroke "]" using {command down, shift down}'
            end
            # Function to move to the previous tab
            function move_to_previous_tab
                osascript -e 'tell application "System Events" to keystroke "[" using {command down, shift down}'
            end

        else
            echo "Not running in Kitty terminal."
        end
    end
end
