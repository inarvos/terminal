# my machine
My current terminal configurations - Kitty + (Fish + Vi).

Welcome to my terminal configuration repository! This setup is an optimized and personalized configuration for the [Kitty terminal](https://sw.kovidgoyal.net/kitty/) and [Fish shell](https://fishshell.com/) with Vi mode. This configuration is tailored for a comfortable and efficient workflow on a Mac.
This repository contains my personal setup that you can use to find the right way of configuration, or gain new setup ideas.

<img width="815" alt="Screenshot 2024-06-18 at 16 54 05" src="https://github.com/inarvos/terminal/assets/37037175/d2a106e8-8fb5-466b-a74a-2e7151c3f992">
 



Overview


Kitty Terminal Configuration

The Kitty terminal is known for its performance and configurability, making it an excellent choice for power users.
I have reviewed all the available Kitty configurations and chosen those few that suit my needs at this stage. kitty.conf is mainly about Kitty’s design, while Kitty-related functional settings are in the Fish configuration, as they are closely related to the Vi mode.
To view and customize Kitty design settings, you can refer to the `kitty.conf` file in the repository.

<img width="1728" alt="340754584-477546fb-09db-442a-80da-a2c4679e8d08" src="https://github.com/inarvos/terminal/assets/37037175/d92a12b2-6b8c-43df-9d18-c7e7f71b1d8d">
 



Fish Shell Configuration

Fish shell is known for its user-friendly and powerful features. My Fish configuration includes everything I need for a smooth workflow. This configuration relies on several tools and packages installed via Homebrew. The list of these dependencies can be found in the `BrewList.png` file

Vi Mode Keybindings

Being a fan of Vim (my Neovim - https://github.com/inarvos/Neovim-Mac-Pro-M3), I have meticulously set up Vi mode keybindings in the Fish shell configuration. These keybindings enhance navigation and editing efficiency directly in the terminal.

Keybindings include basic text editing, windows management, tabs management and more.
For details, please refer to the `config.fish` file in the repository.

<img width="814" alt="Screenshot 2024-06-18 at 17 15 11" src="https://github.com/inarvos/terminal/assets/37037175/06cf9fbe-da5d-4d0f-aa9f-80ad9e4a8443">
 



Installation

To set up this configuration on your system, follow these steps:
-	Install dependencies – install what you find useful from the BrewList. Anyway, your system will tell you what is missing if you try using my configurations. But use Homebrew.
-	Apply Kitty - copy Kitty configuration files to your Kitty config directory (should be ~/.config/kitty/).
-	Apply Fish - copy Fish configuration files to your Fish config directory (should be ~/.config/fish/).

-	Open Kitty terminal, and you should see the custom configurations applied. You can start using the Fish shell with Vi mode keybindings immediately. For any adjustments, modify the configuration files as per your requirements.

<img width="1728" alt="340754794-7dcb4d80-c0c0-4c82-8312-ffeed6cdd5b7" src="https://github.com/inarvos/terminal/assets/37037175/be2db3fc-96b2-4389-8de0-47c581cec40e">
