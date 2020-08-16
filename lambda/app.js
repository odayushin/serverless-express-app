const serverlessExpress = require('aws-serverless-express/middleware');
var express = require('express');
var app = express();

app.use(serverlessExpress.eventContext());

app.get('/', (req, res) => {
    res.send({message: "Hello World"});
});

module.exports = app