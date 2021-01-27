# ansible-osx

Steps to set up a new Mac for development, and optionally some personal software too. 

N.B. This has been tested on macOS Catalina. Settings, specifically osx defaults, may well change between releases.

## Initial setup

Rename the Mac under `System Preferences > Sharing > Computer Name > Edit...`.

Sync up anty peripherals (so that defaults can apply to them).

Log in to the Mac App Store.

Install `homebrew` according to https://brew.sh.

Use hombrew to install `git` and `ansible`:

```shell script
brew install git ansible
```

Create (or restore) the `.ssh/id_rsa` and `.ssh/id_rsa.pub` files, making sure permissions are correct. Give the key
access to GitHub.

## Fetch and run the playbook

Check out this repo from GitHub:

```shell script
mkdir ~/git && cd ~/git && git clone git@github.com:dancmeyers/ansible-osx.git
```

Install the community package using `ansible-galaxy`:

```shell script
ansible-galaxy collection install community.general
```

Run the playbook (add `--skip-tags personal` to only install work-specific software etc):

```shell script
ansible-playbook playbook.yml --ask-become-pass
```

## Perform manual config steps

- Load GPG key into GnuPG
- Grant SSH key access to mended-drum via the `homedir_skel` repo
- Load Firefox and sign into gmail profile to sync extensions, bookmarks etc
- Load InfiniteFunSpace mTLS cert into Firefox (and keychain if Chrome wanted)
- Set 'Base' dynamic iTerm2 profile as default

Set the following iTerm2 options, which don't appear to be in the profile (maybe in the plist?):
- Appearance > Tabs > Show tab bar even when there is only one tab

## Start/log in to apps

- Docker
- Google Backup and Sync
- Jetbrains Toolbox
- Keybase
- Rectangle
- Slack

## Install/set up Jetbrains apps

Install via the Jetbrains Toolbox:
- IntelliJ IDEA Ultimate
- PyCharm Professional

### Plugins

#### Shared (all apps)

- .ignore
- AWS Toolkit
- Cloud Code (GCP tooling, disable unless gcloud configured)
- Code With Me
- HashiCorp Terraform
- Kubernetes
- Makefile support

#### IntelliJ IDEA

- Cursive
- Perl
- Scala

#### PyCharm

- Requirements

### Preferences

- Appearance & Behavior > Appearance > Theme > macOS Light
- Editor > Color Scheme > Darcula

## Dock shortcuts

- Firefox
- KeepassXC
- Slack
- Textual 7
- WhatsApp (if installed)
- Discord (if installed)
- Spotify (if installed)
- iTerm2
- IntelliJ IDEA
- PyCharm

## Restart

Restart the system to make sure all the settings are applied.

