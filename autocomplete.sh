#!/bin/bash

# Function to perform autocomplete from command history
_autocomplete_from_history() {
    local cur prev opts
    COMPREPLY=()   # Array variable storing the possible completions
    cur="${COMP_WORDS[COMP_CWORD]}"  # Current word being completed
    prev="${COMP_WORDS[COMP_CWORD-1]}"  # Previous word

    # Generate command options from history
    opts=$(history | cut -c 8- | awk '{$1=$1};1' | grep "^$cur" | sort -u)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}

# Register the function to provide completions for the first word of the command line.
complete -F _autocomplete_from_history

