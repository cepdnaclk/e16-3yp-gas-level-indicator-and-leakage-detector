CREATE TABLE Users (
id INT PRIMARY KEY,
username VARCHAR(30) NOT NULL,
password VARCHAR(30) NOT NULL,
email VARCHAR(50),
mobile_number INT
);

INSERT INTO `users` (`id`,`username`,`password`,`email`,`mobile_number`) 
VALUES (1,'lalithPerera','lalith','lalith@gmail.com',0775738767),
(2,'hasinduWijerathna','hasindu','hasindu@gmail.com',0775738877),
(3,'upulWikramasingha','upul','upul@gmail.com',0704563217),
(4,'KasuniSilva','kasuni','kasuni@gmail.com',0754563217),
(5,'kaveenDissanayeka','kaveen','kaveen@gmail.com',0727896543);


DELIMITER //
CREATE PROCEDURE addUser(
	id1 INT,
    username1 VARCHAR(30),
    password1 VARCHAR(30),
    email1 VARCHAR(50),
    mobile_number1 INT
)
BEGIN
	INSERT INTO `users` (`id`,`username`,`password`,`email`,`mobile_number`) 
    VALUES (id1,username1,password1,email1,mobile_number1);
END //
DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'myapp';
call addUser(5,'kaveenDissanayeka','kaveen','kaveen@gmail.com',0727896543);

{
    "id":5,
    "username":"kaveenDissanayeka",
    "password":"kaveen",
    "email":"kaveen@gmail.com",
    "mobile_number":0727896543
}
