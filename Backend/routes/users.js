const express = require('express')
const Router = express.Router()
var connection = require('../connection')

Router.get('/',function(req,res){
    connection.query("SELECT * FROM users", function (err, result, fields) {
        if (err) throw err
        res.send(result)
    })
})

module.exports = Router
