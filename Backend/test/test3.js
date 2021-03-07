let chai = require('chai')
var expect = chai.expect;
let chaiHttp = require('chai-http')
var supertest = require('supertest');
let server = require('../app')
let authServer = require('../authServer')
var token = "token"

//Assertion style
chai.should()
chai.use(chaiHttp)

//login
describe("login", ()=>{
    it("kasuni should login properly",(done)=>{
        const user = {
            "email":"kasuni@gmail.com",
            "password":"kasuni"
        }
        chai.request(authServer)
            .post("/login")
            .send(user)
            .end((err,response)=>{
            })
        chai.request(authServer)
        .post("/login")
        .send(user)
        .end((err,response)=>{  
            expect(response.statusCode).to.equal(200);
            done()
        })
    })
})

