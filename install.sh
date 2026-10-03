#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
config_path="$repo_dir/gitconfig"

if git config --global --get-all include.path | grep -Fqx -- "$config_path"; then
    printf '%s\n' 'This configuration is already included.'
else
    git config --global --add include.path "$config_path"
    printf '%s\n' 'Added shared preferences to your global Git configuration.'
fi

printf '%s\n' 'Keep this checkout in place. See README.md for identity and local overrides.'
