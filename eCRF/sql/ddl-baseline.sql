-- DROP SCHEMA baseline;

CREATE SCHEMA baseline AUTHORIZATION gony;

-- baseline.attribute_definition definition

-- Drop table

-- DROP TABLE baseline.attribute_definition;

CREATE TABLE baseline.attribute_definition (
	attribute_definition_id int4 NOT NULL,
	attribute_name varchar(255) NOT NULL,
	attribute_description text NULL,
	attribute_type_concept_id int4 NOT NULL,
	attribute_syntax text NULL
);


-- baseline.care_site definition

-- Drop table

-- DROP TABLE baseline.care_site;

CREATE TABLE baseline.care_site (
	care_site_id int4 NOT NULL,
	care_site_name varchar(255) NULL,
	place_of_service_concept_id int4 NULL,
	location_id int4 NULL,
	care_site_source_value varchar(50) NULL,
	place_of_service_source_value varchar(50) NULL
);


-- baseline.cdm_source definition

-- Drop table

-- DROP TABLE baseline.cdm_source;

CREATE TABLE baseline.cdm_source (
	cdm_source_name varchar(255) NOT NULL,
	cdm_source_abbreviation varchar(25) NULL,
	cdm_holder varchar(255) NULL,
	source_description text NULL,
	source_documentation_reference varchar(255) NULL,
	cdm_etl_reference varchar(255) NULL,
	source_release_date date NULL,
	cdm_release_date date NULL,
	cdm_version varchar(10) NULL,
	vocabulary_version varchar(20) NULL
);


-- baseline.cohort definition

-- Drop table

-- DROP TABLE baseline.cohort;

CREATE TABLE baseline.cohort (
	cohort_definition_id int4 NOT NULL,
	subject_id int4 NOT NULL,
	cohort_start_date date NOT NULL,
	cohort_end_date date NOT NULL
);


-- baseline.cohort_attribute definition

-- Drop table

-- DROP TABLE baseline.cohort_attribute;

CREATE TABLE baseline.cohort_attribute (
	cohort_definition_id int4 NOT NULL,
	subject_id int4 NOT NULL,
	cohort_start_date date NOT NULL,
	cohort_end_date date NOT NULL,
	attribute_definition_id int4 NOT NULL,
	value_as_number numeric NULL,
	value_as_concept_id int4 NULL
);


-- baseline.cohort_definition definition

-- Drop table

-- DROP TABLE baseline.cohort_definition;

CREATE TABLE baseline.cohort_definition (
	cohort_definition_id int4 NOT NULL,
	cohort_definition_name varchar(255) NOT NULL,
	cohort_definition_description text NULL,
	definition_type_concept_id int4 NOT NULL,
	cohort_definition_syntax text NULL,
	subject_concept_id int4 NOT NULL,
	cohort_initiation_date date NULL
);


-- baseline.concept definition

-- Drop table

-- DROP TABLE baseline.concept;

CREATE TABLE baseline.concept (
	concept_id int4 NOT NULL,
	concept_name varchar(255) NOT NULL,
	domain_id varchar(20) NOT NULL,
	vocabulary_id varchar(20) NOT NULL,
	concept_class_id varchar(20) NOT NULL,
	standard_concept varchar(1) NULL,
	concept_code varchar(50) NOT NULL,
	valid_start_date date NOT NULL,
	valid_end_date date NOT NULL,
	invalid_reason varchar(1) NULL
);


-- baseline.concept_ancestor definition

-- Drop table

-- DROP TABLE baseline.concept_ancestor;

CREATE TABLE baseline.concept_ancestor (
	ancestor_concept_id int4 NOT NULL,
	descendant_concept_id int4 NOT NULL,
	min_levels_of_separation int4 NOT NULL,
	max_levels_of_separation int4 NOT NULL
);


-- baseline.concept_class definition

-- Drop table

-- DROP TABLE baseline.concept_class;

CREATE TABLE baseline.concept_class (
	concept_class_id varchar(20) NOT NULL,
	concept_class_name varchar(255) NOT NULL,
	concept_class_concept_id int4 NOT NULL
);


