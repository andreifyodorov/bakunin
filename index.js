var express = require('express');
var server = express();

server.use('/', express.static(__dirname + '/src'));
console.log('Listening to port 8080')
server.listen(8080);