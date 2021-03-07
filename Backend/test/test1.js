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

//home
describe("home page", ()=>{
    it("Succefully home page loaded",(done)=>{
        chai.request(server)
            .get("/")
            .end((err,response)=>{
                response.should.have.status(200)
                done()
            })
    })

})
