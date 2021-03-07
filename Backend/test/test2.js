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



//signup
describe("sign up", ()=>{
    it("yasiru should signup properly",(done)=>{
        const user = {
            "email":"yasiru@gmail.com",
            "password":"yasiru",
            "mobile_number":"0725663217"
        }
        chai.request(server)
            .post("/signup")
            .send(user)
            .end((err,response)=>{
                response.should.have.status(200)
                done()
            })
    })
    it("namal should signup properly",(done)=>{
        const user = {
            "email":"namal@gmail.com",
            "password":"namal",
            "mobile_number":"0725645697"
        }
        chai.request(server)
            .post("/signup")
            .send(user)
            .end((err,response)=>{
                response.should.have.status(200)
                done()
            })
    })
    it("niroshana should signup properly",(done)=>{
        const user = {
            "email":"niroshana@gmail.com",
            "password":"niroshana",
            "mobile_number":"0724565697"
        }
        chai.request(server)
            .post("/signup")
            .send(user)
            .end((err,response)=>{
                response.should.have.status(200)
                done()
            })
    })
    it("ramal should signup properly",(done)=>{
        const user = {
            "email":"ramal@gmail.com",
            "password":"ramal",
            "mobile_number":"0729876697"
        }
        chai.request(server)
            .post("/signup")
            .send(user)
            .end((err,response)=>{
                response.should.have.status(200)
                done()
            })
    })
    it("didula should signup properly",(done)=>{
        const user = {
            "email":"didula@gmail.com",
            "password":"didula",
            "mobile_number":"0715645697"
        }
        chai.request(server)
            .post("/signup")
            .send(user)
            .end((err,response)=>{
                response.should.have.status(200)
                done()
            })
    })

})
