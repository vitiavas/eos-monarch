# Basic project template for EOS dApps

The project template can be used both in VS Code and CLion. It's part of the ["How to setup VS Code and CLion for EOS dApp Development"](https://infinitexlabs.com/setup-ide-for-eos-development/) tutorial. 

# Install Raspi-config

https://github.com/snubbegbg/install_raspi-config



# Dependencies

* Python 3.5 or above. (sudo apt-get install python3)
* pip 3.5 or above (sudo apt install python3-pip).
* EOSFactory depends on termcolor and psutil nonstandard Python packages. It can be installed by running: 
* * pip3 install --user termcolor
* * pip3 install --user psutil
* EOSFactory v3.4.0 or above. (https://eosfactory.io/build/html/tutorials/01.InstallingEOSFactory.html)
* EOSIO v1.8.0.
* eosio.cdt v1.6.1
(https://developers.eos.io)


# Installation

If all the dependencies are satisfied, EOSIDE should start ready to work, with its title bar menu.

# Setting the default workspace directory

With newly installed EOSFactory, EOSIDE forces setting of the workspace.


# Compile 

scripts/build.sh

# Deploy

scripts/deploy.sh

# Full Build

scripts/fullBuild.sh

# Test contract 

Test scripts reside in the directory 'tests'. Execute test with the following command.
* python3 tests/test.py