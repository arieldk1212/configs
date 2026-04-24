autoload -U colors && colors
export CLICOLOR=1
#export PS1=$'%F{034}%n@%m:\e[0;34m%~\e[0m$%f '
export PS1=$'%F{034}adk@Macbook-Pro:\e[0;34m%~\e[0m$%f '
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export LDFLAGS="-L/opt/homebrew/opt/libedit/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libedit/include"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"
export VCPKG_ROOT="$HOME/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"
export PATH="/opt/homebrew/opt/ruby@3.4/bin:$PATH"
export PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias emacs="emacs -nw"
alias doom="~/.config/emacs/bin/doom"
