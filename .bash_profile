complete -W "$(<~/.servers)" ssh
if [ -f .git ]; then
complete -W "$(git branch | tr -d "*" | cat)" gco
complete -W "$(git branch | tr -d "*" | cat)" gpo
fi