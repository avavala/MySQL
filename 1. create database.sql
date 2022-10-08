CREATE DATABASE IF NOT EXISTS sales;-- using CREATE SCHEMA would have been the same

 USE sales;-- specifing to use the sales database
 
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    
    PRIMARY KEY (customer_id)
);

CREATE TABLE sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    purchase_date DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    
    PRIMARY KEY (purchase_number)
);
ALTER TABLE sales
	ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
    
CREATE TABLE companies (
    company_id VARCHAR(255) DEFAULT 'X',
    company_name VARCHAR(255),
    headquarters_phone_number VARCHAR(255),
    
    PRIMARY KEY (company_id),
    UNIQUE KEY (headquarters_phone_number)
);
    
CREATE TABLE items (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255) DEFAULT 'X',
    
    PRIMARY KEY (item_code),
    FOREIGN KEY (company_id)
        REFERENCES companies (company_id)
);

ALTER TABLE customers
	ADD COLUMN gender ENUM('M', 'F') AFTER last_name; -- ADD GENEDER COLUMN WITH ENUM DATA TYPE
    
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
	VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);
    
ALTER TABLE customers
	CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;	-- SET 0 AS A DEFAULT INT VALUE
    
INSERT INTO customers (first_name, last_name, gender)
	VALUES ('Luis', 'Figaro', 'M');


