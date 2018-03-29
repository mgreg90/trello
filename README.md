# Trello

Trello is a [playwright-cli](https://github.com/mgreg90/playwright-cli) script that lets you set and subsequently open
the trello board for your project from the command line.

Currently only supported on mac.

## Installation

This script relies on the playwright-cli gem. Sharing features are still
in development for playwright, so for now, you'll need to run the following
commands to install it.

```shell
$ gem install playwright-cli
$ mkdir -p "$HOME/.playwright/plays"
$ cd "$HOME/.playwright/plays" && git clone git@github.com:mgreg90/trello.git
$ ln -s trello "$HOME/.playwright/plays/trello/trello.rb" "/usr/local/bin/trello"
```

In the future, expect a `$ playwright get trello` command to exist.

## Usage

Open your terminal and cd into the directory of the project you'd like to use
this script with. Set the url with:
```shell
$ trello set http://my-trello-board-url.com
```

Then to open your trello board, simply use:
```shell
$ trello open
```

To see what your current trello url is, use:
```shell
$ trello url
```

## Thanks!

Thanks for checking out my script. If you're interested in ruby scripting,
consider creating a [playwright-cli](https://github.com/mgreg90/playwright-cli) script of your own!