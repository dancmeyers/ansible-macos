# ansible-macos

Steps to set up a new Mac for development, and optionally some personal software too. 

N.B. This has been tested on macOS Sequoia. Settings, specifically osx defaults, may well change between releases.

## Initial setup

Rename the Mac under `System Preferences > Sharing > Computer Name > Edit...` (unless overridden by employer policy).

Sync up any peripherals (so that defaults can apply to them).

Log in to the Mac App Store.

Install `homebrew` according to https://brew.sh.

Use hombrew to install:
- `ansible`
- `git`
- `gnupg`
- `google-drive`
- `pinentry-mac`

```shell script
brew install ansible git gnupg pinentry-mac
brew install --cask google-drive
```

Connect Google Drive, then load our ASCII-armoured public key from it into GPG:
```
gpg --import ~/Google\ Drive/My\ Drive/certs/${USER}.pub.asc
```

N.B. the command to export this if modified is:
```
gpg --export --armor --output ~/Google\ Drive/My\ Drive/certs/${USER}.pub.asc 05A20464921EF1F031D860606A9F5EC6EF6A1B68
```
The equivalent including the secret key (only works if the secret key is in the keychain, not on the Yubikey)
```
gpg --export-secret-keys --export-options export-backup --armor --output ~/Google\ Drive/My\ Drive/certs/${USER}.asc 05A20464921EF1F031D860606A9F5EC6EF6A1B68
```

Configure it for ultimate trust:
```
gpg --edit-key 05A20464921EF1F031D860606A9F5EC6EF6A1B68
gpg> trust
<option 5>
<exit>
```

Create the following 2 config files, so that `git` and `ssh` can fetch keys correctly:
`~/.gnupg/gpg-agent.conf`:
```
pinentry-program /opt/homebrew/bin/pinentry-mac
enable-ssh-support
default-cache-ttl 600
max-cache-ttl 7200
```

`~/.gnupg/gpg.conf`:
```
default-key 05A20464921EF1F031D860606A9F5EC6EF6A1B69
auto-key-retrieve
no-emit-version
```

Reload the GPG agent to pick up the changes:
```
gpg-connect-agent reloadagent /bye
```

Temporarily export the `SSH_AUTH_SOCK` env var to allow SSH to communicate with `gpg-agent`:
```
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
```

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

- Load Firefox and sign into gmail profile to sync extensions, bookmarks etc
- Load InfiniteFunSpace mTLS cert into Firefox (and keychain if Chrome wanted)
- Install LogiTune
- Configure Trailer (if installed): import from Google Drive under `Work`
- Configure Velja (if installed)

## Start/log in to apps

- Docker
- Google Backup and Sync
- Jetbrains Toolbox
- Keybase
- Slack

## Install/set up Jetbrains apps

Install via the Jetbrains Toolbox:
- IntelliJ IDEA Ultimate
- PyCharm Professional

Configure `Preferences` > `Version Control` > `Commit` > `Use non-modal commit interface`.

Use [IDE Settings Sync](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync) to sync
plugins, keymaps etc from other IDE installs.

### Plugins

Configure the Markdown plugin (bundled) to enable PlantUML support (Preferences > Languages & Frameworks > Markdown)

## Restart

Restart the system to make sure all the settings are applied.
