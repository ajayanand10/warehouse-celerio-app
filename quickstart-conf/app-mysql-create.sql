---
-- Example Schema using MySQL database
--

DROP TABLE IF EXISTS USE_CASE_3, USE_CASE_2, USE_CASE_1, PROJECT, BOOK, AUTHOR, USER_ROLE, ROLE, PASSPORT, USER;

CREATE TABLE WAREHOUSE (
    id     					int not null AUTO_INCREMENT,
	name                    varchar(100) not null COMMENT 'The name of the warehouse',
	rating                  DOUBLE(5),
	type                    varchar(10),
	description             varchar(255),
	address                 varchar(255),
	phone1                  char(10) default '+33',
	phone2                  char(10),
	fulfilment_type         varchar(100),
	storage_price			DOUBLE(10),
	min_hire_period			DATE,	
	deposit                 DOUBLE(10),
	facility_size           INTEGER(20),
	facility_size_uom       INTEGER(20),
	storage_size            INTEGER(20),
	storage_size_uom        INTEGER(20),
	operating_days          VARCHAR(255),
	operating_hours         VARCHAR(255),
	no_of_receiving_doors   INTEGER(10),
	no_of_shipping_doors    INTEGER(10),
	wms_vendor              VARCHAR(255),
	racking                 VARCHAR(50),
	max_storage_height      DOUBLE(20),
	max_storage_height_uom  DOUBLE(20),
	max_storage_weight      DOUBLE(20),
	max_storage_weight_uom  DOUBLE(20),
	handling_equipment      VARCHAR(255),
	temperature_range       VARCHAR(255),
	structure_type          VARCHAR(255),
	year_of_construction    INTEGER(4),
	fleet_access            VARCHAR(50),
	power_sanctioned        VARCHAR(50),
	water_connection        VARCHAR(50),
	power_backup            VARCHAR(50),
	crane_services          VARCHAR(50),
	fire_systems            VARCHAR(50),
	security                VARCHAR(50),
	lift                    VARCHAR(50),
	toilet                  VARCHAR(50),
	parking                 VARCHAR(50),
	distance_from_main_road DOUBLE(20),
	yard                    DOUBLE(20),
	facility_certification  VARCHAR(255),
	faciltiy_insurance      VARCHAR(255),
	import_export           DOUBLE(10),
	inbound_services        VARCHAR(255),
	outbound_services       VARCHAR(255),
	value_added_services    VARCHAR(255),
	labor_services          DOUBLE(50),
	total_labor             DOUBLE(50),
	distribution_services   VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	primary key (id)
) COMMENT='The Warehouse is a human that can connect to this web application';

CREATE TABLE GOODS (
	type_of_goods_id	INT not null AUTO_INCREMENT,
	name				VARCHAR(255),
	description			VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
    
    primary key (type_of_goods_id)
) COMMENT='The Goods is a human that can connect to this web application';

CREATE TABLE Warehouse_Goods (
    warehouse_id		INTEGER(10),
	type_of_goods_id	INTEGER(10),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    foreign key (warehouse_id) references WAREHOUSE(id),
    foreign key (type_of_goods_id) references GOODS(type_of_goods_id),
    primary key (warehouse_id,type_of_goods_id)
) COMMENT='The Warehouse_Goods is a human that can connect to this web application';


CREATE TABLE Warehouse_Service_Provider (
    warehouse_id	INTEGER(10),
	user_id			INTEGER(10),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    foreign key (warehouse_id) references WAREHOUSE(id),
    foreign key (user_id) references USER(user_id),
    primary key (warehouse_id,user_id)
) COMMENT='The Warehouse_Service_Provider is a human that can connect to this web application';

CREATE TABLE Warehouse_Photo (
    id	INTEGER(10) not null AUTO_INCREMENT,
	warehouse_id		INTEGER(10) not null,
	name				VARCHAR(255),
	description			VARCHAR(255),
	link				VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    foreign key (warehouse_id) references WAREHOUSE(id),
    primary key (id)
) COMMENT='The Warehouse_Photo is a human that can connect to this web application';

