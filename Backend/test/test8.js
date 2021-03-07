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

describe("gas app api",()=>{
    
        //add tank
        describe("new tank adding", ()=>{
            it("new tank should added properly",(done)=>{
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
                        const tank = {
                            "device_id":"d0006",
                            "brand":"laughs gas",
                            "size":25 
                        }
                        chai.request(server)
                            .post("/newtank")
                            .set({ "Authorization": `Bearer ${token}` })
                            .send(tank)
                            .end((err,response)=>{
                                console.log(`status code: ${response.statusCode}`)
                                response.should.have.status(200)
                                done()
                            })
                })
            })
        })

})