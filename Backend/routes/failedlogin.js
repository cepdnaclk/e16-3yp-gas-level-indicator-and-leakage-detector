const express = require('express')
const Router = express.Router()

Router.get('/',function(req,res){
    res.sendStatus(401)
})

module.exports = Router