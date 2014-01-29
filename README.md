## Two-Man

[![Build Status](https://travis-ci.org/aterris/two_man.png?branch=master)](https://travis-ci.org/aterris/two_man)
[![Code Climate](https://codeclimate.com/github/aterris/two_man.png)](https://codeclimate.com/github/aterris/two_man)
[![Coverage Status](https://coveralls.io/repos/aterris/two_man/badge.png)](https://coveralls.io/r/aterris/two_man)

The code that powers the [Two-Man Rule Raspberry Pi Launcher](http://two-man.com)

## Getting Started

##### Install

````
git clone https://github.com/aterris/two_man.git ~/.two_man
````

##### Add to Path

````
echo 'export PATH="$PATH:$HOME/.two_man/bin"' >> ~/.zshrc
````

## Usage

##### View Installed Launch Codes
````
two_man codes
````

##### Start Two Man Rule Launcher

````
two_man start LAUNCH_CODE
````

## Manage Launch Codes

Launch Codes can be loaded from github public or private repos via any of the following formats

* `aterris/sample_launch_codes`
* `git@github.com:aterris/sample_launch_codes.git`
* `https://github.com/aterris/sample_launch_codes.git`


##### Install Launch Code Repo
````
two_man install aterris/sample_launch_codes
````

##### Update Launch Code Repo
````
two_man install aterris/sample_launch_codes
````

##### Uninstall Launch Code Repo
````
two_man install aterris/sample_launch_codes
````

##### View Installed Launch Code Source Repos
````
two_man sources
````

## Custom Launch Codes

You can create custom launch codes and load them from public or private repos. [Learn more](https://github.com/aterris/sample_launch_codes)
