const express = require('express')
const Router = express.Router()
var connection = require('../connection')

Router.post('/',function(req,res){     

    var device_id = req.body.device_id

    connection.query("select device_id from devices where device_id = '"+device_id+"'",function (err, data) { //check if user already exists
        if (err) return res.sendStatus(400)   //incorrect token in the json
        if (!Object.keys(data).length) return res.sendStatus(400) //email doen't exists
  
        connection.query('SELECT balance_percentage FROM devices WHERE device_id = ?', [req.body.device_id], (err, rows, fields) => {
            if (!err) res.send(rows)
            else console.log(err)
        })
          
      })
})






module.exports = Router

