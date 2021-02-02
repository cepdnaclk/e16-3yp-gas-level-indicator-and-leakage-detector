const express = require('express')
const Router = express.Router()
var connection = require('../connection')

Router.post('/',function(req,res){

    var email =req.body.email

    connection.query("select email from history where email = '"+email+"'",function (err, data) { //check if user already exists
        if (err) return res.sendStatus(400)   //incorrect token in the json
        if (!Object.keys(data).length) return res.sendStatus(400) //email doen't exists
  
        connection.query('SELECT * FROM history WHERE email = ?', [req.body.email], (err, rows, fields) => {
            if (!err) res.send(rows)
            else console.log(err)
        })
          
      })


      
})

module.exports = Router
