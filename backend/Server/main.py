from Server import app
from typing import Optional,List
from pydantic import BaseModel, EmailStr, Field
from fastapi import Depends, FastAPI,status,Body,Response
    
# signup form class
class SignUpForm(BaseModel):
    username: str = Field(...)
    password: str=Field(...)
    tel_no: str = Field(...)
    email: Optional[EmailStr] = Field(...)   
    
# login form class
class LoginForm(BaseModel):
    username: str = Field(...)
    password: str= Field(...)

# to store users
users=dict()

@app.get("/")
def read_root():
    return {"Hello": "Customer"}

@app.post("/signup")
async def signup(response: Response,signupuser: SignUpForm = Body(...)):
    if signupuser.username in users:
        return {"status":"This username already exists. Please try with an another username."}
    users[signupuser.username]=signupuser
    print(users)
    return {"status":"Succesfully signed up."}   

@app.post("/login")
async def login(response: Response,loginuser: LoginForm = Body(...)):
    if loginuser.username not in users:
        return {"status":"This username doen't exists. Please check the username again."}
    if loginuser.password != users[loginuser.username].password:
        return {"status":"This password is incorrect. Please check the password again."}
    return {"status":"Succesfully logged in."}
        
