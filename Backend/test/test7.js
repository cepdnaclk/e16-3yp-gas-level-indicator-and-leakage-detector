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



//leakage
describe("leakage", ()=>{
    it("leakage status should show correctly",(done)=>{
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
            token=response.body.accessToken

                const input = {
                    "device_id":"d0004"
                }
                chai.request(server)
                    .post("/leakage")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        console.log(`status code: ${response.statusCode}`)
                        response.should.have.status(200)
                        done()
                    })

        })
    })
})





