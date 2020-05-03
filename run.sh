mkdir Bot && cd Bot
touch index.js && touch config.json
echo "const Discord = require('discord.js');" >> index.js
echo "const client = new Discord.Client()" >> index.js
echo "const config = require('./config.json');" >> index.js
echo "  " >> index.js
echo "client.on('ready', () =>{" >> index.js
echo "    console.log('Ready!');" >> index.js
echo "};" >> index.js
echo "client.on('message', (message) =>{" >>index.js
echo "    if (message.author.bot) return;" >> index.js
echo "    if (message.content === prefix + 'ping')" >> index.js
echo "       message.channel.send('pang');" >> index.js
echo "};" >> index.js
echo "client.login(config.token);" >> index.js
echo "{" >> config.json
echo '    "token": "insert-bot-token",' >> config.json
echo '    "prefix": "?" ' >> config.json
echo "}" >> config.json
echo "# installing discord.js now with npm"
mv ../package.json .
npm install
echo '#   Successfully created basic bot...'
echo "# Please add your token in config.json"
echo "# Deleted run.sh"
rm ../run.sh