-- baseline.concept_relationship definition

-- Drop table

-- DROP TABLE baseline.concept_relationship;

CREATE TABLE baseline.concept_relationship (
	concept_id_1 int4 NOT NULL,
	concept_id_2 int4 NOT NULL,
	relationship_id varchar(20) NOT NULL,
	valid_start_date date NOT NULL,
	valid_end_date date NOT NULL,
	invalid_reason varchar(1) NULL
);


-- baseline.concept_synonym definition

-- Drop table

-- DROP TABLE baseline.concept_synonym;

CREATE TABLE baseline.concept_synonym (
	concept_id int4 NOT NULL,
	concept_synonym_name varchar(1000) NOT NULL,
	language_concept_id int4 NOT NULL
);


-- baseline.condition_era definition

-- Drop table

-- DROP TABLE baseline.condition_era;

CREATE TABLE baseline.condition_era (
	condition_era_id int4 NOT NULL,
	person_id int4 NOT NULL,
	condition_concept_id int4 NOT NULL,
	condition_era_start_date date NOT NULL,
	condition_era_end_date date NOT NULL,
	condition_occurrence_count int4 NULL
);


-- baseline.condition_occurrence definition

-- Drop table

-- DROP TABLE baseline.condition_occurrence;

CREATE TABLE baseline.condition_occurrence (
	condition_occurrence_id int4 NOT NULL,
	person_id int4 NOT NULL,
	condition_concept_id int4 NOT NULL,
	condition_start_date date NOT NULL,
	condition_start_datetime timestamp NULL,
	condition_end_date date NULL,
	condition_end_datetime timestamp NULL,
	condition_type_concept_id int4 NOT NULL,
	stop_reason varchar(20) NULL,
	provider_id int4 NULL,
	visit_occurrence_id int4 NULL,
	visit_detail_id int4 NULL,
	condition_source_value varchar(50) NULL,
	condition_source_concept_id int4 NULL,
	condition_status_source_value varchar(50) NULL,
	condition_status_concept_id int4 NULL
);


-- baseline."cost" definition

-- Drop table

-- DROP TABLE baseline."cost";

CREATE TABLE baseline."cost" (
	cost_id int4 NOT NULL,
	cost_event_id int4 NOT NULL,
	cost_domain_id varchar(20) NOT NULL,
	cost_type_concept_id int4 NOT NULL,
	currency_concept_id int4 NULL,
	total_charge numeric NULL,
	total_cost numeric NULL,
	total_paid numeric NULL,
	paid_by_payer numeric NULL,
	paid_by_patient numeric NULL,
	paid_patient_copay numeric NULL,
	paid_patient_coinsurance numeric NULL,
	paid_patient_deductible numeric NULL,
	paid_by_primary numeric NULL,
	paid_ingredient_cost numeric NULL,
	paid_dispensing_fee numeric NULL,
	payer_plan_period_id int4 NULL,
	amount_allowed numeric NULL,
	revenue_code_concept_id int4 NULL,
	reveue_code_source_value varchar(50) NULL,
	drg_concept_id int4 NULL,
	drg_source_value varchar(3) NULL
);


-- baseline.death definition

-- Drop table

-- DROP TABLE baseline.death;

CREATE TABLE baseline.death (
	person_id int4 NOT NULL,
	death_date date NOT NULL,
	death_datetime timestamp NULL,
	death_type_concept_id int4 NOT NULL,
	cause_concept_id int4 NULL,
	cause_source_value varchar(50) NULL,
	cause_source_concept_id int4 NULL
);


-- baseline.device_exposure definition

-- Drop table

-- DROP TABLE baseline.device_exposure;

