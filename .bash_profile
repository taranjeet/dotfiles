complete -W "$(<~/.servers)" ssh
complete -W "$(git branch | tr -d "*" | cat)" gco
complete -W "$(git branch | tr -d "*" | cat)" gpo