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



//history
describe("show history", ()=>{
    it("history of device 1",(done)=>{
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
                    .post("/history")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        response.should.have.status(200)
                        done()
                    })

        })
    })
    it("history of device 2",(done)=>{
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
                    "device_id":"d0010"
                }
                chai.request(server)
                    .post("/history")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        response.should.have.status(200)
                        done()
                    })

        })
    })
    it("history of device 3",(done)=>{
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
                    "device_id":"d0011"
                }
                chai.request(server)
                    .post("/history")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        response.should.have.status(200)
                        done()
                    })

        })
    })
    it("history of device 4",(done)=>{
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
                    "device_id":"d0012"
                }
                chai.request(server)
                    .post("/history")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        response.should.have.status(200)
                        done()
                    })

        })
    })

})



