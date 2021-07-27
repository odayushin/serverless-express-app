const serverlessExpress = require("aws-serverless-express/middleware");
var express = require("express");
var app = express();
const cors = require("cors");
const check_header = require("./middleware/check_header");

app.use(cors());
app.use(serverlessExpress.eventContext());

app.use(check_header);
app.get("/", (req, res) => {
  res.send({ message: "Hello World" });
});

module.exports = app;
