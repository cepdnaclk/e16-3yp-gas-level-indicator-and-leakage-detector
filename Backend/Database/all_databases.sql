/* Databases */

create database myapp;
use myapp;

CREATE TABLE users (
email VARCHAR(50) PRIMARY KEY,
password VARCHAR(70) NOT NULL,
mobile_number VARCHAR(10)
);

CREATE TABLE devices (
device_id VARCHAR(30) PRIMARY KEY,
device_name VARCHAR(30) NOT NULL,
email VARCHAR(50) NOT NULL,
balance_weight INT,
balance_percentage INT,
leakage boolean default false,
brand VARCHAR(30),
size INT
);

CREATE TABLE history (
device_id VARCHAR(30),
used_day date,
used_weight INT,
PRIMARY KEY (device_id, used_day)
);

CREATE TABLE tokens (
token_id VARCHAR(30) PRIMARY KEY,
token VARCHAR(260)
);