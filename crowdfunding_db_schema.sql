-- Tables were created in the order shown below (First Category, then Subcategory, then Contacts, and finally Campaign). 
-- After all the tables were created, with right click on each table, then "Import/Export Data" option and then browsing the csv file, 
-- we imported the data from each csv file to each table. 
-- Data was imported in the same order shown below as well. 

-- Create table Category
DROP TABLE IF EXISTS CATEGORY CASCADE;
CREATE TABLE CATEGORY (
    CATEGORY_ID VARCHAR(5) NOT NULL,
    CATEGORY VARCHAR(50) NOT NULL,
	PRIMARY KEY(CATEGORY_ID)
);

-- Create table Subcategory
DROP TABLE IF EXISTS SUBCATEGORY CASCADE;
CREATE TABLE SUBCATEGORY (
    SUBCATEGORY_ID VARCHAR(10) NOT NULL,
    SUBCATEGORY VARCHAR(50) NOT NULL,
	PRIMARY KEY(SUBCATEGORY_ID)
);

-- Create table Contacts
DROP TABLE IF EXISTS CONTACTS CASCADE;
CREATE TABLE CONTACTS (
    CONTACT_ID INT NOT NULL,
    FIRST_NAME VARCHAR(50) NOT NULL,
	LAST_NAME VARCHAR(50) NOT NULL,
	EMAIL VARCHAR(150) NOT NULL,
	PRIMARY KEY(CONTACT_ID)
);

-- Create table Campaign
DROP TABLE IF EXISTS CAMPAIGN CASCADE;
CREATE TABLE CAMPAIGN (
    CF_ID INT NOT NULL,
    CONTACT_ID INT NOT NULL,
	COMPANY_NAME VARCHAR(200) NOT NULL,
	DESCRIPTION VARCHAR(200) NOT NULL,
	GOAL DOUBLE PRECISION NOT NULL,
	PLEDGED DOUBLE PRECISION NOT NULL,
	OUTCOME VARCHAR(15) NOT NULL,
	BACKERS_COUNT INT NOT NULL,
	COUNTRY VARCHAR(5) NOT NULL,
	CURRENCY VARCHAR(3) NOT NULL,
	LAUNCH_DATE VARCHAR NOT NULL,
	END_DATE VARCHAR NOT NULL,
	CATEGORY_ID VARCHAR(5) NOT NULL,
	SUBCATEGORY_ID VARCHAR(10) NOT NULL,
	FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID),
	FOREIGN KEY (SUBCATEGORY_ID) REFERENCES SUBCATEGORY(SUBCATEGORY_ID),
	FOREIGN KEY (CONTACT_ID) REFERENCES CONTACTS(CONTACT_ID),
	PRIMARY KEY(CF_ID)
);

-- WE CREATED THE TABLE CAMPAIGN FIRST WITH VARCHARS FOR COLUMNS LAUNCH_DATE AND END_DATE, THEN IMPORTED THE CSV FILE 
-- AND FINALLY CHANGED THE DATATYPE AS SHOWN BELOW
ALTER TABLE CAMPAIGN ALTER COLUMN LAUNCH_DATE TYPE DATE 
USING to_date(LAUNCH_DATE, 'YYYY-MM-DD');

ALTER TABLE CAMPAIGN ALTER COLUMN END_DATE TYPE DATE 
USING to_date(END_DATE, 'YYYY-MM-DD');

-- QUERYS TO VALIDATE THAT ALL TABLES WERE CREATED PROPERLY
SELECT * FROM CAMPAIGN;
SELECT * FROM CATEGORY;
SELECT * FROM SUBCATEGORY;
SELECT * FROM CONTACTS;
