CREATE TABLE Users (
id INT(7) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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