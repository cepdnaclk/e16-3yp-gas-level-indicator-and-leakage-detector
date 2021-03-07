CREATE TABLE Devices (
device_id VARCHAR(30) PRIMARY KEY,
device_name VARCHAR(30) NOT NULL,
email VARCHAR(50) NOT NULL,
balance_weight INT,
balance_percentage INT,
leakage boolean default false,
brand VARCHAR(30),
size INT
);

INSERT INTO `devices` (`device_id`,`device_name`,`email`) 
VALUES ('d0001','lalith gas','lalith@gmail.com'),
('d0002','hasindu gas','hasindu@gmail.com'),
('d0003','upul gas','upul@gmail.com'),
('d0004','kasuni gas','kasuni@gmail.com'),
('d0005','kaveen gas','kaveen@gmail.com');


INSERT INTO `devices` (`device_id`,`device_name`,`email`,`balance_percentage`) 
VALUES ('d0010','kasuni gas 2','kasuni@gmail.com',12),
('d0011','kasuni gas 3','kasuni@gmail.com',65),
('d0012','kasuni gas 4','kasuni@gmail.com',80);

