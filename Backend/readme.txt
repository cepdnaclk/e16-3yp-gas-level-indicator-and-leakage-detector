Requirements

1) mysql 
    $ sudo apt update
    $ sudo apt install mysql-server
    $ sudo mysql_secure_installation
    $ sudo mysql
2) node js 
    $ sudo apt install nodejs
    $ sudo apt install npm
*above commands are only in ubuntu


steps 

01.) open mysql terminal and find the current username and password
you might use these commands
    mysql> SELECT CURRENT_USER();
    mysql> mysql -u root -p

02.) create database using commands on "./Database/all_databse.sql"

03.) open bash terminal (or git bash) and type following commands
    $ git clone https://github.com/sudamkalpage/gas-app
    $ cd gas-app
    $ npm install

04.) open connection.js file and configure user, password inside mysqlConnection function

05.) open bash terminal (or git bash) again and type following command to run
        $ forever start app.js
        $ forever start authServer.js

                    or 

    open bash terminal (or git bash) again and type following command to run
        $ npm run devStart       or     $ node app      

    *if this leads to errors please open a another bash terminal and type following command
        $ node authServer      or     $ npm run devStartAuth

