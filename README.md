# Git-TUI (Git Text-based User Interface) 0.0.3
[![Gem Version](https://badge.fury.io/rb/git-tui.svg)](https://badge.fury.io/rb/git-tui)

This is an unobtrusive Git TUI (Text-based User Interface) that provides quick time-saving interactions only for Git commands that need them (e.g. `git checkout branchname`) while [setting up global git aliases/configuration](#setup-instructions) to let developers to continue to use Git from the command line for the rest of the option-less commands (e.g. `g pr` for `git pull --rebase` and `g pf` for `push --force-with-lease`).

Git-TUI intentionally avoids what some other TUIs do in taking up the whole screen to avoid interrupting the developer completely from the terminal yet only augment their workflow with improved productivity for Git option-heavy commands that benefit from auto-completion (e.g. browsing available branches with autocomplete).

![GIT TUI DEMO](git-tui-demo.gif)

Other TUI gems you may be interested in:
- [rake-tui](https://github.com/AndyObtiva/rake-tui)
- [rvm-tui](https://github.com/AndyObtiva/rvm-tui)

## Pre-requisites

- [Git](https://git-scm.com/downloads)
- [MRI Ruby](https://www.ruby-lang.org/en/) installed via [RVM](https://rvm.io)
- [Bash](https://www.gnu.org/software/bash/) or [Zsh](http://zsh.sourceforge.net/) (Z Shell) (including Sed)

## Setup Instructions

The gem can be installed unto any [Ruby](https://rvm.io/rubies/installing)/[Gemset](https://rvm.io/gemsets/basics) in [RVM](https://rvm.io) and it will be used from there everywhere.

Since it is independent of any particular [Ruby](https://www.ruby-lang.org/en/) project, it is recommended you install unto the default [gemset](https://rvm.io/gemsets/basics) (or optionally into its own gemset if you prefer). Global gemset wouldn't be enough to share it since it does not cross Rubies yet is limited to a specific Ruby version.

Afterwards, run the `git-tui-setup` command from the same [Ruby](https://rvm.io/rubies/installing)/[Gemset](https://rvm.io/gemsets/basics) you installed the gem at to setup the `git-tui` function source in `~/.bash_profile` or `~/.bashrc` (whichever is available)

These are the commands you need to run in order to select a Ruby and gemset, install gem, and finally setup gem commands globablly in the shell environment:

```
rvm use @default # or a different ruby version/gemset like `rvm use ruby-3.1.0@git-tui --create`
gem install git-tui -v0.0.3
git-tui-setup
```

This will add the `git-tui` command (shell function with `git-ui` and `gitui` aliases) and `g` alias for `git`.

Additionally, the following global git configuration will be added to `~/.gitconfig`:

```ini
[alias]
  aa = add -A
  am = commit -am
  ap = add -p
  df = diff
  dh = diff HEAD
  br = branch
  co = checkout
  lp = log -p
  sa = stash apply
  sd = stash drop
  sh = stash -u
  sl = stash list
  sp = stash pop
  ss = stash save -u
  st = status
  cam = commit -am
  cl = clone
  ci = commit
  cia = commit --amend
  cm = commit -m
  m = commit -m
  mg = merge
  pk = cherry-pick
  ps = push
  pf = push --force-with-lease
  pl = pull
  pr = pull --rebase
  rb = rebase
  rc = rebase --continue
  rs = rebase --skip
  ra = rebase --abort
  ri = rebase --interactive
  rh = reset HEAD
[branch]
  autoSetupRebase = always
```

## Usage

Currently, only git branch checkout is supported.

Simply run this command:

```
gitui
```

Or one of the aliases:

```
git-ui
git-tui
```

## Contributing

-   Make sure you have [RVM](https://rvm.io) installed
-   Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
-   Check out the issue tracker to make sure someone already hasn't
    requested it and/or contributed it.
-   Fork the project.
-   Start a feature/bugfix branch.
-   `bundle`
-   Commit and push until you are happy with your contribution.
-   `rake install` to test (or `rake build`, `rvm use @default`, and then `gem install pkg/git-tui-{version}.gem`)
-   Please try not to mess with the Rakefile, version, or change log. If
    you want to have your own version, or is otherwise necessary, that
    is fine, but please isolate to its own commit so I can cherry-pick
    around it.

## TODO

[TODO.md](TODO.md)

## Change Log

[CHANGELOG.md](CHANGELOG.md)

## License

[MIT](LICENSE.txt)

Copyright (c) 2022 Andy Maleh
