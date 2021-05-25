#### This contains source code for the Backend in this gas level indicator and leakage detector. To execute this you can check following requirements and follow the steps mentioned below.

## Requirements

#### 1) mysql  
```
      $ sudo apt update
      $ sudo apt install mysql-server   
      $ sudo mysql_secure_installation      
      $ sudo mysql
```
#### 2) node js 
```
      $ sudo apt install nodejs
      $ sudo apt install npm
```      
      
Note: these commands are effective in ubuntu operating system.

## Steps 

#### 01.) open mysql terminal and find the current username and password  
 (you might use these commands to check current user and change the password **only it is required**)
```
    mysql> SELECT CURRENT_USER();
    mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
    mysql> FLUSH PRIVILEGES;
```

#### 02.) create database using commands on "./Database/all_databse.sql"

#### 03.) open bash terminal (or git bash) and type following commands.
```
    $ git clone https://github.com/cepdnaclk/e16-3yp-gas-level-indicator-and-leakage-detector
    $ cd e16-3yp-gas-level-indicator-and-leakage-detector
    $ cd Backend
    $ npm install
```   

#### 04.) open connection.js file and configure user, password inside mysqlConnection function

#### 05.) Type following command on bash terminal (or git bash) to run Main Server
``` 
        $ forever start app.js
                    or 
        $ npm run devStart
                    or 
        $ node app  
        
```   
#### 06.) Open a another bash terminal (or git bash) and type following command to run a Authentication Server
``` 
        $ forever start authServer.js
                    or 
        $ node authServer 
                    or 
        $ npm run devStartAuth
        
```   
