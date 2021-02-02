const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt')
const fs = require('fs').promises
var user //global variable for user

function initialize(passport, getUserByEmail) {
  const authenticateUser = async (email, password, done) => {
     
    getUserByEmail(email) //write user into user.txt
  
    try { //read user from user.txt
      user = JSON.parse(await fs.readFile('user.txt', 'utf-8', (err, data) => { 
        if (err) throw err
        return data
      }))
      } catch (err) {
        console.log(err)
        return done(err)
      }
    
    if (user == null) { 
      return done(null, false, { message: 'No user with that email' })
    } 
    try {
      if (await bcrypt.compare(password, user.password)) {
        // console.log("Successfully logged in.")
        return done(null, user)
      } else {
        console.log("Password incorrect.")
        return done(null, false, { message: 'Password incorrect' })
      }
    } catch (e) {
      return done(e)
    }

  }

  passport.use(new LocalStrategy({ usernameField: 'email' }, authenticateUser))
  passport.serializeUser((user, done) => done(null, user.email))
  passport.deserializeUser((email, done) => {return done(null, user)})
}

module.exports = initialize

