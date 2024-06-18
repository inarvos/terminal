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

            # Copy whole line to clipboard
            bind -M default yy 'commandline | pbcopy'
            # Copy selected text in visual mode to clipboard
            bind -M visual -m default y 'commandline -s | pbcopy; commandline -f end-selection repaint-mode'
            # Paste from the system clipboard using p
            bind -M default p 'commandline -i (pbpaste); commandline -f repaint'

            # Move cursor to the beginning of the line
            bind -M default _ beginning-of-line
            bind -M visual _ beginning-of-line



            # Keymaps functions for Kitty only
            if test -n "$KITTY_WINDOW_ID"

                # Basic

                # Close window / tab
                bind -M default q 'kitty @ close-window'
                # Open OS window
                bind -M default wo 'kitty @ action new_os_window'
                # Close OS window
                #bind -M delault ' 'qa 'kitty @ action close_os_window'
                bind -M default ' 'qa "osascript -e 'tell application \"System Events\" to keystroke \"w\" using {command down, shift down}'"
                # Previous active OS window
                bind -M default wp 'kitty @ action nth_os_window -1'
                # Terminate kitty processes (kill all)
                bind -M default ' 'qq 'killall kitty'

                # Windows (split screen)

                # Bind "ss" and "sv" to split the Kitty window in normal mode
                bind -M default ss 'kitty @ launch --location=hsplit'
                bind -M default sv 'kitty @ launch --location=vsplit'
                # Switch between split screen layouts
                bind -M default sn 'kitty @ action next_layout'
                # Detach the current tab into a new OD window
                bind -M default sd 'kitty @ detach-window'

                # Bind "space top" to move to the window on the top of current one
                bind -M default ' '\e\[A 'kitty @ focus-window --match neighbor:top'
                # Bind "space bottom" to move to the window on the bottom of current one
                bind -M default ' '\e\[B 'kitty @ focus-window --match neighbor:bottom'
                # Bind "space left" to move to the previous window in normal mode
                bind -M default ' '\e\[D 'kitty @ focus-window --match neighbor:left'
                # Bind "space right" to move to the next window in normal mode
                bind -M default ' '\e\[C 'kitty @ focus-window --match neighbor:right'
                
                # Tabs

                # Bind "te" and "to" to create a new tab
                bind -M default te 'kitty @ launch --type=tab'
                bind -M default to 'kitty @ launch --type=tab'
                # Bind "tx" and "tc" to close the current tab
                bind -M default tc 'kitty @ close-tab'
                bind -M default tx 'kitty @ close-tab'
                # Detach the current tab into a new OS window
                bind -M default td 'kitty @ detach-tab'

                # Bindings for tab navigation
                # tn and tab to move to the next tab
                bind -M default tn 'kitty @ action next_tab'
                bind -M default \t 'kitty @ action next_tab'
                # tp and shift+tab to move to the previous tab
                bind -M default tp 'kitty @ action previous_tab'

            else
                echo "Not running in Kitty terminal."
            end
        end


        
        # ...Multi-system function example...
        #function copy_current_commandline_to_clipboard
        #    if test (uname) = "Darwin"
        #        commandline | pbcopy
        #    else
        #        commandline | xclip -selection clipboard
        #    end
        #    commandline -f repaint
        #end

    end
end
