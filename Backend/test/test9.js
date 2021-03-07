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


    
//percentage

describe("show percentage", ()=>{
    it("device 1 percentagey",(done)=>{
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
                    .post("/percentage")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        console.log(`status code: ${response.statusCode}`)
                        console.log(response.text)
                        response.should.have.status(200)
                        done()
                    })
        })
    })
    it("device 2 percentage",(done)=>{
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
                    .post("/percentage")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        console.log(`status code: ${response.statusCode}`)
                        console.log(response.text)
                        response.should.have.status(200)
                        done()
                    })
        })
    })
    it("device 3 percentage",(done)=>{
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
                    .post("/percentage")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        console.log(`status code: ${response.statusCode}`)
                        console.log(response.text)
                        response.should.have.status(200)
                        done()
                    })
        })
    })
    it("device 4 percentage",(done)=>{
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
                    .post("/percentage")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(input)
                    .end((err,response)=>{
                        console.log(`status code: ${response.statusCode}`)
                        console.log(response.text)
                        response.should.have.status(200)
                        done()
                    })
        })
    })
})