CREATE TABLE baseline.device_exposure (
	device_exposure_id int4 NOT NULL,
	person_id int4 NOT NULL,
	device_concept_id int4 NOT NULL,
	device_exposure_start_date date NOT NULL,
	device_exposure_start_datetime timestamp NULL,
	device_exposure_end_date date NULL,
	device_exposure_end_datetime timestamp NULL,
	device_type_concept_id int4 NOT NULL,
	unique_device_id varchar(50) NULL,
	quantity int4 NULL,
	provider_id int4 NULL,
	visit_occurrence_id int4 NULL,
	visit_detail_id int4 NULL,
	device_source_value varchar(100) NULL,
	device_source_concept_id int4 NULL
);


-- baseline."domain" definition

-- Drop table

-- DROP TABLE baseline."domain";

CREATE TABLE baseline."domain" (
	domain_id varchar(20) NOT NULL,
	domain_name varchar(255) NOT NULL,
	domain_concept_id int4 NOT NULL
);


-- baseline.dose_era definition

-- Drop table

-- DROP TABLE baseline.dose_era;

CREATE TABLE baseline.dose_era (
	dose_era_id int4 NOT NULL,
	person_id int4 NOT NULL,
	drug_concept_id int4 NOT NULL,
	unit_concept_id int4 NOT NULL,
	dose_value numeric NOT NULL,
	dose_era_start_date date NOT NULL,
	dose_era_end_date date NOT NULL
);


-- baseline.drug_era definition

-- Drop table

-- DROP TABLE baseline.drug_era;

CREATE TABLE baseline.drug_era (
	drug_era_id int4 NOT NULL,
	person_id int4 NOT NULL,
	drug_concept_id int4 NOT NULL,
	drug_era_start_date date NOT NULL,
	drug_era_end_date date NOT NULL,
	drug_exposure_count int4 NULL,
	gap_days int4 NULL
);


-- baseline.drug_exposure definition

-- Drop table

-- DROP TABLE baseline.drug_exposure;

CREATE TABLE baseline.drug_exposure (
	drug_exposure_id int4 NOT NULL,
	person_id int4 NOT NULL,
	drug_concept_id int4 NOT NULL,
	drug_exposure_start_date date NOT NULL,
	drug_exposure_start_datetime timestamp NULL,
	drug_exposure_end_date date NOT NULL,
	drug_exposure_end_datetime timestamp NULL,
	verbatim_end_date date NULL,
	drug_type_concept_id int4 NOT NULL,
	stop_reason varchar(20) NULL,
	refills int4 NULL,
	quantity numeric NULL,
	days_supply int4 NULL,
	sig text NULL,
	route_concept_id int4 NULL,
	lot_number varchar(50) NULL,
	provider_id int4 NULL,
	visit_occurrence_id int4 NULL,
	visit_detail_id int4 NULL,
	drug_source_value varchar(50) NULL,
	drug_source_concept_id int4 NULL,
	route_source_value varchar(50) NULL,
	dose_unit_source_value varchar(50) NULL
);


-- baseline.drug_strength definition

-- Drop table

-- DROP TABLE baseline.drug_strength;

CREATE TABLE baseline.drug_strength (
	drug_concept_id int4 NOT NULL,
	ingredient_concept_id int4 NOT NULL,
	amount_value numeric NULL,
	amount_unit_concept_id int4 NULL,
	numerator_value numeric NULL,
	numerator_unit_concept_id int4 NULL,
	denominator_value numeric NULL,
	denominator_unit_concept_id int4 NULL,
	box_size int4 NULL,
	valid_start_date date NOT NULL,
	valid_end_date date NOT NULL,
	invalid_reason varchar(1) NULL
);


-- baseline.fact_relationship definition

-- Drop table

-- DROP TABLE baseline.fact_relationship;

CREATE TABLE baseline.fact_relationship (
	domain_concept_id_1 int4 NOT NULL,
	fact_id_1 int4 NOT NULL,
	domain_concept_id_2 int4 NOT NULL,
	fact_id_2 int4 NOT NULL,
	relationship_concept_id int4 NOT NULL
);


-- baseline."location" definition

-- Drop table

-- DROP TABLE baseline."location";

