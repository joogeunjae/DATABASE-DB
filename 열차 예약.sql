# 기차 예약 데이터베이스 생성
CREATE DATABASE train_reservation; /*CREATE DATABASE 데이터베이스명; 데이터베이스 생성*/
USE train_reservation; /*USE 데이터베이스명;을 사용하겟다*/

# 가격 테이블 생성
CREATE TABLE Cost(
 departure_station INT NOT NULL,
 arrival_station INT NOT NULL,
 amount INT NOT NULL
);
 

# 기차 테이블 생성
CREATE TABLE Train(
	train_number VARCHAR(10) PRIMARY KEY,
    departure_station VARCHAR(50) NOT NULL,
    departure_time TIME NOT NULL,
    drrival_station VARCHAR(50) NOT NULL,
    driival_time TIME NOT NULL,
    take_minute TIME NOT NULL,
    type VARCHAR(10) /* 지금 여기에는 데이터가 없는 상태 */
);

# 기차역 테이블 생성
CREATE TABLE Station(
	station_number INT AUTO_INCREMENT/*자동증가*/ PRIMARY KEY,
    station_name VARCHAR(50) NOT NULL,
    address VARCHAR(500) NOT NULL UNIQUE,
    tel_number VARCHAR(15) NOT NULL UNIQUE
);

# 도착역 테이블 생성
CREATE TABLE STOP_STATION(
	station_number INT NOT NULL,
    train_number VARCHAR(10) NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL
);

CREATE TABLE SEAT(
	seat_code VARCHAR(5) PRIMARY KEY,
	type VARCHAR(10) NOT NULL,
    seat_number VARCHAR(2) NOT NULL,
    train_type VARCHAR(10) NOT NULL 
);

ALTER TABLE Cost
ADD CONSTRAINT cost_primary_key
PRIMARY KEY(departure_station, arrival_station);

ALTER TABLE Cost
ADD CONSTRAINT cost_foreign_key_1
FOREIGN KEY(departure_station)
REFERENCES Station(station_number);

ALTER TABLE Cost
ADD CONSTRAINT cost_foreign_key_2
FOREIGN KEY(arrival_station)
REFERENCES Station(station_number);
#코스트 테이블에 제약조건을 추가를 하겟다 머를? 포링키를
#포링키는 도착역의 번호이고 그 값은 스테이션 테이블에 기차역 번호다


ALTER TABLE STOP_STATION
ADD CONSTRAINT stop_station_primary_key
PRIMARY KEY(station_number, train_number);

ALTER TABLE STOP_STATION
ADD CONSTRAINT stop_station_foreign_key_1
FOREIGN KEY(station_number)
REFERENCES STATION(station_number);

ALTER TABLE STOP_STATION
ADD CONSTRAINT stop_station_foreign_key_2
FOREIGN KEY(train_number)
REFERENCES TRAIN(train_number)