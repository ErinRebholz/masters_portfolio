#DROP SCHEMA fhir_pharmacy_wip;  #Only used if starting fresh

-- create schemas
CREATE SCHEMA fhir_pharmacy_wip;

-- Select the schema
USE fhir_pharmacy_wip;

-- create tables
CREATE TABLE patient (
	patient_id char(36) PRIMARY KEY NOT NULL UNIQUE, 
	given_name varchar(25), 
	family_name varchar(25), 
	gender varchar(10), 
	birth_date datetime, 
	deceased_date datetime, 
	street_address varchar(64), 
	city varchar(25) ,
	state char(2),
	postal_code varchar(5), 
	country varchar(25), 
	phone varchar(12) 
);

CREATE TABLE encounter (
	encounter_id char(36) PRIMARY KEY NOT NULL UNIQUE,
	patient_id char(36), 
	start_date datetime, 
	end_date datetime, 
	snomed_code int, 
	snomed_text varchar(512), 
	provider_NPI char(10), 
	provider_name varchar(50) ,
	facility_name varchar(128), 
	facility_code varchar(10),
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE med_history (
	rx_id char(36) PRIMARY KEY NOT NULL UNIQUE, 
	resource_status varchar(10), 
	patient_id char(36),
	provider_id char(10), 
	encounter_id char(36), 
	request_date datetime, 
	rxnorm_code char(10),
	rxnorm_text varchar(256), 
	rx_text varchar(256), 
	snomed_code text, 
	snomed_text varchar(128), 
	repeat_freq varchar(12), 
	repeat_period varchar(12),  
	repeat_period_unit varchar(12),  
	as_needed varchar(128),
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (encounter_id) REFERENCES encounter (encounter_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE observation (
	obs_id char(36) PRIMARY KEY NOT NULL UNIQUE, 
	encounter_id char(36), 
	patient_id char(36) NOT NULL,
	effective_date datetime, 
	obs_code text, 
	code_text text, 
	quantity_value text, 
	quantity_unit text, 
	quantity_code text,
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (encounter_id) REFERENCES encounter (encounter_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE allergy (
	allergy_id char(36) PRIMARY KEY NOT NULL UNIQUE,
	patient_id char(36) NOT NULL, 
	recorded_date datetime, 
	allergy_category varchar(15), 
	allergy_details varchar(36), 
	reaction varchar(256), 
	allergy_criticality varchar(15),
	FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE ON UPDATE CASCADE
);



