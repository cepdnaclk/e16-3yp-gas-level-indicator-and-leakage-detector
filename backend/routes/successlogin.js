const express = require('express')
const Router = express.Router()

Router.get('/',function(req,res){
  console.log(req.body)
  res.send("Succesfully logged in")
})

module.exports = Router