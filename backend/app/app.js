const express = require('express')
const bodyparser = require('body-parser');
const usersroute = require('./routes/users')
var connection = require('./connection')

//init app
const app = express()   
const port = 9000
app.use(bodyparser.json())

//home route
app.get('/',function(req,res){
    res.send('Home page')
})
app.get('/login',function(req,res){
    res.send('Login page')
})

app.use('/users',usersroute)

//Get an user
app.get('/users/:id', (req, res) => {
    connection.query('SELECT * FROM users WHERE id = ?', [req.params.id], (err, rows, fields) => {
        if (!err) res.send(rows)
        else console.log(err)
    })
})

//Delete an user
app.delete('/users/:id', (req, res) => {
    connection.query('DELETE FROM users WHERE id = ?', [req.params.id], (err, rows, fields) => {
        if (!err) res.send('Deleted successfully.');
        else console.log(err);
    })
})

//start server
app.listen(port,function(req,res){
    console.log(`Example app listening at http://localhost:${port}`)
})
