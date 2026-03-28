
/*
DROP TABLE Storekeeper;
DROP TYPE Storekeeper_Name;
DROP TYPE Storekeeper_Address;
*/

CREATE TYPE Storekeeper_Name AS
(
  first_name CHARACTER VARYING(100),
  last_name CHARACTER VARYING(100)
);
CREATE TYPE Storekeeper_Address AS
(
  city CHARACTER VARYING(100),
  street CHARACTER VARYING(100),
  alley CHARACTER VARYING(100)
);
CREATE TABLE Storekeeper
(
    code INTEGER NOT NULL,
    name Storekeeper_Name,
    phone CHARACTER VARYING(100) ARRAY,
    address Storekeeper_Address,
    PRIMARY KEY (code)
);

----------------------------------------------------

/*
DROP TABLE Customer;
DROP TYPE Customer_Name;
DROP TYPE Customer_Address;
*/

CREATE TYPE Customer_Name AS
(
  first_name CHARACTER VARYING(100),
  last_name CHARACTER VARYING(100)
);
CREATE TYPE Customer_Address AS
(
  city CHARACTER VARYING(100),
  street CHARACTER VARYING(100),
  alley CHARACTER VARYING(100)
);
CREATE TABLE Customer
(
    code INTEGER NOT NULL,
    name Customer_Name,
    phone CHARACTER VARYING(100) ARRAY,
    address Customer_Address,
    gender CHARACTER VARYING(3),
    age INTEGER,
    PRIMARY KEY (code)
);

----------------------------------------------------

/*
DROP TABLE Factory;
DROP TYPE Factory_Address;
*/

CREATE TYPE Factory_Address AS
(
  city CHARACTER VARYING(100),
  street CHARACTER VARYING(100),
  alley CHARACTER VARYING(100)
);
CREATE TABLE Factory
(
    code INTEGER NOT NULL,
    phone CHARACTER VARYING(100) ARRAY,
    address Factory_Address,
    PRIMARY KEY (code)
);

----------------------------------------------------

/*
DROP TABLE Warehouse;
DROP TYPE Warehouse_Address;
*/

CREATE TYPE Warehouse_Address AS
(
  city CHARACTER VARYING(100),
  street CHARACTER VARYING(100),
  alley CHARACTER VARYING(100)
);
CREATE TABLE Warehouse
(
    code INTEGER NOT NULL,
    storekeeper_code INTEGER NOT NULL,
    phone CHARACTER VARYING(100) ARRAY,
    address Warehouse_Address,
    capacity INTEGER,
    PRIMARY KEY (code),
    FOREIGN KEY (storekeeper_code) REFERENCES Storekeeper (code) ON DELETE CASCADE ON UPDATE CASCADE
);

----------------------------------------------------

/*
DROP TABLE Responsible;
DROP TYPE Responsible_Name;
DROP TYPE Responsible_Address;
*/

CREATE TYPE Responsible_Name AS
(
  first_name CHARACTER VARYING(100),
  last_name CHARACTER VARYING(100)
);
CREATE TYPE Responsible_Address AS
(
  city CHARACTER VARYING(100),
  street CHARACTER VARYING(100),
  alley CHARACTER VARYING(100)
);
CREATE TABLE Responsible
(
    code INTEGER NOT NULL,
    name Responsible_Name,
    phone CHARACTER VARYING(100) ARRAY,
    address Responsible_Address,
    PRIMARY KEY (code)
);

----------------------------------------------------

/*
DROP TABLE Goods;
DROP TABLE Mobile;
DROP TABLE Tablet;
DROP TABLE Laptop;
*/

CREATE TABLE Goods
(
    code INTEGER NOT NULL,
    warehouse_code INTEGER NOT NULL,
    price INTEGER,
    brand CHARACTER VARYING(100),
    model CHARACTER VARYING(100),
    color CHARACTER VARYING(100) ARRAY,
    operating_system CHARACTER VARYING(100),
    ram CHARACTER VARYING(100),
    screen_size CHARACTER VARYING(100),
    PRIMARY KEY (code),
    FOREIGN KEY (warehouse_code) REFERENCES Warehouse (code) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Mobile
(
    sim_card_number INTEGER,
    replacing_battery CHARACTER VARYING(10)
)INHERITS (Goods);

CREATE TABLE Tablet
(
    sim_card_support CHARACTER VARYING(10),
    conversational_capability CHARACTER VARYING(10)
)INHERITS (Goods);

CREATE TABLE Laptop
(
    opaque_screen CHARACTER VARYING(10),
    touch_screen CHARACTER VARYING(10)
)INHERITS (Goods);

----------------------------------------------------

/*
DROP TABLE Sale;
*/

CREATE TABLE Sale
(
    responsible_code INTEGER NOT NULL,
    customer_code INTEGER NOT NULL,
    goods_code INTEGER NOT NULL,
    date date,
    number INTEGER,
    price INTEGER,
    PRIMARY KEY (responsible_code, customer_code, goods_code),
    FOREIGN KEY (responsible_code) REFERENCES Responsible (code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (customer_code) REFERENCES Customer (code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (goods_code) REFERENCES Goods (code) ON DELETE CASCADE ON UPDATE CASCADE
);

----------------------------------------------------

/*
DROP TABLE Buy;
*/

CREATE TABLE Buy
(
    responsible_code INTEGER NOT NULL,
    factory_code INTEGER NOT NULL,
    goods_code INTEGER NOT NULL,
    date DATE,
    number INTEGER,
    price INTEGER,
    PRIMARY KEY (responsible_code, factory_code, goods_code),
    FOREIGN KEY (responsible_code) REFERENCES Responsible (code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (factory_code) REFERENCES Factory (code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (goods_code) REFERENCES Goods (code) ON DELETE CASCADE ON UPDATE CASCADE
);
