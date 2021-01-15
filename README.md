# ansible-osx

Rename the Mac under `System Preferences > Sharing > Computer Name > Edit...`.

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

Load Firefox and sign into gmail profile to sync extensions, bookmarks etc.

Install IntelliJ IDEA/PyCharm etc via the Jetbrains Toolbox.

