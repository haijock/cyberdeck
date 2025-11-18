#!/bin/bash
set -euo pipefail

sudo chown -R $USER:$USER /home/$USER/{.cache,.local/share,.local/state}

# Set up fish environment
echo "Setting up fish environment..."
fish << 'EOF'
mkdir -p ~/.config/fish/{conf.d,completions,functions}
echo 'set fish_greeting ""' >> ~/.config/fish/config.fish
curl -sL https://git.io/fisher | source && \
fisher install jorgebucaran/fisher && \
fisher install ilancosman/tide@v6.2.0 && \
tide configure --auto --style=Lean --prompt_colors="True color" --show_time="24-hour format" --lean_prompt_height="Two lines" --prompt_connection=Dotted --prompt_connection_andor_frame_color=Lightest --prompt_spacing=Sparse --icons="Many icons" --transient=No
EOF

echo '~/.local/bin/mise activate fish | source' >> ~/.config/fish/conf.d/mise.fish
fish -c 'mise trust -q && mise install'

# # Add useful aliases
echo "alias ll='ls -latrh'" >> /home/$USER/.config/fish/config.fish

# # Set up abbreviations
cat << 'EOF' >> /home/$USER/.config/fish/config.fish
abbr -a gs 'git status'
abbr -a k 'kubectl'
abbr -a kg 'kubectl get'
abbr -a kd 'kubectl describe'
EOF
