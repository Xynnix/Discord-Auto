#!/bin/bash

if [ -d "./Bot" ]
then echo "Error: Directory ./Bot exists"
        echo "Overwrite? [ y / n]"
        read yesno
        if [ $yesno = "y" ]
        then rm -r ./Bot
        echo "Please Run this again to redo the setup!"
        else echo "Exiting..."
        fi
else
echo "Directory ./Bot does not exist. Creating it now..."
mkdir Bot && cd Bot
touch index.js && touch config.json

echo "Add your Bot Token now..."
read -s Token
echo "Add your OwnerID now..."
read OwnerID
echo "Add your Prefix now."
read Prefix

echo "const Discord = require('discord.js');" >> index.js
echo "const client = new Discord.Client()" >> index.js
echo "const config = require('./config.json');" >> index.js
echo "const prefix = config.prefix;" >> index.js
echo " " >> index.js
echo "client.on('ready', () =>{" >> index.js
echo "    console.log('Ready!');" >> index.js
echo "});" >> index.js
echo "client.on('message', (message) =>{" >>index.js
echo "    if (message.author.bot) return;" >> index.js
echo "    if (message.content === prefix + 'ping')" >> index.js
echo "       message.channel.send('pang');" >> index.js
echo "});" >> index.js
echo "client.login(config.token);" >> index.js
echo "{" >> config.json
echo '    "token": "'$Token'",' >> config.json
echo '    "OwnerID": "'$OwnerID'",' >> config.json
echo '    "prefix": "'$Prefix'"' >> config.json
echo "}" >> config.json
echo "# installing discord.js now with npm"
if which node > /dev/null
    then
        echo "Node is installed, continuing npm..."
    else
	echo "Node is Not installed! Installing..."
	apt update && apt upgrade
	apt install nodejs -y
    fi
if [ -f "../package.json" ]
then mv ../package.json . && npm install
else npm init -y > /dev/null && npm install discord.js
echo '#   Successfully created basic bot...'
if [ -f "../run.sh" ]
then echo "File ./run.sh still exists."
        echo "Delete? [ y / n]"
        read yaynay
        if [ $yaynay = "y" ]
        then echo "Deleted run.sh & Starting!"
        rm -r ./run.sh && node index.js
        else echo "Keeping run.sh & Starting Bot!"
	node ./index.js
            fi
	fi
    fi
fi
