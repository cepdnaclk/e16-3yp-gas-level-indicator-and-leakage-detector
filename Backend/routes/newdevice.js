const express = require('express')
const Router = express.Router()
var connection = require('../connection')

Router.post('/', function(req, res, next) {


    if(req.body.device_id!=undefined){
      try{
        console.log(req.body)  

        var device_id     = req.body.device_id
        var device_name     = req.body.device_name
        var email     = req.user.email
        
        connection.query("select device_id from devices where device_id = '"+device_id+"'",function (err, data) { //check if user already exists
          if (err) return res.sendStatus(400)   //incorrect token in the json
          if (Object.keys(data).length) return res.sendStatus(409) //device id already exists
    
          connection.query(`INSERT INTO devices (device_id,device_name, email) VALUES ('${device_id}','${device_name}', '${email}')`,function (err, data) {
            if (err) throw err     
            })
            console.log("successfully new device added")
            res.sendStatus(200);  // successfully new device added
        })

      }
      catch {
        res.redirect('/')
      }
    }

  })

  module.exports = Router
