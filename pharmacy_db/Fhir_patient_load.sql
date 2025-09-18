-- load data for a patient

use fhir_pharmacy_wip;

-- patient data

INSERT INTO patient(patient_id, given_name, family_name, gender, birth_date, deceased_date,
street_address,city,state,postal_code, country, phone) 
VALUES("9e84e569-7adc-ff42-ccdb-9fe9c23842a6" ,"Hilll811" ,"Armando772" ,"male" ,
"1945-11-04" ,"1000-01-01" ,"397 Rodriguez Promenade Suite 93" ,"Lynn" ,"MA" ,"01902" ,"US" ,"555-296-4764");

-- encounter data

INSERT INTO encounter(encounter_id,patient_id, start_date, end_date, snomed_code, 
snomed_text, provider_NPI, provider_name,facility_name, facility_code) 
VALUES ("f42b5a45-0e30-c707-4618-14ba9e107390" ,"9e84e569-7adc-ff42-ccdb-9fe9c23842a6" ,"1963-12-29" ,"1963-12-29" ,"162673000" ,
"General examination of patient (procedure)" ,"9999954489" ,"Dr. Marian936 Wiza601" ,"PCP112182" ,"AMB");

-- med history data

INSERT INTO med_history(rx_id, resource_status,patient_id, provider_id, encounter_id, request_date, rxnorm_code, 
rxnorm_text, rx_text, snomed_code, snomed_text,repeat_freq,repeat_period,repeat_period_unit, as_needed) 
VALUES ("0bdf98f7-a0aa-d264-be31-5bbc87ec946d" ,"stopped" ,"9e84e569-7adc-ff42-ccdb-9fe9c23842a6" ,"9999954489" ,
"f42b5a45-0e30-c707-4618-14ba9e107390" ,"1963-12-29" ,"310798" ,"Hydrochlorothiazide 25 MG Oral Tablet" ,
"" ,"" ,"" ,"1" ,"1.0" ,"d" ,"False");
    
-- observation data (requires related encounter and patient, due to foreign key)
INSERT INTO encounter(encounter_id,patient_id, start_date, end_date, snomed_code, snomed_text, provider_NPI, 
provider_name,facility_name, facility_code) VALUES ("1aebaaae-f3a0-0b9e-936c-9d6202941131" ,
"9e84e569-7adc-ff42-ccdb-9fe9c23842a6" ,"2012-01-22" ,"2012-01-22" ,"185349003" ,"Encounter for check up (procedure)" ,"9999999729" ,"Dr. Damaris45 Borer986" ,"HALLMARK HEALTH SYSTEM" ,"AMB");

INSERT INTO observation (obs_id, encounter_id, patient_id, effective_date, obs_code, code_text, quantity_value, quantity_unit, quantity_code) 
VALUES ("d4feabb5-7172-5f06-0cc2-4d03ad80c55f" ,"1aebaaae-f3a0-0b9e-936c-9d6202941131", 
"9e84e569-7adc-ff42-ccdb-9fe9c23842a6" ,"2012-01-22" ,"vital-signs" ,"Body Weight" ,"88.7" ,"kg" ,"kg");

-- allergy data (requires related encounter and patient, due to foreign key)

INSERT INTO patient (patient_id, given_name, family_name, gender, birth_date, deceased_date,street_address,city,state,postal_code, country, phone) VALUES ("be82309d-1a8f-df82-4cd6-5f03e1060e8e" ,"Pouros728" ,"Felton646" ,"male" ,"1970-03-07" ,"1000-01-01" ,"805 Greenfelder Heights" ,"Shirley" ,"MA" ,"" ,"US" ,"555-571-2641");
INSERT INTO allergy (allergy_id, patient_id, recorded_date, allergy_category, allergy_details, reaction, allergy_criticality) VALUES ("b55b4b83-f5ac-5ff8-609e-1b6ec01f5d14" ,"be82309d-1a8f-df82-4cd6-5f03e1060e8e" ,"1973-10-16" ,"environment" ,"Mold (organism)" ,"" ,"low");
INSERT INTO allergy (allergy_id, patient_id, recorded_date, allergy_category, allergy_details, reaction, allergy_criticality) VALUES ("cc548526-dce2-90ee-8ec0-6cc03760a00f" ,"be82309d-1a8f-df82-4cd6-5f03e1060e8e" ,"1973-10-16" ,"environment" ,"House dust mite (organism)" ,"" ,"low");
INSERT INTO allergy (allergy_id, patient_id, recorded_date, allergy_category, allergy_details, reaction, allergy_criticality) VALUES ("4f4b4c09-baea-dd49-f9f7-eb782b3c5e02" ,"be82309d-1a8f-df82-4cd6-5f03e1060e8e" ,"1973-10-16" ,"environment" ,"Animal dander (substance)" ,"1: Eruption of skin (disorder) 2: Wheal (finding) 3: Dyspnea (finding) " ,"low");
INSERT INTO allergy (allergy_id, patient_id, recorded_date, allergy_category, allergy_details, reaction, allergy_criticality) VALUES ("baac2b57-f704-60b7-449c-d1ee27075393" ,"be82309d-1a8f-df82-4cd6-5f03e1060e8e" ,"1973-10-16" ,"environment" ,"Grass pollen (substance)" ,"" ,"low");
INSERT INTO allergy (allergy_id, patient_id, recorded_date, allergy_category, allergy_details, reaction, allergy_criticality) VALUES ("debdfa2a-86a8-7f48-af3f-d819bb299a92" ,"be82309d-1a8f-df82-4cd6-5f03e1060e8e" ,"1973-10-16" ,"environment" ,"Tree pollen (substance)" ,"" ,"low");