CREATE TABLE baseline."location" (
	location_id int4 NOT NULL,
	address_1 varchar(50) NULL,
	address_2 varchar(50) NULL,
	city varchar(50) NULL,
	state varchar(2) NULL,
	zip varchar(9) NULL,
	county varchar(20) NULL,
	location_source_value varchar(50) NULL
);


-- baseline.measurement definition

-- Drop table

-- DROP TABLE baseline.measurement;

CREATE TABLE baseline.measurement (
	measurement_id int4 NOT NULL,
	person_id int4 NOT NULL,
	measurement_concept_id int4 NOT NULL,
	measurement_date date NOT NULL,
	measurement_datetime timestamp NULL,
	measurement_time varchar(10) NULL,
	measurement_type_concept_id int4 NOT NULL,
	operator_concept_id int4 NULL,
	value_as_number numeric NULL,
	value_as_concept_id int4 NULL,
	unit_concept_id int4 NULL,
	range_low numeric NULL,
	range_high numeric NULL,
	provider_id int4 NULL,
	visit_occurrence_id int4 NULL,
	visit_detail_id int4 NULL,
	measurement_source_value varchar(50) NULL,
	measurement_source_concept_id int4 NULL,
	unit_source_value varchar(50) NULL,
	value_source_value varchar(50) NULL
);


-- baseline.metadata definition

-- Drop table

-- DROP TABLE baseline.metadata;

CREATE TABLE baseline.metadata (
	metadata_concept_id int4 NOT NULL,
	metadata_type_concept_id int4 NOT NULL,
	"name" varchar(250) NOT NULL,
	value_as_string text NULL,
	value_as_concept_id int4 NULL,
	metadata_date date NULL,
	metadata_datetime timestamp NULL
);


-- baseline.note definition

-- Drop table

-- DROP TABLE baseline.note;

CREATE TABLE baseline.note (
	note_id int4 NOT NULL,
	person_id int4 NOT NULL,
	note_date date NOT NULL,
	note_datetime timestamp NULL,
	note_type_concept_id int4 NOT NULL,
	note_class_concept_id int4 NOT NULL,
	note_title varchar(250) NULL,
	note_text text NULL,
	encoding_concept_id int4 NOT NULL,
	language_concept_id int4 NOT NULL,
	provider_id int4 NULL,
	visit_occurrence_id int4 NULL,
	visit_detail_id int4 NULL,
	note_source_value varchar(50) NULL
);


-- baseline.note_nlp definition

-- Drop table

-- DROP TABLE baseline.note_nlp;

CREATE TABLE baseline.note_nlp (
	note_nlp_id int4 NOT NULL,
	note_id int4 NOT NULL,
	section_concept_id int4 NULL,
	snippet varchar(250) NULL,
	"offset" varchar(250) NULL,
	lexical_variant varchar(250) NOT NULL,
	note_nlp_concept_id int4 NULL,
	note_nlp_source_concept_id int4 NULL,
	nlp_system varchar(250) NULL,
	nlp_date date NOT NULL,
	nlp_datetime timestamp NULL,
	term_exists varchar(1) NULL,
	term_temporal varchar(50) NULL,
	term_modifiers varchar(2000) NULL
);


-- baseline.observation definition

-- Drop table

-- DROP TABLE baseline.observation;

CREATE TABLE baseline.observation (
	observation_id int4 NOT NULL,
	person_id int4 NOT NULL,
	observation_concept_id int4 NOT NULL,
	observation_date date NOT NULL,
	observation_datetime timestamp NULL,
	observation_type_concept_id int4 NOT NULL,
	value_as_number numeric NULL,
	value_as_string varchar(60) NULL,
	value_as_concept_id int4 NULL,
	qualifier_concept_id int4 NULL,
	unit_concept_id int4 NULL,
	provider_id int4 NULL,
	visit_occurrence_id int4 NULL,
	visit_detail_id int4 NULL,
	observation_source_value varchar(50) NULL,
	observation_source_concept_id int4 NULL,
	unit_source_value varchar(50) NULL,
	qualifier_source_value varchar(50) NULL
);


