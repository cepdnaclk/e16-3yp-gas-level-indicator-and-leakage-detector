const express = require('express')
//init app
const app = express()   
const port = 9000

//home route
app.get('/',function(req,res){
    res.send('Hello Client!')
})
app.get('/login',function(req,res){
    res.send('Login page')
})
app.get('/signup',function(req,res){
    res.send('Sign up page')
}) 
app.get('/user:id',function(req,res){
    const id = req.params.id
    res.send('Welcome User'+id)
})
app.get('/user',function(req,res){
    const id = req.query.id
    res.send('Welcome User'+id)
})

//start server
app.listen(9000,function(req,res){
    console.log('Running..')
})


