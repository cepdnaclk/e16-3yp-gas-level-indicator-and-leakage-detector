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
    //home
    describe("home", ()=>{
        it("it should access to home page",(done)=>{
            chai.request(server)
                .get("/")
                .end((err,response)=>{
                    response.should.have.status(200)
                    done()
                })
        })

    })

    //signup
    describe("sign up", ()=>{
        it("it should signup properly",(done)=>{
            const user = {
                "email":"rusiru@gmail.com",
                "password":"rusiru",
                "mobile_number":"0745663217"
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

    //login
    describe("login", ()=>{
        it("it should login properly",(done)=>{
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

})