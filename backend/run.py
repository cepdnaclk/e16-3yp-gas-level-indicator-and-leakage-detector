import uvicorn
from config import PORT,HOST

# start the server in main in 30 thread maxmimum works can work at time
if __name__ == "__main__":
    uvicorn.run("Server:app",host=HOST,port=PORT,reload=True,debug=True,workers=1)