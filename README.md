# Git configuration

My shared Git preferences for setting up a new machine. Identity and machine-specific overrides stay outside this public repository.

## Setup

Install a recent Git version (2.38 or newer) and clone this repository:

```sh
git clone https://github.com/Kafkalasch/git-config.git ~/git-config
cd ~/git-config
sh install.sh
```

The installer adds an include to your existing global config, preserving its contents. Running it again does not add a duplicate. Keep the checkout at that location: `git pull` updates the shared preferences used by Git.

On a new machine, set your identity in the private override file:

```sh
git config --file ~/.gitconfig.local user.name "Your Name"
git config --file ~/.gitconfig.local user.email "you@example.com"
```

You can also use `gitconfig.local.example` as a starting point. Your existing global identity still works if you leave these overrides unset. Overrides in `~/.gitconfig.local` take precedence over the shared settings; repository-specific config takes precedence over global config.

For a separate work identity, uncomment the `includeIf` example and set the name/email in `~/.gitconfig.work`:

```sh
git config --file ~/.gitconfig.work user.name "Your Name"
git config --file ~/.gitconfig.work user.email "you@company.example"
```

Git's [include documentation](https://git-scm.com/docs/git-config#_includes) describes how these files are loaded.

## Uninstall

From the checkout, remove just its include:

```sh
git config --global --fixed-value --unset-all include.path "$PWD/gitconfig"
```

Your existing global config and private override file are retained.
