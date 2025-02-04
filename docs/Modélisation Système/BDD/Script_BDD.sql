CREATE TABLE user_box(
   id_user_box INT AUTO_INCREMENT,
   email VARCHAR(50)  NOT NULL,
   password VARCHAR(100)  NOT NULL,
   admin BOOLEAN,
   level INT,
   PRIMARY KEY(id_user_box),
   UNIQUE(email)
);

CREATE TABLE warehouse(
   id_warehouse INT AUTO_INCREMENT,
   name VARCHAR(50) ,
   address VARCHAR(50) ,
   PRIMARY KEY(id_warehouse),
   UNIQUE(name)
);

CREATE TABLE box(
   id_box INT AUTO_INCREMENT,
   num INT,
   size INT,
   available BOOLEAN NOT NULL,
   current_code VARCHAR(6)  NOT NULL,
   generated_code VARCHAR(6)  NOT NULL,
   id_warehouse INT NOT NULL,
   PRIMARY KEY(id_box),
   FOREIGN KEY(id_warehouse) REFERENCES warehouse(id_warehouse)
);

CREATE TABLE access_log(
   access_date DATETIME,
   locked BOOLEAN NOT NULL,
   id_box INT NOT NULL,
   PRIMARY KEY(access_date),
   FOREIGN KEY(id_box) REFERENCES box(id_box)
);

CREATE TABLE alarm_log(
   alarm_date DATETIME,
   info VARCHAR(150) ,
   id_box INT NOT NULL,
   PRIMARY KEY(alarm_date),
   FOREIGN KEY(id_box) REFERENCES box(id_box)
);

CREATE TABLE code_log(
   code_date DATETIME,
   code VARCHAR(6) ,
   id_box INT NOT NULL,
   PRIMARY KEY(code_date),
   FOREIGN KEY(id_box) REFERENCES box(id_box)
);

CREATE TABLE rent(
   id_user_box INT,
   id_box INT,
   rent_number INT AUTO_INCREMENT,
   start_reservation_date DATETIME NOT NULL,
   end_reservation_date DATETIME NOT NULL,
   PRIMARY KEY(id_user_box, id_box),
   UNIQUE(rent_number),
   FOREIGN KEY(id_user_box) REFERENCES user_box(id_user_box),
   FOREIGN KEY(id_box) REFERENCES box(id_box)
);
