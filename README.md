# ansible-osx

Steps to set up a new Mac for development and optionally some personal utilities too. 

Rename the Mac under `System Preferences > Sharing > Computer Name > Edit...`.

Log in to the Mac App Store.

Install `homebrew` according to https://brew.sh.

Use hombrew to install `git` and `ansible`:

```shell script
brew install git ansible
```

Create (or restore) the `.ssh/id_rsa` and `.ssh/id_rsa.pub` files, making sure permissions are correct. Give the key access to GitHub.

Check out this repo from GitHub:

```shell script
mkdir ~/git && cd ~/git && git clone git@github.com:dancmeyers/ansible-osx.git
```

Install the community package using `ansible-galaxy`:

```shell script
ansible-galaxy collection install community.general
```

Run the playbook:

```shell script
ansible-playbook playbook.yml --ask-become-pass
```

Set OS defaults that don't seem to work right when set via the CLI:
- Trackpad settings

Load GPG key into GnuPG.

Grant SSH key access to mended-drum via `homedir_skel` repo.

Load Firefox and sign into gmail profile to sync extensions, bookmarks etc.

Load InfiniteFunSpace mTLS cert into Firefox (and keychain if Chrome wanted).

Set 'Base' dynamic iTerm2 profile as default.

Install IntelliJ IDEA and PyCharm via the Jetbrains Toolbox. Configure the toolbox to install shell scripts (in `/usr/local/bin`).
Install the following addons:
IntelliJ IDEA:
- .ignore
- AWS Toolkit?
- Code With Me
- Cursive
- HashiCorp Terraform
- Kubernetes
- Makefile support
- Perl
- Scala
PyCharm:
- .ignore
- Code With Me
- HashiCorp Terraform
- Kubernetes
- Makefile support
- Requirements

Setup preferences:
- Appearance & Behavior > Appearance > Theme > macOS Light
- Editor > Color Scheme > Darcula

Setup shortcuts.
