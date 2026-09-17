-- Apple Retails Sales Schemas

-- DROP TABLE command
DROP TABLE IF EXISTS warranty;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS category;  -- this is a parent table
DROP TABLE IF EXISTS stores;    -- this is a parent table

-- CREATE TABLE cmmands

CREATE TABLE stores(
store_id varchar(5)PRIMARY KEY,
store_name varchar(30),
city varchar(25),
country varchar(25)
);

DROP TABLE IF EXISTS category;
CREATE TABLE category(
category_id varchar(10)PRIMARY KEY,
category_name varchar(20)
);


CREATE TABLE products(
product_id VARCHAR(10) PRIMARY KEY,
product_name VARCHAR(35),
launch_date DATE,
category_id VARCHAR(10),
price FLOAT,

CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);



CREATE TABLE sales(
sale_id varchar(15) PRIMARY KEY,
sale_date DATE,
store_id VARCHAR(10),   -- this is fk
product_id VARCHAR(10), -- this is fk
category_id VARCHAR(10),
CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores(store_id),
CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);



CREATE TABLE warranty(
claim_id VARCHAR(10)PRIMARY KEY,
claim_date DATE,
sale_id VARCHAR(15),
repair_status VARCHAR(15),
CONSTRAINT fk_orders FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);
ALTER TABLE warranty ALTER COLUMN repair_status  TYPE VARCHAR(50);



--Success Massage
SELECT 'Schema created successfull' as Success_Message;




