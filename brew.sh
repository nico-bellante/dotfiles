#!/usr/bin/env zsh

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install a modern version of Bash.
brew install zsh

# Switch to using brew-installed zsh as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;


# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install woff2

# Install other useful binaries.
brew install ack
brew install git
brew install lua

# Install things needed for Mystery
brew install autojump
brew install automake
brew install coreutils
brew install libksba
brew install libyaml
brew install node
brew install pgcli
brew install pkg-config
brew install postgis
brew install redis
brew install watchman
brew install zlib

# Remove outdated versions from the cellar.
brew cleanup