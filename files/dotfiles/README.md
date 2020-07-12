# dotfiles

For configuring dotfiles on Linux/OSX.
Some followup tweaking required (especially plugins in vimrc/tmux.conf)

See [dev-playbook](https://github.com/KentBrockman/dev-playbook) for complete machine set up

## Set PATH

Set path in ~/.profile:

```
# list all path entries here
paths=(
    # "$HOME/bin"
    # "$HOME/.local/bin"
    "$HOME/dotfiles/cmds"
)

# add them this way to prevent duplicates
for p in ${paths[@]}; do
    # if directory exists and isn't already in PATH, add it
    if [[ -d $p && ! $PATH =~ $p ]] ; then
        export PATH="$p:$PATH"
    fi
done
```

## If You Fork

- Update gitconfig with your information
