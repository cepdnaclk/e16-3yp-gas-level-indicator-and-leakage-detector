const express = require('express')
const bcrypt = require('bcrypt')
const Router = express.Router()
var connection = require('../connection')

Router.post('/', async function(req, res, next) {
  
    var email        = req.body.email
    var mobile_number= req.body.mobile_number

    if(req.body.password!=undefined){
      try{
        await bcrypt.hash(req.body.password, 10, function(err, hash) {
          if (err) {
          return next(err);
          }
          var hashedPassword = hash
          connection.query("select email from users where email = '"+email+"'",function (err, data) { //check if user already exists
            if (err) return res.sendStatus(400)   //incorrect token in the json
            if (Object.keys(data).length) return res.sendStatus(409) //email already exists
  
            connection.query(`INSERT INTO users ( email, password, mobile_number ) VALUES ('${email}', '${hashedPassword}', ${mobile_number} )`,function (err, data) {
            if (err) throw err
            console.log("User data is inserted successfully")     
            res.sendStatus(200)
            })  
          })
        })

      }
      catch {
        res.redirect('/')
      }
    }
    
  })

  module.exports = Router



