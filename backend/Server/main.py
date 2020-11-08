from Server import app
from typing import Optional,List
from pydantic import BaseModel, EmailStr, Field
from fastapi import Depends, FastAPI,status,Body,Response
from passlib.context import CryptContext

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

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)

def get_password_hash(password):
    return pwd_context.hash(password)

# to store users
users=dict()

@app.get("/")
def read_root():
    return {"Hello": "Customer"}

@app.post("/signup")
async def signup(response: Response,signupuser: SignUpForm = Body(...)):
    if signupuser.username in users:
        return {"status":"This username already exists. Please try with an another username."}
    signupuser.password = get_password_hash(signupuser.password)
    users[signupuser.username]=signupuser
    return {"status":"Succesfully signed up."}   

@app.post("/login")
async def login(response: Response,loginuser: LoginForm = Body(...)):
    if loginuser.username not in users:
        return {"status":"This username doen't exists. Please check the username again."}
    if not verify_password(loginuser.password,users[loginuser.username].password):
        return {"status":"This password is incorrect. Please check the password again."}
    return {"status":"Succesfully logged in."}
        
