# Expand-on-space zsh plugin

For people who want to type less with the verbosity of fully written commands.

## Introduction

Aliases are a helpful shell feature to simplify complicated commands. However, they can be hard to remember and obscure
the commands they refer to. This plugin uses another approach: The currently typed in text is expanded on `<Space>` if
it matches an entry in an user-defined lookup table. You always get fully written commands (helpful for working at
machines where your aliases are not defined) and you get a command history which is much more verbose.

**Example:**

Without this plugin, you could have defined an alias `gds` for `git diff --staged`. With this plugin, you can define
`g` to expand to `git`, `git d` to `git diff` and `git diff -s` to `git diff --staged`. Then, you can type

```
g<Space>d<Space>-s<Space>
```

to get

```
git diff --staged
```

as fully written command on the command line.

## Installation

### Using zplug

Add `zplug "IngoMeyer441/zsh-expand-on-space"` to your `.zshrc`.

### Manual

Clone this repository and source `expand_on_space.plugin.zsh` in your `.zshrc`

## Configuration

Define an associative array `EXPAND_ON_SPACE` in your `.zshrc` which contains your custom lookup table, for example:

```zsh
typeset -gx -A EXPAND_ON_SPACE
EXPAND_ON_SPACE=( \
    "chx" "chmod +x" \
    "f" "find" \
    "g" "git" \
    "git a" "git add" \
    "git c" "git commit" \
    "git d" "git diff" \
    "git diff h" "git diff HEAD" \
)
```

Optionally, you can define a second array for commands that shall be executed on space directly, for example

```zsh
typeset -gx EXPAND_ON_SPACE_ACCEPT
EXPAND_ON_SPACE_ACCEPT=( \
    "z" \
)
```

to run a `z` command / function whenever `z<Space>` is typed in. That can be useful for [fast directory jumping with a
fuzzy finder like fzf](https://github.com/junegunn/fzf/wiki/examples#z).
