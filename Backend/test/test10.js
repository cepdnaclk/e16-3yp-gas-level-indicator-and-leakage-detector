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
        //incorrect device id
        describe("invalid device adding", ()=>{
            it("should not add the device: status code should not be 200",(done)=>{
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
                        "device_id":"d0051",
                        "device_name":"gas cooker"
                    }
                    chai.request(server)
                        .post("/newdevice")
                        .set({ "Authorization": `Bear   er ${token}` })
                        .send(device)
                        .end((err,response)=>{
                            console.log(`status code: ${response.statusCode}`)
                            expect(response.statusCode).to.not.equal(200)
                            done()
                        })
            })
        })
    })
})