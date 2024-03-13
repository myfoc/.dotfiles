# NIX
typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/5ndii1vwira7y45hrz8cla23dyznxr5r-zsh-5.9/share/zsh/$ZSH_VERSION/help"





# ZSH
autoload -U compinit && compinit