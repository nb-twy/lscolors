![GitHub release (latest by date)](https://img.shields.io/badge/Version-1.0.0-success)

# LSCOLORS
Have you ever been frustrated with the colored output of `ls` on a Linux terminal?  I switch between
Fedora, Ubuntu, and other Linux distributions fairly regularly.  I also install new Linux instances
several times a year.  I often find myself straining at the funky default colors for the `ls` output.  I
got tired of _dealing_ with bad colors.  After researching other options, I found that too many other
_color schemes_ provide every possible combination of either the 8-color or 256-color options.  Many of
these combinations, especially those with backgrounds, are terrible and should never be used.  That just
makes it difficult to sift through a huge set of combinations to find the right values.  I also found
that other color schemes do not give you a good starting point for categorizing files.

## Goals
I set out to create a color scheme for `LSCOLORS` with the following goals:
1. Use colors to differentiate file types as much as possible.
1. Minimize the use of styles with backgrounds or underlines.
1. Use colors that contrast well against each other.
1. Use colors that look good on a **black** background.
1. Provide a simple list of styles in the file so that the user doesn't have to use a separate reference
   to know which color is being used.
1. Provide a simple set of categories.
1. Make it easy for the user to customize the categories or styles.

## Getting Started
The `.dircolors` file is the most important file.  You can simply download the file and copy it to
appropriate location on your system.
**Personal:** If you just need to modify your local profile's colors, copy `.dircolors` to
`~/.dircolors`.
**All Profiles** You can configure the default color scheme for all profiles by modifying `/etc/DIR_COLORS`.
**Configuring Your Environment**
You will also need to include some code in your preferred profile script (i.e. `~/.bashrc`) to activate
the color scheme.

**Basic**
```sh
# If a custom .dircolors file exists, use it. Otherwise, use the default.
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
```

**Check for dircolors support first**
```sh
if [ -x /usr/bin/dircolors ]; then
    # If a custom .dircolors file exists, use it. Otherwise, use the default.
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
```

**Bash Syntax**
```bash
DIRCOLORS_EXEC="/usr/bin/dircolors"
CUSTOM_DIRCOLORS="$HOME/.dircolors"

if [[ -x "$DIRCOLORS_EXEC" ]]; then
    if [[ -f "$CUSTOM_DIRCOLORS" ]]; then
        eval "$(dircolors -b "$CUSTOM_DIRCOLORS")"
    else
        eval "$(dircolors -b)"
    fi
fi
```
