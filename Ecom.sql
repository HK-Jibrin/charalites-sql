DROP DATABASE IF EXISTS charalites;
CREATE DATABASE charalites;
use charalites; 

CREATE TABLE products(
  product_id int(11) NOT NULL AUTO_INCREMENT,
  produt_name varchar(50) NOT NULL,
  quantity_in_stock int(11) NOT NULL,
  price decimal(10,2) NOT NULL,
  descriptions VARCHAR(300) NOT NULL,
  PRIMARY KEY (product_id)
);
 
CREATE TABLE suppliers(
supplier_id int(11) NOT NULL AUTO_INCREMENT,
companey_name VARCHAR(20) NOT NULL,
address VARCHAR(200) NOT NULL,
city   VARCHAR (50) NOT NULL,
region VARCHAR (30) NOT NULL,
country VARCHAR(30) NOT NULL,
phone_no VARCHAR(15)NOT NULL,
product_id_fk INT(11) NOT NULL,
PRIMARY KEY (supplier_id),
FOREIGN KEY (product_id_fk) REFERENCES  products(product_id)
);

CREATE 	TABLE customers(
customer_id INT(11) AUTO_INCREMENT NOT NULL,
first_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address  VARCHAR(100) NOT NULL,
email_address VARCHAR(100) NOT NULL,
city VARCHAR(30)NOT NULL,
phone_No VARCHAR(15) NOT NULL,
country VARCHAR(20) NOT NULL,
credit_type VARCHAR(20) NOT NULL,
PRIMARY KEY (customer_id),
order_id_fk INT(11) NOT NULL,
FOREIGN KEY (order_id_fk) REFERENCES orders(order_id)
);

CREATE TABLE orders(
order_id INT(11) AUTO_INCREMENT NOT NULL,
order_name VARCHAR(50) NOT NULL,
order_date   DATE   NOT NULL,
transaction_status VARCHAR(20),
payment_date DATE  NOT NULL,
shipper_date DATE NOT NULL,
PRIMARY KEY (order_id),
shipper_id_fk INT(11) NOT NULL,
payment_id_fk INT(11) NOT NULL,
FOREIGN KEY (payment_id_fk) REFERENCES payment(payment_id),
FOREIGN KEY (shipper_id_fk) REFERENCES shippers(shipper_id)
);

CREATE TABLE payment(
payment_id INT(11) AUTO_INCREMENT NOT NULL,
payment_type VARCHAR(10) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
PRIMARY KEY (payment_id)

);

CREATE TABLE category(
category_id INT(11) AUTO_INCREMENT NOT NULL,
category_name VARCHAR(50) NOT NULL,
category_details VARCHAR(200) NOT NULL,
product_id_fk INT(11) NOT NULL,
PRIMARY KEY (category_id),
FOREIGN KEY (product_id_fk) REFERENCES products(product_id)
);


CREATE TABLE order_details(
order_detail_id 	INT(11) AUTO_INCREMENT NOT NULL,
order_name VARCHAR(20) NOT NULL,
price    DECIMAL(10, 2) NOT NULL,
quantity INT(10) NOT NULL,
PRIMARY KEY (order_detail_id),
order_id_fk INT(11) NOT NULL,
product_id_fk INT(11) NOT NULL,
FOREIGN KEY (order_id_fk) REFERENCES orders(order_id),
FOREIGN KEY (product_id_fk) REFERENCES products(product_id)  
);


CREATE TABLE shippers(
shipper_id INT(11) AUTO_INCREMENT NOT NULL,
shipper_name VARCHAR(20) NOT NULL,
phone_no   VARCHAR(15) NOT NULL,
PRIMARY KEY (shipper_id)
);