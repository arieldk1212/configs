eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 
export PATH="$PATH:/Users/arielkriheli/Library/Python/3.9/bin"
export PATH="$PATH:/opt/homebrew/opt/node@20/bin"
export VCPKG_ROOT="$HOME/Library/vcpkg"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
autoload -U colors && colors
PS1="%B%F{034}%n@%m%f%b:%B%F{019}%~ %#%f%b "
