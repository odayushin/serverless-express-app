const serverlessExpress = require("aws-serverless-express/middleware");
var express = require("express");
var app = express();
const cors = require("cors");

app.use(cors());
app.use(serverlessExpress.eventContext());

app.get("/", (req, res) => {
  if (req.headers["authtoken"] != "allow") {
    res.status(404).send({ message: "NG" });
    return;
  }
  res.send({ message: "Hello World" });
});

module.exports = app;
