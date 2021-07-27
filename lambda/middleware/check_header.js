function check_header(req, res, next) {
  if (req.headers["authtoken"] != "allow") {
    res.status(401).send({ message: "NG" });
    return;
  }
  next();
}

module.exports = check_header;
