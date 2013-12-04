# Pivotal AppCode Preferences #

This is a fork of original pivotal rubymine preferences adopted to be used with AppCode.
Once upon a time, AppCode shipped with keybindings that made no sense to anyone who had ever used a Mac. Hence, the Pivotal AppCode preferences were born. It includes:

* Keymaps
* Ruby Code Styles
* Live Templates (ruby, jasmine)

Today, this project is not only a repository of Pivotal's preferences for AppCode - it's also a recommended workflow for tracking your team's customizations to AppCode preferences.

## Installation ##

First, *close AppCode*.

Then, run the following commands:

```sh
git clone http://github.com/luxedigital/Pivotal-Preferences-AppCode.git
cd Pivotal-Preferences-AppCode
./appcodeprefs install
```

This will install the preferences into your *latest* version of AppCode found in your ~/Library/Preferences folder.
For example, if you have both AppCode5 and AppCode2 installed, it will only install the preferences into AppCode2.

## Tracking changes ##

The installation process symlinks the pivotal preferences into your appcode preferences folder. Thus, as you and
your team change your preferences inside AppCode, your clone of the preferences will note the changes, and you can
commit and push those changes to your own fork (or even submit pull requests back to the Pivotal repo for anything
you think is generally useful).

## Uninstall ##

If you'd like to uninstall the pivotal preferences and restore your original settings, first, *close AppCode*.
Then open a terminal and run the following commands:

```sh
cd /path/to/your/Pivotal-Preferences-AppCode
./appcodeprefs uninstall
```
