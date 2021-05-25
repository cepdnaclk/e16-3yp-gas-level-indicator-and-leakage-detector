const express = require('express')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
var fs = require('fs')
const passport = require('passport')
const Router = express.Router()
var connection = require('../connection')
const initializePassport = require('../passport-config')
initializePassport(passport, email =>{ // passport configuration
    connection.query("select * from users where email = '"+email+"'",function(err,rows){	 //write use rinto user.txt
     fs.writeFile('user.txt', JSON.stringify(rows[0]), function (err) {
       if (err) throw err
       console.log(rows)
     })
     })
 })

Router.post('/', passport.authenticate('local', {
    failureRedirect: '/failedlogin',
    failureFlash: true
}),
(req, res, next) => {
  const email = req.body.email  
  const user = { email: email }

  const accessToken = jwt.sign(user, process.env.ACCESS_TOKEN_SECRET)
  res.json({ accessToken: accessToken})
})

module.exports = Router