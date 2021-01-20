const express = require('express')
const Router = express.Router()
var connection = require('../connection')

Router.post('/', function(req, res, next) {
    // store all the user input data
    const userDetails=req.body

    // insert user data into users table
    var sql = 'INSERT INTO users SET ?'
    connection.query(sql, userDetails,function (err, data) { 
        if (err) throw err
        console.log("User data is inserted successfully ")        
    })
    let userid = userDetails.id
    res.redirect(`users/${userid}`);  // redirect to user form page after inserting the data
  })

  module.exports = Router