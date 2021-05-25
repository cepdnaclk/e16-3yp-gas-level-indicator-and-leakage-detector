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


//new device
describe("adding new device", ()=>{
    it("new device should added properly",(done)=>{
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
                const device = {
                    "device_id":"d0999",
                    "device_name":"gas cooker"
                }
                chai.request(server)
                    .post("/newdevice")
                    .set({ "Authorization": `Bearer ${token}` })
                    .send(device)
                    .end((err,response)=>{
                        console.log(`status code: ${response.statusCode}`)
                        response.should.have.status(200)
                        done()
                    })

        })
    })
})