-- baseline.observation_period definition

-- Drop table

-- DROP TABLE baseline.observation_period;

CREATE TABLE baseline.observation_period (
	observation_period_id int4 NOT NULL,
	person_id int4 NOT NULL,
	observation_period_start_date date NOT NULL,
	observation_period_end_date date NOT NULL,
	period_type_concept_id int4 NOT NULL
);


-- baseline.payer_plan_period definition

-- Drop table

-- DROP TABLE baseline.payer_plan_period;

CREATE TABLE baseline.payer_plan_period (
	payer_plan_period_id int4 NOT NULL,
	person_id int4 NOT NULL,
	payer_plan_period_start_date date NOT NULL,
	payer_plan_period_end_date date NOT NULL,
	payer_concept_id int4 NULL,
	payer_source_value varchar(50) NULL,
	payer_source_concept_id int4 NULL,
	plan_concept_id int4 NULL,
	plan_source_value varchar(50) NULL,
	plan_source_concept_id int4 NULL,
	sponsor_concept_id int4 NULL,
	sponsor_source_value varchar(50) NULL,
	sponsor_source_concept_id int4 NULL,
	family_source_value varchar(50) NULL,
	stop_reason_concept_id int4 NULL,
	stop_reason_source_value varchar(50) NULL,
	stop_reason_source_concept_id int4 NULL
);


-- baseline.person definition

-- Drop table

-- DROP TABLE baseline.person;

CREATE TABLE baseline.person (
	person_id int4 NOT NULL,
	gender_concept_id int4 NOT NULL,
	year_of_birth int4 NOT NULL,
	month_of_birth int4 NULL,
	day_of_birth int4 NULL,
	birth_datetime timestamp NULL,
	race_concept_id int4 NOT NULL,
	ethnicity_concept_id int4 NOT NULL,
	location_id int4 NULL,
	provider_id int4 NULL,
	care_site_id int4 NULL,
	person_source_value varchar(50) NULL,
	gender_source_value varchar(50) NULL,
	gender_source_concept_id int4 NULL,
	race_source_value varchar(50) NULL,
	race_source_concept_id int4 NULL,
	ethnicity_source_value varchar(50) NULL,
	ethnicity_source_concept_id int4 NULL
);


-- baseline.procedure_occurrence definition

-- Drop table

-- DROP TABLE baseline.procedure_occurrence;

CREATE TABLE baseline.procedure_occurrence (
	procedure_occurrence_id int4 NOT NULL,
	person_id int4 NOT NULL,
	procedure_concept_id int4 NOT NULL,
	procedure_date date NOT NULL,
	procedure_datetime timestamp NULL,
	procedure_type_concept_id int4 NOT NULL,
	modifier_concept_id int4 NULL,
	quantity int4 NULL,
	provider_id int4 NULL,
	visit_occurrence_id int4 NULL,
	visit_detail_id int4 NULL,
	procedure_source_value varchar(50) NULL,
	procedure_source_concept_id int4 NULL,
	modifier_source_value varchar(50) NULL
);


-- baseline.provider definition

-- Drop table

-- DROP TABLE baseline.provider;

CREATE TABLE baseline.provider (
	provider_id int4 NOT NULL,
	provider_name varchar(255) NULL,
	npi varchar(20) NULL,
	dea varchar(20) NULL,
	specialty_concept_id int4 NULL,
	care_site_id int4 NULL,
	year_of_birth int4 NULL,
	gender_concept_id int4 NULL,
	provider_source_value varchar(50) NULL,
	specialty_source_value varchar(50) NULL,
	specialty_source_concept_id int4 NULL,
	gender_source_value varchar(50) NULL,
	gender_source_concept_id int4 NULL
);


-- baseline.relationship definition

-- Drop table

-- DROP TABLE baseline.relationship;

CREATE TABLE baseline.relationship (
	relationship_id varchar(20) NOT NULL,
	relationship_name varchar(255) NOT NULL,
	is_hierarchical varchar(1) NOT NULL,
	defines_ancestry varchar(1) NOT NULL,
	reverse_relationship_id varchar(20) NOT NULL,
	relationship_concept_id int4 NOT NULL
);


