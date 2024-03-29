# ansible-macos

Steps to set up a new Mac for development, and optionally some personal software too. 

N.B. This has been tested on macOS Catalina. Settings, specifically osx defaults, may well change between releases.

## Initial setup

Rename the Mac under `System Preferences > Sharing > Computer Name > Edit...`.

Sync up any peripherals (so that defaults can apply to them).

Log in to the Mac App Store.

Install `homebrew` according to https://brew.sh.

Use hombrew to install `git` and `ansible`:

```shell script
brew install git ansible
```

Create (or restore) the `.ssh/id_rsa` and `.ssh/id_rsa.pub` files, making sure permissions are correct. Give the key
access to GitHub.

## Install Rosetta 2 (if needed)

On Apple Silicon Macs, this will allow installation of software without a native ARM port. The updater is in
`/System/Library/CoreServices`, or can be launched from the command line with

```shell script
sudo softwareupdate --install-rosetta
```

This may well report an error as well as saying the install finished successfully, which seems to be fine...

## Fetch and run the playbook

Check out this repo from GitHub:

```shell script
mkdir ~/git && cd ~/git && git clone git@github.com:dancmeyers/ansible-macos.git
```

Install the community package using `ansible-galaxy`:

```shell script
ansible-galaxy collection install community.general
```

Run the playbook (add `--tags griffin|personal|etc` to only install specific software etc based on role. `base` is
included by default):

```shell script
ansible-playbook playbook.yml --ask-become-pass
```

## Perform manual config steps

- Load GPG key into GnuPG
- Grant SSH key access to mended-drum via the `homedir_skel` repo
- Load Firefox and sign into gmail profile to sync extensions, bookmarks etc
- Install the [1Password Classic Firefox plugin](https://support.1password.com/cs/1password-classic-extension/), that doesn't sync automatically from the Firefox profile.
- Load InfiniteFunSpace mTLS cert into Firefox (and keychain if Chrome wanted)
- Set iTerm2 to load preferences (Preferences > General > Preferences) from the plist in `basic_system/files`

## Start/log in to apps

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

Configure `Preferences` > `Version Control` > `Commit` > `Use non-modal commit interface`.

Use [IDE Settings Sync](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync) to sync
plugins, keymaps etc from other IDE installs.

### Plugins

#### Shared (all apps)

- .ignore
- AWS Toolkit
- Cloud Code (GCP tooling, disable unless gcloud configured)
- Code With Me
- File Watchers
- HashiCorp Terraform
- Kubernetes
- Makefile support
- Wrap to Column

Configure the Markdown plugin (bundled) to enable PlantUML support (Preferences > Languages & Frameworks > Markdown)

#### IntelliJ IDEA

- Cursive
- Perl (disable if not in use, conflicts with Cursive sometimes)
- Scala

#### PyCharm

- Requirements

### Preferences

- Appearance & Behavior > Appearance > Theme > macOS Light
- Editor > Color Scheme > Darcula
- Keymap > macOS custom

## Dock shortcuts

- Firefox
- Google Chrome
- Postman (if installed)
- 1Password
- Slack
- Textual 7 (if installed)
- Signal (if installed)
- WhatsApp (if installed)
- Discord (if installed)
- Spotify
- iTerm2
- IntelliJ IDEA
- PyCharm

## Restart

Restart the system to make sure all the settings are applied.
