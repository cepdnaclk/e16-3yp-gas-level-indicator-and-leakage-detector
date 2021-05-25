//modules
const express = require('express')
const jwt = require('jsonwebtoken')
const bodyParser = require('body-parser')
const axios = require('axios')

//routes
const signuproute = require('./routes/signup')
const successloginroute = require('./routes/successlogin')
const failedloginroute = require('./routes/failedlogin')
const newdeviceroute = require('./routes/newdevice')
const devicesroute = require('./routes/devices')
const historyroute = require('./routes/history')
const newtankroute = require('./routes/newtank')
const percentageroute = require('./routes/percentage')
const leakageroute = require('./routes/leakage')
const newnameroute = require('./routes/newname')
const usersroute = require('./routes/users')
   
//init app
const app = express()   
const port = 9000
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json())

//home route -----------------------------------------------------------------------------
app.get('/',function(req,res){
    res.send('Home page for main app')
}) 
app.post('/test',function(req,res,done){
  axios({
    method: 'post',
    url: 'http://localhost:9001/login',
    data: req.body
  })
  axios({
    method: 'post',
    url: 'http://localhost:9001/login',
    data: req.body
  }).then(function (response) {
    res.send(response.data)
    done()
  });
}) 

app.use('/signup',signuproute)
app.use('/successlogin',successloginroute)
app.use('/failedlogin',failedloginroute)
app.use('/newdevice',authenticateToken,newdeviceroute)
app.use('/devices',devicesroute)
app.use('/percentage', authenticateToken,percentageroute)
app.use('/newtank', authenticateToken,newtankroute)
app.use('/history', authenticateToken,historyroute)
app.use('/leakage', authenticateToken,leakageroute)
app.use('/newname', authenticateToken,newnameroute)
// app.use('/users',usersroute)
 
// function checkAuthenticated(req, res, next) {
//     if (req.isAuthenticated()) return next()
//     res.redirect('/failedlogin')
//   }
  
// function checkNotAuthenticated(req, res, next) {
//   if (req.isAuthenticated()) return res.redirect('/successlogin')
//   next()
// }

function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization']
  const token = authHeader && authHeader.split(' ')[1]
  if (token == null) return res.sendStatus(401)

  jwt.verify(token, '22bc94d70f4e7b86bc19d759a6bb382f8f4a4e6f111eeac0eabe7891ed15b39432b74829106dfc0b9f20e84185e67221abe6cd252cef1791e0d3744fa388d4db', (err, user) => {
    console.log( )
    if (err) return res.sendStatus(403)
    req.user = user
    next()
  })
}

//start server
app.listen(port,function(req,res){
    console.log(`main app listening at http://localhost:${port}`)
})

module.exports = app
