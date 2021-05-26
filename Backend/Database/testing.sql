// before run npm test command use following commands on mysql shell

INSERT INTO `devices` (`device_id`,`device_name`,`email`) 
VALUES ('d0001','kasuni gas2','kasuni@gmail.com'),
('d0002','kasuni gas3','kasuni@gmail.com'),
('d0003','kasuni gas2','kasuni@gmail.com'),
('d0004','kasuni gas3','kasuni@gmail.com'),
('d0005','kasuni gas2','kasuni@gmail.com'),
('d0006','kasuni gas3','kasuni@gmail.com'),
('d0007','kasuni gas2','kasuni@gmail.com'),
('d0008','kasuni gas3','kasuni@gmail.com'),
('d0009','kasuni gas2','kasuni@gmail.com'),
('d0010','kasuni gas2','kasuni@gmail.com'),
('d0011','kasuni gas2','kasuni@gmail.com'),
('d0012','kasuni gas3','kasuni@gmail.com');

UPDATE `devices` set balance_percentage=100 where email='yasiru@gmail.com';
UPDATE `devices` set balance_percentage=95 where email='namal@gmail.com';
UPDATE `devices` set balance_percentage=85 where email='niroshana@gmail.com';
UPDATE `devices` set balance_percentage=75 where email='kasuni@gmail.com';
UPDATE `devices` set balance_percentage=5 where email='ramal@gmail.com';

INSERT INTO `history` (`device_id`,`used_day`,`used_weight`) 
VALUES ('d0001','2021-01-01 ',5),
('d0002','2021-01-01',14),
('d0003','2021-01-01',75),
('d0004','2021-01-01',42),
('d0005','2021-01-01',0),
('d0001','2021-01-02',5),
('d0002','2021-01-02',14),
('d0003','2021-01-02',35),
('d0004','2021-01-02',42),
('d0011','2021-01-01',0),
('d0012','2021-01-02',5),
('d0011','2021-01-02',14),
('d0012','2021-01-01',35),
('d0010','2021-01-02',14),
('d0010','2021-01-01',35),
('d0005','2021-01-02',2);


//  if want to clear the changes with a npm test and test again use following commands on mysql shell

delete from users where email = "yasiru@gmail.com" ;
delete from users where email = "namal@gmail.com" ;
delete from users where email = "niroshana@gmail.com" ;
delete from users where email = "ramal@gmail.com" ;
delete from users where email = "didula@gmail.com" ;
delete from devices where device_id = "d0999";