CREATE TABLE Warehouse_Review (
	id						INTEGER(10) not null AUTO_INCREMENT,
	user_id					INTEGER(10) not null,
	overall_rating			DOUBLE(10),
	turnaround_time			DOUBLE(10),
	responsiveness			VARCHAR(255),
	comments				VARCHAR(255),


-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    foreign key (user_id) references USER(id),
    primary key (id)
) COMMENT='The Warehouse_Review is a human that can connect to this web application';

CREATE TABLE USER (
    id                       int not null AUTO_INCREMENT,
	login                    varchar(100) not null COMMENT 'The login used to login',
	password                 varchar(100) not null,
	phone 					 CHAR(10),
    email                    varchar(100),
    is_enabled               bool not null default true,
    civility                 char(2) default 'MR',
    country_code             varchar(6) default '+91',
    first_name               varchar(100),
    last_name                varchar(100),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    constraint user_unique_1 unique (login),
    primary key (id)
) COMMENT='The User is a human that can connect to this web application';

CREATE TABLE GUEST (
    id                       int not null AUTO_INCREMENT,

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    primary key (id)
) COMMENT='The GUEST is a human that can connect to this web application';


CREATE TABLE BOOKMARK (
    id                       int not null AUTO_INCREMENT,
	user_id					 INTEGER(10),
	warehouse_id			 INTEGER(10),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	foreign key (user_id) references USER(id),
	foreign key (warehouse_id) references WAREHOUSE(id),
    primary key (id)
) COMMENT='The BOOKMARK is a human that can connect to this web application';


CREATE TABLE ENQUIRY (
    id                       int not null AUTO_INCREMENT,
	user_id					 INTEGER(10),
	warehouse_id			 INTEGER(10),
	description				 VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	foreign key (user_id) references USER(id),
	foreign key (warehouse_id) references WAREHOUSE(id),
    primary key (id)
) COMMENT='The ENQUIRY is a human that can connect to this web application';
	

CREATE TABLE RATE (
    id                       int not null AUTO_INCREMENT,
	warehouse_id			 INTEGER(10),
	description				 VARCHAR(255),
	storage					 VARCHAR(255),	
	labor					 INTEGER(10),	
	loading					 VARCHAR(255),	
	unloading				 VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	foreign key (warehouse_id) references WAREHOUSE(id),
    primary key (id)
) COMMENT='The RATE is a human that can connect to this web application';


CREATE TABLE PASSPORT (
    id                       int not null AUTO_INCREMENT,
    passport_number          varchar(100) not null,
    expiration_date          date,
    holder_id                int not null,
    foreign key (holder_id) references USER(id),
    constraint passport_holder_unique_1 unique (holder_id),
    primary key (id)
) COMMENT='Use case for one-to-one relation';

CREATE TABLE ROLE (
    id              int not null AUTO_INCREMENT,
    role_name       varchar(100) not null,
    constraint role_unique_1 unique (role_name),
    primary key (id)
);

CREATE TABLE USER_ROLE (
    user_id     int not null,
    role_id     int not null,

    foreign key (user_id) references USER(id),
    foreign key (role_id) references ROLE(id),
    primary key (user_id, role_id)
);


CREATE TABLE ORDER (
    id                      int not null AUTO_INCREMENT,
    order_date 				date,
	
	-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),
	
	-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
    primary key (id)
);


INSERT INTO USER (id, login, password, email, is_enabled, version) VALUES (-1, 'admin', 'admin', 'admin@example.com', true, 1);

INSERT INTO ROLE (id, role_name) VALUES (-1, 'ROLE_ADMIN');
INSERT INTO ROLE (id, role_name) VALUES (-2, 'ROLE_USER');
INSERT INTO ROLE (id, role_name) VALUES (-3, 'ROLE_MONITORING');

INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -1);
INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -2);
INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -3);
