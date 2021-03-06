#!/bin/bash
###################################################################
#         Author: Aland Mariwan
#           Link: http://github.com/amariwan/bash-scripts
#    Description: Script to remove old and install latest Node.js on Raspberry Pi (Raspbian Jessie)
###################################################################

nodeVersion=`node -v`

Color_Off='\033[0m'
Color_Red='\033[0;31m'
Color_Green='\033[0;32m'
Color_Blue='\033[0;34m'
Color_Cyan='\033[0;36m'

echo -e "Current Node version is ${Color_Cyan}${nodeVersion}${Color_Off}"

# remove existing
echo -e "
${Color_Cyan}Removing Node-RED.. ${Color_Off}"
sudo apt remove -y nodered

echo -e "
${Color_Cyan}Removing Node.js... ${Color_Off}"
sudo apt remove -y nodejs nodejs-legacy

echo -e "
${Color_Cyan}Removing npm... ${Color_Off}"
sudo apt remove -y npm

# install latest
echo -e "
${Color_Cyan}Downloading latest Node.js ARM-version.. ${Color_Off}"
cd /tmp/
wget https://node-arm.herokuapp.com/node_latest_armhf.deb

echo -e "${Color_Cyan}Installing Node.js .. this will take a while .. ${Color_Off}"
sudo dpkg -i node_latest_armhf.deb

# cleanup
echo -e "
${Color_Cyan}Cleaning up .. ${Color_Off}"
rm -rf /tmp/node_latest_armhf.deb
sudo apt autoremove -y

# confirm version
echo -e "
${Color_Green}Successfully installed. Node.js version is: ${nodeVersion} 
${Color_Off}"
