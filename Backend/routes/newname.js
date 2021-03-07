const express = require('express')
const Router = express.Router()
var connection = require('../connection')

Router.post('/',function(req,res){ 
    var device_id = req.body.device_id
    var device_name = req.body.device_name
   
    connection.query("select device_id from devices where device_id = '"+device_id+"'",function (err, data) { //check if user already exists
        if (err) return res.sendStatus(400)   //incorrect token in the json
        if (!Object.keys(data).length) return res.sendStatus(400) //email doen't exists
  
        connection.query("update devices set device_name  = '"+device_name+"' where device_id = '"+device_id+"' ", (err, rows, fields) => {
            if (err) console.log(err)
            res.sendStatus(200)
        })
          
      })
})






module.exports = Router

