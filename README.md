## Overview

Two Man is the open-source library that powers the Raspberry Pi based Two-Man Rule Launcher.

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

##### Start Two Man Rule Launcher

````
two_man start LAUNCH_CODE
````

## Manage Launch Codes

Launch Codes can be loaded from github public or private repos via any of the following formats

* `aterris/launch_codes`
* `git@github.com:aterris/launch_codes.git`
* `https://github.com/aterris/launch_codes.git`


##### Install Launch Code Repo
````
two_man install aterris/launch_codes
````

##### Update Launch Code Repo
````
two_man install aterris/launch_codes
````

##### Uninstall Launch Code Repo
````
two_man install aterris/launch_codes
````

##### View Installed Launch Code Source Repos
````
two_man sources
````

## Custom Launch Codes

You can create as many launch codes as you would like and store them in private or public repositories. Your Launch Codes should take the following form.

````
module LaunchCode
  module CustomLaunchCode
  
    def self.launch
      puts "Launch!"
    end

  end
end
````

