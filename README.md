## Overview

Two Man is the open-source library the powers the Raspberry Pi based Two-Man Rule Launcher.

## Getting Started

##### Install

````
git clone https://github.com/aterris/two_man.git ~/.two_man
````

##### Add to Path

````
echo 'export PATH="$PATH:$HOME/.two_man/bin:"' >> ~/.zshrc
````

## Usage

##### View Installed Launch Codes
````
two_man codes
````

##### Start Two Man Rule Device

````
two_man start LAUNCH_CODE
````

## Manage Launch Codes

Launch Codes can be loaded from github public or private repos via any of the following formats

* `aterris/launch_codes`
* `git@github.com:aterris/launch_codes.git`
* `https://github.com/aterris/launch_codes.git`


##### Install Launch Codes
````
two_man install aterris/launch_codes
````

##### Update Launch Codes
````
two_man install aterris/launch_codes
````

##### Uninstall Launch Codes
````
two_man install aterris/launch_codes
````

##### View Installed Launch Code Source Repos
````
two_man sources
````

