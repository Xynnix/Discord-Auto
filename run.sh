#!/bin/bash

if [ -d "./Bot" ]
then echo "Directory ./Bot exists"
        echo "Overwrite? [ y / n]"
        read yesno
        if [ $yesno = "y" ]
        then rm -r ./Bot
        echo "Please Run this again to redo the setup!"
        else echo "Exiting..."
        fi
else
echo "Error: Directory /path/to/dir does not exist. Creating it now..."
mkdir Bot && cd Bot
touch index.js && touch config.json

echo "Add your Token now..."
read Token
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
mv ../package.json .
npm install
echo '#   Successfully created basic bot...'
echo 'Delete run.sh? [ y / n ] [This is irreversable and will not allow you to redo this process!]'
        read DeleteRun
        if [ $DeleteRun = "y" ]
        then rm -r ../run.sh
        echo "# Deleted run.sh"
        else
        echo "Keeping run.sh!"
        echo "Starting Bot..."
        node ./index.js
        fi
fi
