---
-- Example Schema using MySQL database
--

DROP TABLE IF EXISTS WAREHOUSE, GOODS, WAREHOUSE_GOODS, WAREHOUSE_SERVICE_PROVIDER, WAREHOUSE_PHOTO, WAREHOUSE_REVIEW, GUEST, USER_ROLE, ROLE, BOOKMARK, ENQUIRY, RATE, "order", "user" ;

CREATE TABLE WAREHOUSE (
    id     					SERIAL,
	name                    varchar(100) not null,
	rating                  NUMERIC,
	"type"                  varchar(10),
	description             varchar(255),
	address                 varchar(255),
	phone1                  char(10),
	phone2                  char(10),
	fulfilment_type         varchar(100),
	storage_price			NUMERIC,
	min_hire_period			DATE,	
	deposit                 NUMERIC,
	facility_size           INTEGER,
	facility_size_uom       INTEGER,
	storage_size            INTEGER,
	storage_size_uom        INTEGER,
	operating_days          VARCHAR(255),
	operating_hours         VARCHAR(255),
	no_of_receiving_doors   INTEGER,
	no_of_shipping_doors    INTEGER,
	wms_vendor              VARCHAR(255),
	racking                 VARCHAR(50),
	max_storage_height      NUMERIC,
	max_storage_height_uom  NUMERIC,
	max_storage_weight      NUMERIC,
	max_storage_weight_uom  NUMERIC,
	handling_equipment      VARCHAR(255),
	temperature_range       VARCHAR(255),
	structure_type          VARCHAR(255),
	year_of_construction    INTEGER,
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
	distance_from_main_road NUMERIC,
	yard                    NUMERIC,
	facility_certification  VARCHAR(255),
	faciltiy_insurance      VARCHAR(255),
	import_export           NUMERIC,
	inbound_services        VARCHAR(255),
	outbound_services       VARCHAR(255),
	value_added_services    VARCHAR(255),
	labor_services          NUMERIC,
	total_labor             NUMERIC,
	distribution_services   VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	primary key (id)
);

CREATE TABLE "user" (
    id                       SERIAL,
	login                    varchar(100) not null,
	password                 varchar(100) not null,
	phone 					 CHAR(10),
    email                    varchar(100),
    is_enabled               bool not null default true,
    civility                 char(2) default 'MR',
    country_code             varchar(6),
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
);

CREATE TABLE GOODS (
	type_of_goods_id	SERIAL,
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
);

CREATE TABLE Warehouse_Goods (
    warehouse_id		INTEGER,
	type_of_goods_id	INTEGER,

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    constraint Warehouse_Goods_warehouse_id_fk foreign key (warehouse_id) references WAREHOUSE(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	constraint Warehouse_Goods_type_of_goods_id_fk foreign key (type_of_goods_id) references GOODS(type_of_goods_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
 
    primary key (warehouse_id,type_of_goods_id)
);


CREATE TABLE Warehouse_Service_Provider (
    warehouse_id	INTEGER,
	user_id			INTEGER,

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    constraint Warehouse_Service_Provider_warehouse_id_fk foreign key (warehouse_id) references WAREHOUSE(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	constraint Warehouse_Service_Provider_user_id_fk foreign key (user_id) references "user"(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,  
    
    primary key (warehouse_id,user_id)
);

CREATE TABLE Warehouse_Photo (
    id					SERIAL,
	warehouse_id		INTEGER not null,
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

    constraint ENQUIRY_warehouse_id_fk foreign key (warehouse_id) references WAREHOUSE(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	  
    primary key (id)
);

CREATE TABLE Warehouse_Review (
	id						SERIAL,
	user_id					INTEGER not null,
	overall_rating			NUMERIC,
	turnaround_time			NUMERIC,
	responsiveness			VARCHAR(255),
	comments				VARCHAR(255),


-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    constraint Warehouse_Review_user_id_fk foreign key (user_id) references "user"(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	  
    primary key (id)
);



CREATE TABLE GUEST (
    id                       SERIAL,

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,

    primary key (id)
);


CREATE TABLE BOOKMARK (
    id                       SERIAL,
	user_id					 INTEGER,
	warehouse_id			 INTEGER,

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	constraint BOOKMARK_user_id_fk foreign key (user_id) references "user"(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	constraint BOOKMARK_warehouse_id_fk foreign key (warehouse_id) references WAREHOUSE(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
    primary key (id)
);


CREATE TABLE ENQUIRY (
    id                       SERIAL,
	user_id					 INTEGER,
	warehouse_id			 INTEGER,
	description				 VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	constraint ENQUIRY_user_id_fk foreign key (user_id) references "user"(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	constraint ENQUIRY_warehouse_id_fk foreign key (warehouse_id) references WAREHOUSE(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
    primary key (id)
);
	

CREATE TABLE RATE (
    id                       SERIAL,
	warehouse_id			 INTEGER,
	description				 VARCHAR(255),
	storage					 VARCHAR(255),	
	labor					 INTEGER,	
	loading					 VARCHAR(255),	
	unloading				 VARCHAR(255),

-- audit (detected by celerio by convention)
    creation_date            timestamp default current_timestamp,
    creation_author          varchar(200),
    last_modification_date   timestamp default current_timestamp,
    last_modification_author varchar(200),

-- optimistic lock (detected by celerio by convention)
    version                  int default 0,
	
	constraint RATE_warehouse_id_fk foreign key (warehouse_id) references WAREHOUSE(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
    primary key (id)
);


CREATE TABLE ROLE (
    id              SERIAL,
    role_name       varchar(100) not null,
    constraint role_unique_1 unique (role_name),
    primary key (id)
);

CREATE TABLE USER_ROLE (
    user_id     int not null,
    role_id     int not null,

    constraint USER_ROLE_user_id_fk foreign key (user_id) references "user"(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	constraint USER_ROLE_role_id_fk foreign key (role_id) references ROLE(id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
    primary key (user_id, role_id)
);


CREATE TABLE "order" (
    id                      SERIAL,
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


INSERT INTO "user" (id, login, password, email, is_enabled, version) VALUES (-1, 'admin', 'admin', 'admin@example.com', true, 1);

INSERT INTO ROLE (id, role_name) VALUES (-1, 'ROLE_ADMIN');
INSERT INTO ROLE (id, role_name) VALUES (-2, 'ROLE_USER');
INSERT INTO ROLE (id, role_name) VALUES (-3, 'ROLE_MONITORING');

INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -1);
INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -2);
INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -3);
