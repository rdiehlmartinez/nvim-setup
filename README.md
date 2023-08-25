## Setup of nvim dev environment

Note that before setting, the following needs to be in order:

I use [warp](https://www.warp.dev/) as my main terminal because it is generally very fast and supports true colors which makes everything much prettier.

After cloning the repo, you'll want to install the following from homebrew. As a note to my future self the way you install homebrew is:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

- _For XCode Command Line Tools_

```bash
xcode-select --install
```

- _For setting up warp_

```bash
brew install --cask warp
```

- _For setting up neovim and dependencies that are used by the lua packages that are used in neovim_

```bash
brew install neovim
brew install ripgrep
```

- _Also install some nice font to display things more nicely_

```bash
brew install --cask "font-meslo-lg-nerd-font"
```

- _Obviously also might need to install python, node ... dependending on how much of a clean setup I need_

```bash
brew install node
brew install python@3.8
... -- whatever else I need
```

The next step is to actually install the lua packages. To do so, go into the `plugins/setup-plugins.lua` and save the file so that everything is automatically installed.
