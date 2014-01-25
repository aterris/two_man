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

##### Install Additional Launch Codes
````
two_man install REPO_URL
````

##### Start Two Man Rule Device

````
two_man start LAUNCH_CODE
````