-- baseline.source_to_concept_map definition

-- Drop table

-- DROP TABLE baseline.source_to_concept_map;

CREATE TABLE baseline.source_to_concept_map (
	source_code varchar(50) NOT NULL,
	source_concept_id int4 NOT NULL,
	source_vocabulary_id varchar(20) NOT NULL,
	source_code_description varchar(255) NULL,
	target_concept_id int4 NOT NULL,
	target_vocabulary_id varchar(20) NOT NULL,
	valid_start_date date NOT NULL,
	valid_end_date date NOT NULL,
	invalid_reason varchar(1) NULL
);


-- baseline.specimen definition

-- Drop table

-- DROP TABLE baseline.specimen;

CREATE TABLE baseline.specimen (
	specimen_id int4 NOT NULL,
	person_id int4 NOT NULL,
	specimen_concept_id int4 NOT NULL,
	specimen_type_concept_id int4 NOT NULL,
	specimen_date date NOT NULL,
	specimen_datetime timestamp NULL,
	quantity numeric NULL,
	unit_concept_id int4 NULL,
	anatomic_site_concept_id int4 NULL,
	disease_status_concept_id int4 NULL,
	specimen_source_id varchar(50) NULL,
	specimen_source_value varchar(50) NULL,
	unit_source_value varchar(50) NULL,
	anatomic_site_source_value varchar(50) NULL,
	disease_status_source_value varchar(50) NULL
);


-- baseline.visit_detail definition

-- Drop table

-- DROP TABLE baseline.visit_detail;

CREATE TABLE baseline.visit_detail (
	visit_detail_id int4 NOT NULL,
	person_id int4 NOT NULL,
	visit_detail_concept_id int4 NOT NULL,
	visit_detail_start_date date NOT NULL,
	visit_detail_start_datetime timestamp NULL,
	visit_detail_end_date date NOT NULL,
	visit_detail_end_datetime timestamp NULL,
	visit_detail_type_concept_id int4 NOT NULL,
	provider_id int4 NULL,
	care_site_id int4 NULL,
	admitting_source_concept_id int4 NULL,
	discharge_to_concept_id int4 NULL,
	preceding_visit_detail_id int4 NULL,
	visit_detail_source_value varchar(50) NULL,
	visit_detail_source_concept_id int4 NULL,
	admitting_source_value varchar(50) NULL,
	discharge_to_source_value varchar(50) NULL,
	visit_detail_parent_id int4 NULL,
	visit_occurrence_id int4 NOT NULL
);


-- baseline.visit_occurrence definition

-- Drop table

-- DROP TABLE baseline.visit_occurrence;

CREATE TABLE baseline.visit_occurrence (
	visit_occurrence_id int4 NOT NULL,
	person_id int4 NOT NULL,
	visit_concept_id int4 NOT NULL,
	visit_start_date date NOT NULL,
	visit_start_datetime timestamp NULL,
	visit_end_date date NOT NULL,
	visit_end_datetime timestamp NULL,
	visit_type_concept_id int4 NOT NULL,
	provider_id int4 NULL,
	care_site_id int4 NULL,
	visit_source_value varchar(50) NULL,
	visit_source_concept_id int4 NULL,
	admitting_source_concept_id int4 NULL,
	admitting_source_value varchar(50) NULL,
	discharge_to_concept_id int4 NULL,
	discharge_to_source_value varchar(50) NULL,
	preceding_visit_occurrence_id int4 NULL
);


-- baseline.vocabulary definition

-- Drop table

-- DROP TABLE baseline.vocabulary;

CREATE TABLE baseline.vocabulary (
	vocabulary_id varchar(20) NOT NULL,
	vocabulary_name varchar(255) NOT NULL,
	vocabulary_reference varchar(255) NOT NULL,
	vocabulary_version varchar(255) NOT NULL,
	vocabulary_concept_id int4 NOT NULL
);