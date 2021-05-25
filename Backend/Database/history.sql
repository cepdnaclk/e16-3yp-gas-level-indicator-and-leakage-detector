CREATE TABLE history (
device_id VARCHAR(30),
used_day date,
used_weight INT,
PRIMARY KEY (device_id, used_day)
);

drop table history;
truncate table history;


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
('d0005','2021-01-02',2);

INSERT INTO `history` (`device_id`,`used_day`,`used_weight`) 
VALUES ('d0010','2021-01-01 ',8),
('d0011','2021-01-01',14),
('d0012','2021-01-01',55),
('d0010','2021-01-02',5),
('d0011','2021-01-02',4),
('d0012','2021-01-02',36);



{
    "device_id":"d0001",
    "used_day":"2021-01-03",
    "used_weight":5
}

