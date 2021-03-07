const express = require('express')
const Router = express.Router()
var connection = require('../connection')

Router.post('/', function(req, res, next) {
    console.log(req.body)  

    var device_id     = req.body.device_id
    var brand     = req.body.brand
    var size     = req.body.size
       

    connection.query("select device_id from devices where device_id = '"+device_id+"'",function (err, data) { //check if user already exists
      if (err) return res.sendStatus(400)   //incorrect token in the json
      if (!Object.keys(data).length) return res.sendStatus(401) //device id doesn't exist
      
      connection.query(`UPDATE devices SET brand = '${brand}' , size='${size}',balance_percentage = 100 WHERE device_id = '${device_id}';`,function (err, data) {
        if (err) throw err 
        res.sendStatus(200);    
        })
    })
    
  })

  module.exports = Router

  