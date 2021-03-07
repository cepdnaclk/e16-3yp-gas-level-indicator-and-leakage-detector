const express = require('express')
const passport = require('passport')
const bodyparser = require('body-parser')
const flash = require('express-flash')
const session = require('express-session')
const methodOverride = require('method-override')
var fs = require('fs')
var connection = require('./connection')

const app = express()
const port = 9001
const jwt = require('jsonwebtoken')
const initializePassport = require('./passport-config')
initializePassport(passport, email =>{ // passport configuration
    connection.query("select email from users where email = '"+email+"'",function (err, data) { //check if existing user
        if (err) return res.sendStatus(400)   
        if (!Object.keys(data).length)  { // if email doesnt exists
            fs.writeFile('user.txt',"", function (err) {
            if (err) throw err
            // console.log(rows)
          })
        }
        connection.query("select * from users where email = '"+email+"'",function(err,rows){	 //write user into user.txt
          fs.writeFile('user.txt', JSON.stringify(rows[0]), function (err) {
              if (err) throw err
              // console.log(rows)
            })
        })
    })
 })
app.use(bodyparser.json())
app.use(express.urlencoded({ extended: false }))
app.use(flash())
app.use(session({   
    secret: '887d44ccea6fb11e9f91f19c00f462ad0adf4415148b917b6bc09e6af593e62b03411c589ea9d19b2cb22a33ad6ad3fc33c89258cb306d7cbbf3b46c34113dff',
    resave: false,
    saveUninitialized: false
  }))
app.use(passport.initialize())
app.use(passport.session())
app.use(methodOverride('_method'))
app.use(express.json())

app.get('/',function(req,res){
    res.send('Home page for Authserver')
}) 
app.get('/failedlogin', (req, res) => {
    res.sendStatus(401)
  })
app.post('/login', passport.authenticate('local', {
    failureRedirect: '/failedlogin',
    failureFlash: true
  }),
  (req, res, next) => {
      const email = req.body.email  
      const user = { email: email }

      const accessToken = generateAccessToken(user)
      const refreshToken = jwt.sign(user, 'd63c8a0a01ee65371bdc7a8cf1f1fb34745908623f7dfd4971009da57e9d07f4c87884f121aa3011d4bed89956cd0bc301a89285e10c8f1cdfd5cc1114c4ad2d')
      var id = Date.now().toString()
      var sql = `INSERT INTO tokens (token_id, token) VALUES ('${id}', '${refreshToken}')` //insert token into database
      connection.query(sql,function (err, data) {
      if (err) throw err     
      })
      res.json({ accessToken: accessToken, refreshToken: refreshToken })
})

function generateAccessToken(user) {
return jwt.sign(user,'22bc94d70f4e7b86bc19d759a6bb382f8f4a4e6f111eeac0eabe7891ed15b39432b74829106dfc0b9f20e84185e67221abe6cd252cef1791e0d3744fa388d4db' , { expiresIn: '3600s' })
}

app.post('/token', (req, res) => {
    const refreshToken = req.body.token
    if (refreshToken == null) return res.sendStatus(401) //no token in the json
    
    var sql = "select token_id from tokens where token = '"+refreshToken+"'"
    connection.query(sql,function (err, data) {
    if (err) return res.sendStatus(400)   //incorrect token in the json
    if (!Object.keys(data).length) return res.sendStatus(403) //token expired
    jwt.verify(refreshToken, 'd63c8a0a01ee65371bdc7a8cf1f1fb34745908623f7dfd4971009da57e9d07f4c87884f121aa3011d4bed89956cd0bc301a89285e10c8f1cdfd5cc1114c4ad2d', (err, user) => {
        if (err) {
            return res.sendStatus(403)
        }
        const accessToken = generateAccessToken({ email: user.email })
        res.json({ accessToken: accessToken })
        console.log("New token generated")
      })
    })

  })

app.delete('/logout', (req, res) => {
    var del_token = req.body.token
    var sql = "delete from tokens where token = '"+del_token+"'"
    connection.query(sql,function (err, data) {
        if (err) throw err  
        res.sendStatus(204)   
        })
})

//start server
app.listen(port,function(req,res){
    console.log(`authServer listening at http://localhost:${port}`)
})

module.exports = app


