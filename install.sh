#!/bin/bash

# mac-only check
if [ "$(uname -s)" != "Darwin" ]; then
  echo "nah, this is mac-only, fam."
  exit 1
fi

# check for brew first
if ! command -v brew > /dev/null; then
  echo "no brew? let’s get it sorted."
  echo "installing homebrew—hit enter when it asks, or ctrl+c to bounce."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "adding brew to your zsh path..."
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zshrc"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "brew’s already here, nice!"
fi

# now oh-my-posh
if ! command -v oh-my-posh > /dev/null; then
  echo "oh-my-posh’s missing, grabbing it with brew..."
  brew install jandedobbeleer/oh-my-posh/oh-my-posh
else
  echo "oh-my-posh is good, you’re set!"
fi

# check and install Sauce Code Pro Nerd Font
if ls ~/Library/Fonts | grep -q "SauceCodeProNerdFont-Regular.ttf"; then
  echo "you’ve already got Sauce Code Pro Nerd Font, nice!"
else
  echo "grabbing Sauce Code Pro Nerd Font for ya..."
  brew install --cask font-sauce-code-pro-nerd-font
  echo "Sauce Code Pro Nerd Font installed! set it in your terminal settings (e.g., Terminal, iTerm2)."
fi

echo "all done here! now run ./apply_theme.sh to slap the theme on."