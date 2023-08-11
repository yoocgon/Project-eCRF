


CREATE USER gony PASSWORD 'asdf' SUPERUSER;
alter role gony superuser;

GRANT ALL PRIVILEGES ON DATABASE kcure TO gony;
create database kcure with owner = gony encoding = 'UTF8' connection limit = -1;

drop database kcure;

--
-- PostgreSQL database cluster dump
--

-- Started on 2023-08-08 10:17:32

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE gony;
ALTER ROLE gony WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-08-08 10:17:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2023-08-08 10:17:34

--
-- PostgreSQL database dump complete
--

--
-- Database "kcure" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-08-08 10:17:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4159 (class 1262 OID 16385)
-- Name: kcure; Type: DATABASE; Schema: -; Owner: gony
--

CREATE DATABASE kcure WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE kcure OWNER TO gony;

\connect kcure

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 25067)
-- Name: baseline; Type: SCHEMA; Schema: -; Owner: gony
--

CREATE SCHEMA baseline;


ALTER SCHEMA baseline OWNER TO gony;

--
-- TOC entry 7 (class 2615 OID 24737)
-- Name: cancle_breast; Type: SCHEMA; Schema: -; Owner: gony
--

CREATE SCHEMA cancle_breast;


ALTER SCHEMA cancle_breast OWNER TO gony;

--
-- TOC entry 5 (class 2615 OID 24736)
-- Name: cancle_stomach; Type: SCHEMA; Schema: -; Owner: gony
--

CREATE SCHEMA cancle_stomach;


ALTER SCHEMA cancle_stomach OWNER TO gony;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 271 (class 1259 OID 25209)
-- Name: attribute_definition; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.attribute_definition (
    attribute_definition_id integer NOT NULL,
    attribute_name character varying(255) NOT NULL,
    attribute_description text,
    attribute_type_concept_id integer NOT NULL,
    attribute_syntax text
);


ALTER TABLE baseline.attribute_definition OWNER TO gony;

--
-- TOC entry 290 (class 1259 OID 25284)
-- Name: care_site; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.care_site (
    care_site_id integer NOT NULL,
    care_site_name character varying(255),
    place_of_service_concept_id integer,
    location_id integer,
    care_site_source_value character varying(50),
    place_of_service_source_value character varying(50)
);


ALTER TABLE baseline.care_site OWNER TO gony;

--
-- TOC entry 272 (class 1259 OID 25214)
-- Name: cdm_source; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.cdm_source (
    cdm_source_name character varying(255) NOT NULL,
    cdm_source_abbreviation character varying(25),
    cdm_holder character varying(255),
    source_description text,
    source_documentation_reference character varying(255),
    cdm_etl_reference character varying(255),
    source_release_date date,
    cdm_release_date date,
    cdm_version character varying(10),
    vocabulary_version character varying(20)
);


ALTER TABLE baseline.cdm_source OWNER TO gony;

--
-- TOC entry 294 (class 1259 OID 25298)
-- Name: cohort; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.cohort (
    cohort_definition_id integer NOT NULL,
    subject_id integer NOT NULL,
    cohort_start_date date NOT NULL,
    cohort_end_date date NOT NULL
);


ALTER TABLE baseline.cohort OWNER TO gony;

--
-- TOC entry 295 (class 1259 OID 25301)
-- Name: cohort_attribute; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.cohort_attribute (
    cohort_definition_id integer NOT NULL,
    subject_id integer NOT NULL,
    cohort_start_date date NOT NULL,
    cohort_end_date date NOT NULL,
    attribute_definition_id integer NOT NULL,
    value_as_number numeric,
    value_as_concept_id integer
);


ALTER TABLE baseline.cohort_attribute OWNER TO gony;

--
-- TOC entry 270 (class 1259 OID 25203)
-- Name: cohort_definition; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.cohort_definition (
    cohort_definition_id integer NOT NULL,
    cohort_definition_name character varying(255) NOT NULL,
    cohort_definition_description text,
    definition_type_concept_id integer NOT NULL,
    cohort_definition_syntax text,
    subject_concept_id integer NOT NULL,
    cohort_initiation_date date
);


ALTER TABLE baseline.cohort_definition OWNER TO gony;

--
-- TOC entry 260 (class 1259 OID 25119)
-- Name: concept; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.concept (
    concept_id integer NOT NULL,
    concept_name character varying(255) NOT NULL,
    domain_id character varying(20) NOT NULL,
    vocabulary_id character varying(20) NOT NULL,
    concept_class_id character varying(20) NOT NULL,
    standard_concept character varying(1),
    concept_code character varying(50) NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason character varying(1)
);


ALTER TABLE baseline.concept OWNER TO gony;

--
-- TOC entry 267 (class 1259 OID 25192)
-- Name: concept_ancestor; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.concept_ancestor (
    ancestor_concept_id integer NOT NULL,
    descendant_concept_id integer NOT NULL,
    min_levels_of_separation integer NOT NULL,
    max_levels_of_separation integer NOT NULL
);


ALTER TABLE baseline.concept_ancestor OWNER TO gony;

--
-- TOC entry 263 (class 1259 OID 25178)
-- Name: concept_class; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.concept_class (
    concept_class_id character varying(20) NOT NULL,
    concept_class_name character varying(255) NOT NULL,
    concept_class_concept_id integer NOT NULL
);


ALTER TABLE baseline.concept_class OWNER TO gony;

--
-- TOC entry 264 (class 1259 OID 25181)
-- Name: concept_relationship; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.concept_relationship (
    concept_id_1 integer NOT NULL,
    concept_id_2 integer NOT NULL,
    relationship_id character varying(20) NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason character varying(1)
);


ALTER TABLE baseline.concept_relationship OWNER TO gony;

--
-- TOC entry 266 (class 1259 OID 25187)
-- Name: concept_synonym; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.concept_synonym (
    concept_id integer NOT NULL,
    concept_synonym_name character varying(1000) NOT NULL,
    language_concept_id integer NOT NULL
);


ALTER TABLE baseline.concept_synonym OWNER TO gony;

--
-- TOC entry 298 (class 1259 OID 25314)
-- Name: condition_era; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.condition_era (
    condition_era_id integer NOT NULL,
    person_id integer NOT NULL,
    condition_concept_id integer NOT NULL,
    condition_era_start_date date NOT NULL,
    condition_era_end_date date NOT NULL,
    condition_occurrence_count integer
);


ALTER TABLE baseline.condition_era OWNER TO gony;

--
-- TOC entry 283 (class 1259 OID 25255)
-- Name: condition_occurrence; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.condition_occurrence (
    condition_occurrence_id integer NOT NULL,
    person_id integer NOT NULL,
    condition_concept_id integer NOT NULL,
    condition_start_date date NOT NULL,
    condition_start_datetime timestamp without time zone,
    condition_end_date date,
    condition_end_datetime timestamp without time zone,
    condition_type_concept_id integer NOT NULL,
    stop_reason character varying(20),
    provider_id integer,
    visit_occurrence_id integer,
    visit_detail_id integer,
    condition_source_value character varying(50),
    condition_source_concept_id integer,
    condition_status_source_value character varying(50),
    condition_status_concept_id integer
);


ALTER TABLE baseline.condition_occurrence OWNER TO gony;

--
-- TOC entry 293 (class 1259 OID 25293)
-- Name: cost; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.cost (
    cost_id integer NOT NULL,
    cost_event_id integer NOT NULL,
    cost_domain_id character varying(20) NOT NULL,
    cost_type_concept_id integer NOT NULL,
    currency_concept_id integer,
    total_charge numeric,
    total_cost numeric,
    total_paid numeric,
    paid_by_payer numeric,
    paid_by_patient numeric,
    paid_patient_copay numeric,
    paid_patient_coinsurance numeric,
    paid_patient_deductible numeric,
    paid_by_primary numeric,
    paid_ingredient_cost numeric,
    paid_dispensing_fee numeric,
    payer_plan_period_id integer,
    amount_allowed numeric,
    revenue_code_concept_id integer,
    reveue_code_source_value character varying(50),
    drg_concept_id integer,
    drg_source_value character varying(3)
);


ALTER TABLE baseline.cost OWNER TO gony;

--
-- TOC entry 277 (class 1259 OID 25235)
-- Name: death; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.death (
    person_id integer NOT NULL,
    death_date date NOT NULL,
    death_datetime timestamp without time zone,
    death_type_concept_id integer NOT NULL,
    cause_concept_id integer,
    cause_source_value character varying(50),
    cause_source_concept_id integer
);


ALTER TABLE baseline.death OWNER TO gony;

--
-- TOC entry 282 (class 1259 OID 25252)
-- Name: device_exposure; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.device_exposure (
    device_exposure_id integer NOT NULL,
    person_id integer NOT NULL,
    device_concept_id integer NOT NULL,
    device_exposure_start_date date NOT NULL,
    device_exposure_start_datetime timestamp without time zone,
    device_exposure_end_date date,
    device_exposure_end_datetime timestamp without time zone,
    device_type_concept_id integer NOT NULL,
    unique_device_id character varying(50),
    quantity integer,
    provider_id integer,
    visit_occurrence_id integer,
    visit_detail_id integer,
    device_source_value character varying(100),
    device_source_concept_id integer
);


ALTER TABLE baseline.device_exposure OWNER TO gony;

--
-- TOC entry 262 (class 1259 OID 25175)
-- Name: domain; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.domain (
    domain_id character varying(20) NOT NULL,
    domain_name character varying(255) NOT NULL,
    domain_concept_id integer NOT NULL
);


ALTER TABLE baseline.domain OWNER TO gony;

--
-- TOC entry 297 (class 1259 OID 25309)
-- Name: dose_era; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.dose_era (
    dose_era_id integer NOT NULL,
    person_id integer NOT NULL,
    drug_concept_id integer NOT NULL,
    unit_concept_id integer NOT NULL,
    dose_value numeric NOT NULL,
    dose_era_start_date date NOT NULL,
    dose_era_end_date date NOT NULL
);


ALTER TABLE baseline.dose_era OWNER TO gony;

--
-- TOC entry 296 (class 1259 OID 25306)
-- Name: drug_era; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.drug_era (
    drug_era_id integer NOT NULL,
    person_id integer NOT NULL,
    drug_concept_id integer NOT NULL,
    drug_era_start_date date NOT NULL,
    drug_era_end_date date NOT NULL,
    drug_exposure_count integer,
    gap_days integer
);


ALTER TABLE baseline.drug_era OWNER TO gony;

--
-- TOC entry 281 (class 1259 OID 25247)
-- Name: drug_exposure; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.drug_exposure (
    drug_exposure_id integer NOT NULL,
    person_id integer NOT NULL,
    drug_concept_id integer NOT NULL,
    drug_exposure_start_date date NOT NULL,
    drug_exposure_start_datetime timestamp without time zone,
    drug_exposure_end_date date NOT NULL,
    drug_exposure_end_datetime timestamp without time zone,
    verbatim_end_date date,
    drug_type_concept_id integer NOT NULL,
    stop_reason character varying(20),
    refills integer,
    quantity numeric,
    days_supply integer,
    sig text,
    route_concept_id integer,
    lot_number character varying(50),
    provider_id integer,
    visit_occurrence_id integer,
    visit_detail_id integer,
    drug_source_value character varying(50),
    drug_source_concept_id integer,
    route_source_value character varying(50),
    dose_unit_source_value character varying(50)
);


ALTER TABLE baseline.drug_exposure OWNER TO gony;

--
-- TOC entry 269 (class 1259 OID 25198)
-- Name: drug_strength; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.drug_strength (
    drug_concept_id integer NOT NULL,
    ingredient_concept_id integer NOT NULL,
    amount_value numeric,
    amount_unit_concept_id integer,
    numerator_value numeric,
    numerator_unit_concept_id integer,
    denominator_value numeric,
    denominator_unit_concept_id integer,
    box_size integer,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason character varying(1)
);


ALTER TABLE baseline.drug_strength OWNER TO gony;

--
-- TOC entry 288 (class 1259 OID 25278)
-- Name: fact_relationship; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.fact_relationship (
    domain_concept_id_1 integer NOT NULL,
    fact_id_1 integer NOT NULL,
    domain_concept_id_2 integer NOT NULL,
    fact_id_2 integer NOT NULL,
    relationship_concept_id integer NOT NULL
);


ALTER TABLE baseline.fact_relationship OWNER TO gony;

--
-- TOC entry 289 (class 1259 OID 25281)
-- Name: location; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.location (
    location_id integer NOT NULL,
    address_1 character varying(50),
    address_2 character varying(50),
    city character varying(50),
    state character varying(2),
    zip character varying(9),
    county character varying(20),
    location_source_value character varying(50)
);


ALTER TABLE baseline.location OWNER TO gony;

--
-- TOC entry 284 (class 1259 OID 25258)
-- Name: measurement; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.measurement (
    measurement_id integer NOT NULL,
    person_id integer NOT NULL,
    measurement_concept_id integer NOT NULL,
    measurement_date date NOT NULL,
    measurement_datetime timestamp without time zone,
    measurement_time character varying(10),
    measurement_type_concept_id integer NOT NULL,
    operator_concept_id integer,
    value_as_number numeric,
    value_as_concept_id integer,
    unit_concept_id integer,
    range_low numeric,
    range_high numeric,
    provider_id integer,
    visit_occurrence_id integer,
    visit_detail_id integer,
    measurement_source_value character varying(50),
    measurement_source_concept_id integer,
    unit_source_value character varying(50),
    value_source_value character varying(50)
);


ALTER TABLE baseline.measurement OWNER TO gony;

--
-- TOC entry 273 (class 1259 OID 25219)
-- Name: metadata; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.metadata (
    metadata_concept_id integer NOT NULL,
    metadata_type_concept_id integer NOT NULL,
    name character varying(250) NOT NULL,
    value_as_string text,
    value_as_concept_id integer,
    metadata_date date,
    metadata_datetime timestamp without time zone
);


ALTER TABLE baseline.metadata OWNER TO gony;

--
-- TOC entry 285 (class 1259 OID 25263)
-- Name: note; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.note (
    note_id integer NOT NULL,
    person_id integer NOT NULL,
    note_date date NOT NULL,
    note_datetime timestamp without time zone,
    note_type_concept_id integer NOT NULL,
    note_class_concept_id integer NOT NULL,
    note_title character varying(250),
    note_text text,
    encoding_concept_id integer NOT NULL,
    language_concept_id integer NOT NULL,
    provider_id integer,
    visit_occurrence_id integer,
    visit_detail_id integer,
    note_source_value character varying(50)
);


ALTER TABLE baseline.note OWNER TO gony;

--
-- TOC entry 286 (class 1259 OID 25268)
-- Name: note_nlp; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.note_nlp (
    note_nlp_id integer NOT NULL,
    note_id integer NOT NULL,
    section_concept_id integer,
    snippet character varying(250),
    "offset" character varying(250),
    lexical_variant character varying(250) NOT NULL,
    note_nlp_concept_id integer,
    note_nlp_source_concept_id integer,
    nlp_system character varying(250),
    nlp_date date NOT NULL,
    nlp_datetime timestamp without time zone,
    term_exists character varying(1),
    term_temporal character varying(50),
    term_modifiers character varying(2000)
);


ALTER TABLE baseline.note_nlp OWNER TO gony;

--
-- TOC entry 287 (class 1259 OID 25273)
-- Name: observation; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.observation (
    observation_id integer NOT NULL,
    person_id integer NOT NULL,
    observation_concept_id integer NOT NULL,
    observation_date date NOT NULL,
    observation_datetime timestamp without time zone,
    observation_type_concept_id integer NOT NULL,
    value_as_number numeric,
    value_as_string character varying(60),
    value_as_concept_id integer,
    qualifier_concept_id integer,
    unit_concept_id integer,
    provider_id integer,
    visit_occurrence_id integer,
    visit_detail_id integer,
    observation_source_value character varying(50),
    observation_source_concept_id integer,
    unit_source_value character varying(50),
    qualifier_source_value character varying(50)
);


ALTER TABLE baseline.observation OWNER TO gony;

--
-- TOC entry 275 (class 1259 OID 25227)
-- Name: observation_period; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.observation_period (
    observation_period_id integer NOT NULL,
    person_id integer NOT NULL,
    observation_period_start_date date NOT NULL,
    observation_period_end_date date NOT NULL,
    period_type_concept_id integer NOT NULL
);


ALTER TABLE baseline.observation_period OWNER TO gony;

--
-- TOC entry 292 (class 1259 OID 25290)
-- Name: payer_plan_period; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.payer_plan_period (
    payer_plan_period_id integer NOT NULL,
    person_id integer NOT NULL,
    payer_plan_period_start_date date NOT NULL,
    payer_plan_period_end_date date NOT NULL,
    payer_concept_id integer,
    payer_source_value character varying(50),
    payer_source_concept_id integer,
    plan_concept_id integer,
    plan_source_value character varying(50),
    plan_source_concept_id integer,
    sponsor_concept_id integer,
    sponsor_source_value character varying(50),
    sponsor_source_concept_id integer,
    family_source_value character varying(50),
    stop_reason_concept_id integer,
    stop_reason_source_value character varying(50),
    stop_reason_source_concept_id integer
);


ALTER TABLE baseline.payer_plan_period OWNER TO gony;

--
-- TOC entry 274 (class 1259 OID 25224)
-- Name: person; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.person (
    person_id integer NOT NULL,
    gender_concept_id integer NOT NULL,
    year_of_birth integer NOT NULL,
    month_of_birth integer,
    day_of_birth integer,
    birth_datetime timestamp without time zone,
    race_concept_id integer NOT NULL,
    ethnicity_concept_id integer NOT NULL,
    location_id integer,
    provider_id integer,
    care_site_id integer,
    person_source_value character varying(50),
    gender_source_value character varying(50),
    gender_source_concept_id integer,
    race_source_value character varying(50),
    race_source_concept_id integer,
    ethnicity_source_value character varying(50),
    ethnicity_source_concept_id integer
);


ALTER TABLE baseline.person OWNER TO gony;

--
-- TOC entry 280 (class 1259 OID 25244)
-- Name: procedure_occurrence; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.procedure_occurrence (
    procedure_occurrence_id integer NOT NULL,
    person_id integer NOT NULL,
    procedure_concept_id integer NOT NULL,
    procedure_date date NOT NULL,
    procedure_datetime timestamp without time zone,
    procedure_type_concept_id integer NOT NULL,
    modifier_concept_id integer,
    quantity integer,
    provider_id integer,
    visit_occurrence_id integer,
    visit_detail_id integer,
    procedure_source_value character varying(50),
    procedure_source_concept_id integer,
    modifier_source_value character varying(50)
);


ALTER TABLE baseline.procedure_occurrence OWNER TO gony;

--
-- TOC entry 291 (class 1259 OID 25287)
-- Name: provider; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.provider (
    provider_id integer NOT NULL,
    provider_name character varying(255),
    npi character varying(20),
    dea character varying(20),
    specialty_concept_id integer,
    care_site_id integer,
    year_of_birth integer,
    gender_concept_id integer,
    provider_source_value character varying(50),
    specialty_source_value character varying(50),
    specialty_source_concept_id integer,
    gender_source_value character varying(50),
    gender_source_concept_id integer
);


ALTER TABLE baseline.provider OWNER TO gony;

--
-- TOC entry 265 (class 1259 OID 25184)
-- Name: relationship; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.relationship (
    relationship_id character varying(20) NOT NULL,
    relationship_name character varying(255) NOT NULL,
    is_hierarchical character varying(1) NOT NULL,
    defines_ancestry character varying(1) NOT NULL,
    reverse_relationship_id character varying(20) NOT NULL,
    relationship_concept_id integer NOT NULL
);


ALTER TABLE baseline.relationship OWNER TO gony;

--
-- TOC entry 268 (class 1259 OID 25195)
-- Name: source_to_concept_map; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.source_to_concept_map (
    source_code character varying(50) NOT NULL,
    source_concept_id integer NOT NULL,
    source_vocabulary_id character varying(20) NOT NULL,
    source_code_description character varying(255),
    target_concept_id integer NOT NULL,
    target_vocabulary_id character varying(20) NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason character varying(1)
);


ALTER TABLE baseline.source_to_concept_map OWNER TO gony;

--
-- TOC entry 276 (class 1259 OID 25230)
-- Name: specimen; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.specimen (
    specimen_id integer NOT NULL,
    person_id integer NOT NULL,
    specimen_concept_id integer NOT NULL,
    specimen_type_concept_id integer NOT NULL,
    specimen_date date NOT NULL,
    specimen_datetime timestamp without time zone,
    quantity numeric,
    unit_concept_id integer,
    anatomic_site_concept_id integer,
    disease_status_concept_id integer,
    specimen_source_id character varying(50),
    specimen_source_value character varying(50),
    unit_source_value character varying(50),
    anatomic_site_source_value character varying(50),
    disease_status_source_value character varying(50)
);


ALTER TABLE baseline.specimen OWNER TO gony;

--
-- TOC entry 279 (class 1259 OID 25241)
-- Name: visit_detail; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.visit_detail (
    visit_detail_id integer NOT NULL,
    person_id integer NOT NULL,
    visit_detail_concept_id integer NOT NULL,
    visit_detail_start_date date NOT NULL,
    visit_detail_start_datetime timestamp without time zone,
    visit_detail_end_date date NOT NULL,
    visit_detail_end_datetime timestamp without time zone,
    visit_detail_type_concept_id integer NOT NULL,
    provider_id integer,
    care_site_id integer,
    admitting_source_concept_id integer,
    discharge_to_concept_id integer,
    preceding_visit_detail_id integer,
    visit_detail_source_value character varying(50),
    visit_detail_source_concept_id integer,
    admitting_source_value character varying(50),
    discharge_to_source_value character varying(50),
    visit_detail_parent_id integer,
    visit_occurrence_id integer NOT NULL
);


ALTER TABLE baseline.visit_detail OWNER TO gony;

--
-- TOC entry 278 (class 1259 OID 25238)
-- Name: visit_occurrence; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.visit_occurrence (
    visit_occurrence_id integer NOT NULL,
    person_id integer NOT NULL,
    visit_concept_id integer NOT NULL,
    visit_start_date date NOT NULL,
    visit_start_datetime timestamp without time zone,
    visit_end_date date NOT NULL,
    visit_end_datetime timestamp without time zone,
    visit_type_concept_id integer NOT NULL,
    provider_id integer,
    care_site_id integer,
    visit_source_value character varying(50),
    visit_source_concept_id integer,
    admitting_source_concept_id integer,
    admitting_source_value character varying(50),
    discharge_to_concept_id integer,
    discharge_to_source_value character varying(50),
    preceding_visit_occurrence_id integer
);


ALTER TABLE baseline.visit_occurrence OWNER TO gony;

--
-- TOC entry 261 (class 1259 OID 25170)
-- Name: vocabulary; Type: TABLE; Schema: baseline; Owner: gony
--

CREATE TABLE baseline.vocabulary (
    vocabulary_id character varying(20) NOT NULL,
    vocabulary_name character varying(255) NOT NULL,
    vocabulary_reference character varying(255) NOT NULL,
    vocabulary_version character varying(255) NOT NULL,
    vocabulary_concept_id integer NOT NULL
);


ALTER TABLE baseline.vocabulary OWNER TO gony;

--
-- TOC entry 236 (class 1259 OID 24896)
-- Name: brcn_diag_afoc; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_diag_afoc (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    comp_ocrn_oprt_ymd character varying(8) NOT NULL,
    comp_ocrn_oprt_seq numeric(3,0) NOT NULL,
    comp_ocrn_ymd character varying(8),
    afoc_cont character varying(4000),
    comp_grcd character varying(20),
    comp_grnm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_diag_afoc OWNER TO gony;

--
-- TOC entry 4160 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE brcn_diag_afoc; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_diag_afoc IS '유방암_진단_수술후합병증';


--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.hosp_cd IS '병원코드';


--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.comp_ocrn_oprt_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.comp_ocrn_oprt_ymd IS '합병증발생수술일자';


--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.comp_ocrn_oprt_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.comp_ocrn_oprt_seq IS '합병증발생수술순번';


--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.comp_ocrn_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.comp_ocrn_ymd IS '합병증발생일자';


--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.afoc_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.afoc_cont IS '수술후합병증내용';


--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.comp_grcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.comp_grcd IS '합병증등급코드';


--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.comp_grnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.comp_grnm IS '합병증등급명';


--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN brcn_diag_afoc.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_afoc.crtn_dt IS '생성일시';


--
-- TOC entry 237 (class 1259 OID 24903)
-- Name: brcn_diag_aninf; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_diag_aninf (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    anth_rcrd_ymd character varying(8) NOT NULL,
    anth_rcrd_seq numeric(3,0) NOT NULL,
    ht_msrm_vl numeric(10,3),
    wt_msrm_vl numeric(10,3),
    bmi_vl numeric(10,3),
    rlxt_blpr_vl character varying(200),
    ctrt_blpr_vl character varying(200),
    ecog_cd character varying(20),
    ecog_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_diag_aninf OWNER TO gony;

--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE brcn_diag_aninf; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_diag_aninf IS '유방암_진단_신체계측정보';


--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.hosp_cd IS '병원코드';


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.anth_rcrd_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.anth_rcrd_ymd IS '신체계측기록일자';


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.anth_rcrd_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.anth_rcrd_seq IS '신체계측기록순번';


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.ht_msrm_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.ht_msrm_vl IS '신장측정값';


--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.wt_msrm_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.wt_msrm_vl IS '체중측정값';


--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.bmi_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.bmi_vl IS 'BMI값';


--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.rlxt_blpr_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.rlxt_blpr_vl IS '이완혈압값';


--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.ctrt_blpr_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.ctrt_blpr_vl IS '수축혈압값';


--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.ecog_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.ecog_cd IS 'ECOG코드';


--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.ecog_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.ecog_nm IS 'ECOG명';


--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN brcn_diag_aninf.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_aninf.crtn_dt IS '생성일시';


--
-- TOC entry 238 (class 1259 OID 24910)
-- Name: brcn_diag_inf; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_diag_inf (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    diag_rgst_ymd character varying(8) NOT NULL,
    diag_rgst_seq numeric(3,0) NOT NULL,
    brcn_diag_kncd character varying(20),
    brcn_diag_knnm character varying(200),
    diag_cd character varying(20),
    diag_nm character varying(300),
    diag_kcd_cd character varying(20),
    diag_kcd_nm character varying(200),
    diag_smct_cd character varying(200),
    diag_smct_nm character varying(1000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_diag_inf OWNER TO gony;

--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE brcn_diag_inf; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_diag_inf IS '유방암_진단_정보';


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.hosp_cd IS '병원코드';


--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_rgst_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_rgst_ymd IS '진단등록일자';


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_rgst_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_rgst_seq IS '진단등록순번';


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.brcn_diag_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.brcn_diag_kncd IS '유방암진단종류코드';


--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.brcn_diag_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.brcn_diag_knnm IS '유방암진단종류명';


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_cd IS '진단코드';


--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_nm IS '진단명';


--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_kcd_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_kcd_cd IS '진단KCD코드';


--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_kcd_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_kcd_nm IS '진단KCD명';


--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_smct_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_smct_cd IS '진단SNOMEDCT코드';


--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.diag_smct_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.diag_smct_nm IS '진단SNOMEDCT명';


--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN brcn_diag_inf.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_inf.crtn_dt IS '생성일시';


--
-- TOC entry 239 (class 1259 OID 24917)
-- Name: brcn_diag_mtst; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_diag_mtst (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    mtdg_ymd character varying(8) NOT NULL,
    mtdg_seq numeric(3,0) NOT NULL,
    mtst_site_cd character varying(20),
    mtst_site_nm character varying(200),
    mtst_aspt_cd character varying(20),
    mtst_aspt_nm character varying(200),
    mtdg_mtcd character varying(20),
    mtdg_mtnm character varying(200),
    mtst_trtm_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_diag_mtst OWNER TO gony;

--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE brcn_diag_mtst; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_diag_mtst IS '유방암_진단_전이';


--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.hosp_cd IS '병원코드';


--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtdg_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtdg_ymd IS '전이진단일자';


--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtdg_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtdg_seq IS '전이진단순번';


--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtst_site_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtst_site_cd IS '전이부위코드';


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtst_site_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtst_site_nm IS '전이부위명';


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtst_aspt_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtst_aspt_cd IS '전이양상코드';


--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtst_aspt_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtst_aspt_nm IS '전이양상명';


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtdg_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtdg_mtcd IS '전이진단방법코드';


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtdg_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtdg_mtnm IS '전이진단방법명';


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.mtst_trtm_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.mtst_trtm_cont IS '전이치료내용';


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN brcn_diag_mtst.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_mtst.crtn_dt IS '생성일시';


--
-- TOC entry 240 (class 1259 OID 24924)
-- Name: brcn_diag_stag; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_diag_stag (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    diag_stag_rcrd_ymd character varying(8) NOT NULL,
    diag_stag_rcrd_seq numeric(3,0) NOT NULL,
    clnc_tumr_prty_cd character varying(20),
    clnc_tumr_prty_nm character varying(200),
    ajcc_yr character varying(4),
    clnc_tnm_stag_vl character varying(200),
    clnc_t_stag_vl character varying(200),
    clnc_n_stag_vl character varying(200),
    clnc_m_stag_vl character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_diag_stag OWNER TO gony;

--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE brcn_diag_stag; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_diag_stag IS '유방암_진단_병기';


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.hosp_cd IS '병원코드';


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.diag_stag_rcrd_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.diag_stag_rcrd_ymd IS '진단병기기록일자';


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.diag_stag_rcrd_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.diag_stag_rcrd_seq IS '진단병기기록순번';


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.clnc_tumr_prty_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.clnc_tumr_prty_cd IS '임상종양특성코드';


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.clnc_tumr_prty_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.clnc_tumr_prty_nm IS '임상종양특성명';


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.ajcc_yr; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.ajcc_yr IS 'AJCC년도';


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.clnc_tnm_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.clnc_tnm_stag_vl IS '임상TNM병기값';


--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.clnc_t_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.clnc_t_stag_vl IS '임상T병기값';


--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.clnc_n_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.clnc_n_stag_vl IS '임상N병기값';


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.clnc_m_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.clnc_m_stag_vl IS '임상M병기값';


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN brcn_diag_stag.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_diag_stag.crtn_dt IS '생성일시';


--
-- TOC entry 241 (class 1259 OID 24931)
-- Name: brcn_exam_byps; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_byps (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    bpsy_ymd character varying(8) NOT NULL,
    bpsy_seq numeric(3,0) NOT NULL,
    bpsy_read_ymd character varying(8),
    bpsy_site_cd character varying(20),
    bpsy_site_nm character varying(200),
    bpsy_site_latr_cd character varying(20),
    bpsy_site_latr_nm character varying(200),
    bpsy_mtcd character varying(20),
    bpsy_mtnm character varying(200),
    bpsy_mthd_kncd character varying(20),
    bpsy_mthd_knnm character varying(200),
    bpsy_rslt_cont character varying(4000),
    htlg_diag_cd character varying(20),
    htlg_diag_nm character varying(200),
    htlg_grcd character varying(20),
    htlg_grnm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_byps OWNER TO gony;

--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE brcn_exam_byps; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_byps IS '유방암_검사_생체';


--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.hosp_cd IS '병원코드';


--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_ymd IS '생체검사일자';


--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_seq IS '생체검사순번';


--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_read_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_read_ymd IS '생체검사판독일자';


--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_site_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_site_cd IS '생체검사부위코드';


--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_site_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_site_nm IS '생체검사부위명';


--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_site_latr_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_site_latr_cd IS '생체검사부위편측성코드';


--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_site_latr_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_site_latr_nm IS '생체검사부위편측성명';


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_mtcd IS '생체검사방법코드';


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_mtnm IS '생체검사방법명';


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_mthd_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_mthd_kncd IS '생체검사방법종류코드';


--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_mthd_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_mthd_knnm IS '생체검사방법종류명';


--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.bpsy_rslt_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.bpsy_rslt_cont IS '생체검사결과내용';


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.htlg_diag_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.htlg_diag_cd IS '조직학적진단코드';


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.htlg_diag_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.htlg_diag_nm IS '조직학적진단명';


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.htlg_grcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.htlg_grcd IS '조직학적등급코드';


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.htlg_grnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.htlg_grnm IS '조직학적등급명';


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN brcn_exam_byps.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_byps.crtn_dt IS '생성일시';


--
-- TOC entry 242 (class 1259 OID 24938)
-- Name: brcn_exam_diag; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_diag (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    cexm_ymd character varying(8) NOT NULL,
    cexm_seq numeric(3,0) NOT NULL,
    cexm_kncd character varying(20),
    cexm_knnm character varying(200),
    cexm_cd character varying(20),
    cexm_nm character varying(200),
    cexm_edi_cd character varying(20),
    cexm_edi_nm character varying(200),
    cexm_smct_cd character varying(200),
    cexm_smct_nm character varying(1000),
    cexm_loinc_cd character varying(20),
    cexm_loinc_nm character varying(1000),
    cexm_rslt_cont character varying(4000),
    cexm_rslt_unit_cont character varying(4000),
    cexm_nlrg_ref_vl character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_diag OWNER TO gony;

--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE brcn_exam_diag; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_diag IS '유방암_검사_진단';


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.hosp_cd IS '병원코드';


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_ymd IS '진단검사일자';


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_seq IS '진단검사순번';


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_kncd IS '진단검사종류코드';


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_knnm IS '진단검사종류명';


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_cd IS '진단검사코드';


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_nm IS '진단검사명';


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_edi_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_edi_cd IS '진단검사EDI코드';


--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_edi_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_edi_nm IS '진단검사EDI명';


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_smct_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_smct_cd IS '진단검사SNOMEDCT코드';


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_smct_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_smct_nm IS '진단검사SNOMEDCT명';


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_loinc_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_loinc_cd IS '진단검사LOINC코드';


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_loinc_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_loinc_nm IS '진단검사LOINC명';


--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_rslt_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_rslt_cont IS '진단검사결과내용';


--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_rslt_unit_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_rslt_unit_cont IS '진단검사결과단위내용';


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.cexm_nlrg_ref_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.cexm_nlrg_ref_vl IS '진단검사정상범위참고값';


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN brcn_exam_diag.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_diag.crtn_dt IS '생성일시';


--
-- TOC entry 243 (class 1259 OID 24945)
-- Name: brcn_exam_gmvx; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_gmvx (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    gmvx_ymd character varying(8) NOT NULL,
    gmvx_seq numeric(3,0) NOT NULL,
    gmvx_cd character varying(20),
    gmvx_nm character varying(200),
    gmvx_mtcd character varying(20),
    gmvx_mtnm character varying(200),
    gmvx_gene_kncd character varying(20),
    gmvx_gene_knnm character varying(200),
    gmte_mtst_exam_rslt_cont character varying(4000),
    pavr_detect_yn_spcd character varying(20),
    pavr_detect_yn_spnm character varying(50),
    uncl_varnt_detect_yn_spcd character varying(20),
    uncl_varnt_detect_yn_spnm character varying(50),
    dna_vainf_a_vl character varying(200),
    dna_vainf_b_cd character varying(20),
    dna_vainf_b_nm character varying(200),
    dna_vainf_c_cd character varying(20),
    dna_vainf_c_nm character varying(200),
    amsn_vainf_a_cd character varying(20),
    amsn_vainf_a_nm character varying(200),
    amsn_vainf_b_vl numeric(10,3),
    amsn_vainf_c_cd character varying(20),
    amsn_vainf_c_nm character varying(200),
    ref_seq character varying(20),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_gmvx OWNER TO gony;

--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE brcn_exam_gmvx; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_gmvx IS '유방암_검사_생식세포변이검사';


--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.hosp_cd IS '병원코드';


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_ymd IS '생식세포변이검사일자';


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_seq IS '생식세포변이검사순번';


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_cd IS '생식세포변이검사코드';


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_nm IS '생식세포변이검사명';


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_mtcd IS '생식세포변이검사방법코드';


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_mtnm IS '생식세포변이검사방법명';


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_gene_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_gene_kncd IS '생식세포변이검사유전자종류코드';


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmvx_gene_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmvx_gene_knnm IS '생식세포변이검사유전자종류명';


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.gmte_mtst_exam_rslt_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.gmte_mtst_exam_rslt_cont IS '생식세포전이검사결과내용';


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.pavr_detect_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.pavr_detect_yn_spcd IS '병원변형체감지여부구분코드';


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.pavr_detect_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.pavr_detect_yn_spnm IS '병원변형체감지여부구분명';


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.uncl_varnt_detect_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.uncl_varnt_detect_yn_spcd IS '미확인변형체감지여부구분코드';


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.uncl_varnt_detect_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.uncl_varnt_detect_yn_spnm IS '미확인변형체감지여부구분명';


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.dna_vainf_a_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.dna_vainf_a_vl IS 'DNA변이정보A값';


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.dna_vainf_b_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.dna_vainf_b_cd IS 'DNA변이정보B코드';


--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.dna_vainf_b_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.dna_vainf_b_nm IS 'DNA변이정보B명';


--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.dna_vainf_c_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.dna_vainf_c_cd IS 'DNA변이정보C코드';


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.dna_vainf_c_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.dna_vainf_c_nm IS 'DNA변이정보C명';


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.amsn_vainf_a_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.amsn_vainf_a_cd IS '아미노산변이정보A코드';


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.amsn_vainf_a_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.amsn_vainf_a_nm IS '아미노산변이정보A명';


--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.amsn_vainf_b_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.amsn_vainf_b_vl IS '아미노산변이정보B값';


--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.amsn_vainf_c_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.amsn_vainf_c_cd IS '아미노산변이정보C코드';


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.amsn_vainf_c_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.amsn_vainf_c_nm IS '아미노산변이정보C명';


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.ref_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.ref_seq IS '참고순번';


--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN brcn_exam_gmvx.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gmvx.crtn_dt IS '생성일시';


--
-- TOC entry 244 (class 1259 OID 24952)
-- Name: brcn_exam_gnrx; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_gnrx (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    gnrx_ymd character varying(8) NOT NULL,
    gnrx_seq numeric(3,0) NOT NULL,
    gnrx_kncd character varying(20),
    gnrx_knnm character varying(200),
    gnrx_rslt_kncd character varying(20),
    gnrx_rslt_knnm character varying(200),
    gnrx_rslt_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_gnrx OWNER TO gony;

--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE brcn_exam_gnrx; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_gnrx IS '유방암_검사_유전자발현검사';


--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.hosp_cd IS '병원코드';


--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.gnrx_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.gnrx_ymd IS '유전자발현검사일자';


--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.gnrx_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.gnrx_seq IS '유전자발현검사순번';


--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.gnrx_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.gnrx_kncd IS '유전자발현검사종류코드';


--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.gnrx_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.gnrx_knnm IS '유전자발현검사종류명';


--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.gnrx_rslt_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.gnrx_rslt_kncd IS '유전자발현검사결과종류코드';


--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.gnrx_rslt_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.gnrx_rslt_knnm IS '유전자발현검사결과종류명';


--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.gnrx_rslt_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.gnrx_rslt_cont IS '유전자발현검사결과내용';


--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN brcn_exam_gnrx.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_gnrx.crtn_dt IS '생성일시';


--
-- TOC entry 245 (class 1259 OID 24959)
-- Name: brcn_exam_imag; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_imag (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    imex_ymd character varying(8) NOT NULL,
    imex_seq numeric(3,0) NOT NULL,
    imex_kncd character varying(20),
    imex_knnm character varying(200),
    imex_cd character varying(20),
    imex_nm character varying(200),
    imex_edi_cd character varying(20),
    imex_edi_nm character varying(300),
    imex_smct_cd character varying(200),
    imex_smct_nm character varying(1000),
    imex_rslt_cont character varying(4000),
    brst_dens_clcd character varying(20),
    brst_dens_clnm character varying(200),
    imex_rslt_diag_clcd character varying(20),
    imex_rslt_diag_clnm character varying(200),
    micf_yn_unid_spcd character varying(20),
    micf_yn_unid_spnm character varying(50),
    asyt_yn_unid_spcd character varying(20),
    asyt_yn_unid_spnm character varying(50),
    boms_yn_unid_spcd character varying(20),
    boms_yn_unid_spnm character varying(50),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_imag OWNER TO gony;

--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE brcn_exam_imag; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_imag IS '유방암_검사_영상';


--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.hosp_cd IS '병원코드';


--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_ymd IS '영상검사일자';


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_seq IS '영상검사순번';


--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_kncd IS '영상검사종류코드';


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_knnm IS '영상검사종류명';


--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_cd IS '영상검사코드';


--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_nm IS '영상검사명';


--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_edi_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_edi_cd IS '영상검사EDI코드';


--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_edi_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_edi_nm IS '영상검사EDI명';


--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_smct_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_smct_cd IS '영상검사SNOMEDCT코드';


--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_smct_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_smct_nm IS '영상검사SNOMEDCT명';


--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_rslt_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_rslt_cont IS '영상검사결과내용';


--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.brst_dens_clcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.brst_dens_clcd IS '유방밀도분류코드';


--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.brst_dens_clnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.brst_dens_clnm IS '유방밀도분류명';


--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_rslt_diag_clcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_rslt_diag_clcd IS '영상검사결과진단분류코드';


--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.imex_rslt_diag_clnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.imex_rslt_diag_clnm IS '영상검사결과진단분류명';


--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.micf_yn_unid_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.micf_yn_unid_spcd IS '미세석회화여부확인불가구분코드';


--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.micf_yn_unid_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.micf_yn_unid_spnm IS '미세석회화여부확인불가구분명';


--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.asyt_yn_unid_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.asyt_yn_unid_spcd IS '비대칭여부확인불가구분코드';


--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.asyt_yn_unid_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.asyt_yn_unid_spnm IS '비대칭여부확인불가구분명';


--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.boms_yn_unid_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.boms_yn_unid_spcd IS '전신전이여부확인불가구분코드';


--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.boms_yn_unid_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.boms_yn_unid_spnm IS '전신전이여부확인불가구분명';


--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN brcn_exam_imag.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_imag.crtn_dt IS '생성일시';


--
-- TOC entry 246 (class 1259 OID 24966)
-- Name: brcn_exam_impt; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_impt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    imem_ymd character varying(8) NOT NULL,
    imem_seq numeric(3,0) NOT NULL,
    impt_read_ymd character varying(8),
    imem_kncd character varying(20),
    imem_knnm character varying(200),
    imem_nm character varying(200),
    imem_cd character varying(20),
    imem_opn_clcd character varying(20),
    imem_opn_clnm character varying(200),
    imem_rslt_vl character varying(200),
    imem_rslt_unit_cd character varying(20),
    imem_rslt_unit_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_impt OWNER TO gony;

--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE brcn_exam_impt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_impt IS '유방암_검사_면역병리';


--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.hosp_cd IS '병원코드';


--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_ymd IS '면역병리검사일자';


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_seq IS '면역병리검사순번';


--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.impt_read_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.impt_read_ymd IS '면역병리판독일자';


--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_kncd IS '면역병리검사종류코드';


--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_knnm IS '면역병리검사종류명';


--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_nm IS '면역병리검사명';


--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_cd IS '면역병리검사코드';


--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_opn_clcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_opn_clcd IS '면역병리검사소견분류코드';


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_opn_clnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_opn_clnm IS '면역병리검사소견분류명';


--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_rslt_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_rslt_vl IS '면역병리검사결과값';


--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_rslt_unit_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_rslt_unit_cd IS '면역병리검사결과단위코드';


--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.imem_rslt_unit_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.imem_rslt_unit_nm IS '면역병리검사결과단위명';


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN brcn_exam_impt.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_impt.crtn_dt IS '생성일시';


--
-- TOC entry 247 (class 1259 OID 24973)
-- Name: brcn_exam_mlpt; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_mlpt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    mlem_ymd character varying(8) NOT NULL,
    mlem_seq numeric(3,0) NOT NULL,
    mlpt_read_ymd character varying(8),
    mlem_cd character varying(20),
    mlem_nm character varying(200),
    mlem_kncd character varying(20),
    mlem_knnm character varying(200),
    mlem_mtcd character varying(20),
    mlem_mtnm character varying(200),
    mlem_rslt_cd character varying(20),
    mlem_rslt_nm character varying(200),
    mlem_rslt_kncd character varying(20),
    mlem_rslt_knnm character varying(200),
    mlem_rslt_vl character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_mlpt OWNER TO gony;

--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE brcn_exam_mlpt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_mlpt IS '유방암_검사_분자병리';


--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.hosp_cd IS '병원코드';


--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_ymd IS '분자병리검사일자';


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_seq IS '분자병리검사순번';


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlpt_read_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlpt_read_ymd IS '분자병리판독일자';


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_cd IS '분자병리검사코드';


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_nm IS '분자병리검사명';


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_kncd IS '분자병리검사종류코드';


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_knnm IS '분자병리검사종류명';


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_mtcd IS '분자병리검사방법코드';


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_mtnm IS '분자병리검사방법명';


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_rslt_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_rslt_cd IS '분자병리검사결과코드';


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_rslt_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_rslt_nm IS '분자병리검사결과명';


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_rslt_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_rslt_kncd IS '분자병리검사결과종류코드';


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_rslt_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_rslt_knnm IS '분자병리검사결과종류명';


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.mlem_rslt_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.mlem_rslt_vl IS '분자병리검사결과값';


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN brcn_exam_mlpt.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_mlpt.crtn_dt IS '생성일시';


--
-- TOC entry 248 (class 1259 OID 24980)
-- Name: brcn_exam_sgpt; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_exam_sgpt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    srgc_ptem_ymd character varying(8) NOT NULL,
    srgc_ptem_seq numeric(3,0) NOT NULL,
    sgpt_read_ymd character varying(8),
    sgpt_hvst_site_cd character varying(20),
    sgpt_hvst_site_nm character varying(200),
    sgpt_exam_site_latr_cd character varying(20),
    sgpt_exam_site_latr_nm character varying(200),
    srgc_ptem_rslt_tumr_cnt numeric(3,0),
    tumr_wdth_lnth_vl numeric(10,3),
    tumr_lgtd_lnth_vl numeric(10,3),
    tumr_hght_vl numeric(10,3),
    tumr_max_diam_vl numeric(10,3),
    htlg_diag_cd character varying(20),
    htlg_diag_nm character varying(200),
    htlg_grcd character varying(20),
    htlg_grnm character varying(200),
    lvin_ex_yn_spcd character varying(20),
    lvin_ex_yn_spnm character varying(50),
    lpin_ex_yn_spcd character varying(20),
    lpin_ex_yn_spnm character varying(50),
    niin_ex_yn_spcd character varying(20),
    niin_ex_yn_spnm character varying(50),
    sgpt_micf_ex_yn_spcd character varying(20),
    sgpt_micf_ex_yn_spnm character varying(50),
    incn_necr_ex_yn_spcd character varying(20),
    incn_necr_ex_yn_spnm character varying(50),
    incn_asso_ex_yn_spcd character varying(20),
    incn_asso_ex_yn_spnm character varying(50),
    incn_core_grcd character varying(20),
    incn_core_grnm character varying(200),
    srmg_sfmg_lnth_vl numeric(10,3),
    srmg_detl_cont character varying(4000),
    srmg_rlct_cd character varying(20),
    srmg_rlct_nm character varying(200),
    mtcr_size_vl numeric(10,3),
    asso_lesn_cd character varying(20),
    asso_lesn_nm character varying(200),
    resi_tumr_cd character varying(20),
    resi_tumr_nm character varying(200),
    ln_totl_cnt numeric(3,0),
    pstv_ln_cnt character varying(100),
    slnd_totl_cnt numeric(3,0),
    pstv_slnd_cnt numeric(3,0),
    nsnd_totl_cnt numeric(3,0),
    pstv_nsnd_cnt numeric(3,0),
    ajcc_yr character varying(4),
    afop_path_tnm_stag_vl character varying(200),
    afop_path_t_stag_vl character varying(200),
    afop_path_n_stag_vl character varying(200),
    afop_path_m_stag_vl character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_exam_sgpt OWNER TO gony;

--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE brcn_exam_sgpt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_exam_sgpt IS '유방암_검사_외과병리';


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.hosp_cd IS '병원코드';


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.srgc_ptem_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.srgc_ptem_ymd IS '외과병리검사일자';


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.srgc_ptem_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.srgc_ptem_seq IS '외과병리검사순번';


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.sgpt_read_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.sgpt_read_ymd IS '외과병리판독일자';


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.sgpt_hvst_site_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.sgpt_hvst_site_cd IS '외과병리채취부위코드';


--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.sgpt_hvst_site_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.sgpt_hvst_site_nm IS '외과병리채취부위명';


--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.sgpt_exam_site_latr_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.sgpt_exam_site_latr_cd IS '외과병리검사부위편측성코드';


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.sgpt_exam_site_latr_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.sgpt_exam_site_latr_nm IS '외과병리검사부위편측성명';


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.srgc_ptem_rslt_tumr_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.srgc_ptem_rslt_tumr_cnt IS '외과병리검사결과종양수';


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.tumr_wdth_lnth_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.tumr_wdth_lnth_vl IS '종양가로길이값';


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.tumr_lgtd_lnth_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.tumr_lgtd_lnth_vl IS '종양세로길이값';


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.tumr_hght_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.tumr_hght_vl IS '종양높이값';


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.tumr_max_diam_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.tumr_max_diam_vl IS '종양최대직경값';


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.htlg_diag_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.htlg_diag_cd IS '조직학적진단코드';


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.htlg_diag_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.htlg_diag_nm IS '조직학적진단명';


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.htlg_grcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.htlg_grcd IS '조직학적등급코드';


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.htlg_grnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.htlg_grnm IS '조직학적등급명';


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.lvin_ex_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.lvin_ex_yn_spcd IS '림프혈관침윤존재여부구분코드';


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.lvin_ex_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.lvin_ex_yn_spnm IS '림프혈관침윤존재여부구분명';


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.lpin_ex_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.lpin_ex_yn_spcd IS '림프절주위침윤존재여부구분코드';


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.lpin_ex_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.lpin_ex_yn_spnm IS '림프절주위침윤존재여부구분명';


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.niin_ex_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.niin_ex_yn_spcd IS '유두침윤존재여부구분코드';


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.niin_ex_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.niin_ex_yn_spnm IS '유두침윤존재여부구분명';


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.sgpt_micf_ex_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.sgpt_micf_ex_yn_spcd IS '외과병리미세석회화존재여부구분코드';


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.sgpt_micf_ex_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.sgpt_micf_ex_yn_spnm IS '외과병리미세석회화존재여부구분명';


--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.incn_necr_ex_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.incn_necr_ex_yn_spcd IS '상피내암괴사존재여부구분코드';


--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.incn_necr_ex_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.incn_necr_ex_yn_spnm IS '상피내암괴사존재여부구분명';


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.incn_asso_ex_yn_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.incn_asso_ex_yn_spcd IS '상피내암동반존재여부구분코드';


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.incn_asso_ex_yn_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.incn_asso_ex_yn_spnm IS '상피내암동반존재여부구분명';


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.incn_core_grcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.incn_core_grcd IS '상피내암핵등급코드';


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.incn_core_grnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.incn_core_grnm IS '상피내암핵등급명';


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.srmg_sfmg_lnth_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.srmg_sfmg_lnth_vl IS '수술절제면안전경계길이값';


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.srmg_detl_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.srmg_detl_cont IS '수술절제면상세내용';


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.srmg_rlct_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.srmg_rlct_cd IS '수술절제면잔존코드';


--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.srmg_rlct_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.srmg_rlct_nm IS '수술절제면잔존명';


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.mtcr_size_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.mtcr_size_vl IS '전이암크기값';


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.asso_lesn_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.asso_lesn_cd IS '동반병변코드';


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.asso_lesn_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.asso_lesn_nm IS '동반병변명';


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.resi_tumr_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.resi_tumr_cd IS '잔여종양코드';


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.resi_tumr_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.resi_tumr_nm IS '잔여종양명';


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.ln_totl_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.ln_totl_cnt IS '림프절총수';


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.pstv_ln_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.pstv_ln_cnt IS '양성림프절수';


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.slnd_totl_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.slnd_totl_cnt IS '감시림프절총수';


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.pstv_slnd_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.pstv_slnd_cnt IS '양성감시림프절수';


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.nsnd_totl_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.nsnd_totl_cnt IS '비감시림프절총수';


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.pstv_nsnd_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.pstv_nsnd_cnt IS '양성비감시림프절수';


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.ajcc_yr; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.ajcc_yr IS 'AJCC년도';


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.afop_path_tnm_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.afop_path_tnm_stag_vl IS '수술후병리TNM병기값';


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.afop_path_t_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.afop_path_t_stag_vl IS '수술후병리T병기값';


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.afop_path_n_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.afop_path_n_stag_vl IS '수술후병리N병기값';


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.afop_path_m_stag_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.afop_path_m_stag_vl IS '수술후병리M병기값';


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN brcn_exam_sgpt.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_exam_sgpt.crtn_dt IS '생성일시';


--
-- TOC entry 249 (class 1259 OID 24987)
-- Name: brcn_fuor_rlps; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_fuor_rlps (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    rldg_ymd character varying(8) NOT NULL,
    rldg_seq numeric(3,0) NOT NULL,
    rlps_site_cd character varying(20),
    rlps_site_nm character varying(200),
    rlps_trtm_cont character varying(4000),
    rldg_mtcd character varying(20),
    rldg_mtnm character varying(200),
    rlps_kncd character varying(20),
    rlps_knnm character varying(200),
    rlps_sym_cd character varying(20),
    rlps_sym_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_fuor_rlps OWNER TO gony;

--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE brcn_fuor_rlps; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_fuor_rlps IS '유방암_추적관찰_재발';


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.hosp_cd IS '병원코드';


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rldg_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rldg_ymd IS '재발진단일자';


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rldg_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rldg_seq IS '재발진단순번';


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rlps_site_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rlps_site_cd IS '재발부위코드';


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rlps_site_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rlps_site_nm IS '재발부위명';


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rlps_trtm_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rlps_trtm_cont IS '재발치료내용';


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rldg_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rldg_mtcd IS '재발진단방법코드';


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rldg_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rldg_mtnm IS '재발진단방법명';


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rlps_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rlps_kncd IS '재발종류코드';


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rlps_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rlps_knnm IS '재발종류명';


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rlps_sym_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rlps_sym_cd IS '재발증상코드';


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.rlps_sym_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.rlps_sym_nm IS '재발증상명';


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN brcn_fuor_rlps.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_fuor_rlps.crtn_dt IS '생성일시';


--
-- TOC entry 250 (class 1259 OID 24994)
-- Name: brcn_pt_fmht; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_pt_fmht (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    fmht_rcrd_ymd character varying(8) NOT NULL,
    fmht_rcrd_seq numeric(3,0) NOT NULL,
    fmht_yn_noans_spcd character varying(20),
    fmht_yn_noans_spnm character varying(50),
    pt_fm_rlcd character varying(20),
    pt_fm_rlnm character varying(200),
    pt_fmrl_etc_cont character varying(4000),
    fmhs_htn_yn_noans_spcd character varying(20),
    fmhs_htn_yn_noans_spnm character varying(50),
    fmhs_dbt_yn_noans_spcd character varying(20),
    fmhs_dbt_yn_noans_spnm character varying(50),
    fmht_tb_yn_noans_spcd character varying(20),
    fmht_tb_yn_noans_spnm character varying(50),
    fmhs_lvds_yn_noans_spcd character varying(20),
    fmhs_lvds_yn_noans_spnm character varying(50),
    fmhs_cncr_yn_noans_spcd character varying(20),
    fmhs_cncr_yn_noans_spnm character varying(50),
    fmht_cncr_kncd character varying(20),
    fmht_cncr_knnm character varying(200),
    fmht_cncr_kind_etc_cont character varying(4000),
    fmhs_etc_yn_noans_spcd character varying(20),
    fmhs_etc_yn_noans_spnm character varying(50),
    fmhs_etc_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_pt_fmht OWNER TO gony;

--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE brcn_pt_fmht; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_pt_fmht IS '유방암_환자_가족력';


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.hosp_cd IS '병원코드';


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_rcrd_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_rcrd_ymd IS '가족력기록일자';


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_rcrd_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_rcrd_seq IS '가족력기록순번';


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_yn_noans_spcd IS '가족력여부무응답구분코드';


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_yn_noans_spnm IS '가족력여부무응답구분명';


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.pt_fm_rlcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.pt_fm_rlcd IS '환자가족관계코드';


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.pt_fm_rlnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.pt_fm_rlnm IS '환자가족관계명';


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.pt_fmrl_etc_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.pt_fmrl_etc_cont IS '환자가족관계기타내용';


--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_htn_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_htn_yn_noans_spcd IS '가족병력고혈압여부무응답구분코드';


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_htn_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_htn_yn_noans_spnm IS '가족병력고혈압여부무응답구분명';


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_dbt_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_dbt_yn_noans_spcd IS '가족병력당뇨여부무응답구분코드';


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_dbt_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_dbt_yn_noans_spnm IS '가족병력당뇨여부무응답구분명';


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_tb_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_tb_yn_noans_spcd IS '가족력결핵여부무응답구분코드';


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_tb_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_tb_yn_noans_spnm IS '가족력결핵여부무응답구분명';


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_lvds_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_lvds_yn_noans_spcd IS '가족병력간질환여부무응답구분코드';


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_lvds_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_lvds_yn_noans_spnm IS '가족병력간질환여부무응답구분명';


--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_cncr_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_cncr_yn_noans_spcd IS '가족병력암여부무응답구분코드';


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_cncr_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_cncr_yn_noans_spnm IS '가족병력암여부무응답구분명';


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_cncr_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_cncr_kncd IS '가족력암종류코드';


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_cncr_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_cncr_knnm IS '가족력암종류명';


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmht_cncr_kind_etc_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmht_cncr_kind_etc_cont IS '가족력암종류기타내용';


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_etc_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_etc_yn_noans_spcd IS '가족병력기타여부무응답구분코드';


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_etc_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_etc_yn_noans_spnm IS '가족병력기타여부무응답구분명';


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.fmhs_etc_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.fmhs_etc_cont IS '가족병력기타내용';


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN brcn_pt_fmht.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_fmht.crtn_dt IS '생성일시';


--
-- TOC entry 251 (class 1259 OID 25001)
-- Name: brcn_pt_hlinf; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_pt_hlinf (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    adm_ymd character varying(8) NOT NULL,
    hlinf_seq numeric(3,0) NOT NULL,
    dsch_ymd character varying(8),
    cur_drnk_yn_noans_spcd character varying(20),
    cur_drnk_yn_noans_spnm character varying(50),
    dhis_yn_noans_spcd character varying(20),
    dhis_yn_noans_spnm character varying(50),
    drnk_strt_age_vl character varying(100),
    drnk_kncd character varying(20),
    drnk_knnm character varying(200),
    drnk_qty character varying(100),
    drnk_nt character varying(100),
    drnk_dtrn_ycnt character varying(100),
    ndrk_strt_yr character varying(4),
    cur_smok_yn_noans_spcd character varying(20),
    cur_smok_yn_noans_spnm character varying(50),
    shis_yn_noans_spcd character varying(20),
    shis_yn_noans_spnm character varying(50),
    smok_strt_age_vl character varying(100),
    smok_qty character varying(200),
    smok_dtrn_ycnt character varying(100),
    nsmk_strt_yr character varying(4),
    mhis_yn_noans_spcd character varying(20),
    mhis_yn_noans_spnm character varying(50),
    mhis_htn_yn_noans_spcd character varying(20),
    mhis_htn_yn_noans_spnm character varying(50),
    mhis_dbt_yn_noans_spcd character varying(20),
    mhis_dbt_yn_noans_spnm character varying(50),
    mhis_tb_yn_noans_spcd character varying(20),
    mhis_tb_yn_noans_spnm character varying(50),
    mhis_lvds_yn_noans_spcd character varying(20),
    mhis_lvds_yn_noans_spnm character varying(50),
    mhis_hl_yn_noans_spcd character varying(20),
    mhis_hl_yn_noans_spnm character varying(50),
    mhis_cncr_yn_noans_spcd character varying(20),
    mhis_cncr_yn_noans_spnm character varying(50),
    mhis_cncr_kncd character varying(20),
    mhis_cncr_knnm character varying(200),
    mhis_depr_yn_noans_spcd character varying(20),
    mhis_depr_yn_noans_spnm character varying(50),
    mhis_insm_yn_noans_spcd character varying(20),
    mhis_insm_yn_noans_spnm character varying(50),
    mhis_cads_yn_noans_spcd character varying(20),
    mhis_cads_yn_noans_spnm character varying(50),
    etc_mhis_yn_noans_spcd character varying(20),
    etc_mhis_yn_noans_spnm character varying(50),
    etc_mhis_diss_cont character varying(4000),
    main_sym_yn_noans_spcd character varying(20),
    main_sym_yn_noans_spnm character varying(50),
    main_sym_cont character varying(4000),
    ohad_hstr_yn_noans_spcd character varying(20),
    ohad_hstr_yn_noans_spnm character varying(50),
    dsch_stcd character varying(20),
    dsch_stnm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_pt_hlinf OWNER TO gony;

--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE brcn_pt_hlinf; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_pt_hlinf IS '유방암_환자_건강정보';


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.hosp_cd IS '병원코드';


--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.adm_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.adm_ymd IS '입원일자';


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.hlinf_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.hlinf_seq IS '건강정보순번';


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.dsch_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.dsch_ymd IS '퇴원일자';


--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.cur_drnk_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.cur_drnk_yn_noans_spcd IS '현재음주여부무응답구분코드';


--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.cur_drnk_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.cur_drnk_yn_noans_spnm IS '현재음주여부무응답구분명';


--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.dhis_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.dhis_yn_noans_spcd IS '음주력여부무응답구분코드';


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.dhis_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.dhis_yn_noans_spnm IS '음주력여부무응답구분명';


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.drnk_strt_age_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.drnk_strt_age_vl IS '음주시작연령값';


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.drnk_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.drnk_kncd IS '음주종류코드';


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.drnk_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.drnk_knnm IS '음주종류명';


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.drnk_qty; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.drnk_qty IS '음주량';


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.drnk_nt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.drnk_nt IS '음주횟수';


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.drnk_dtrn_ycnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.drnk_dtrn_ycnt IS '음주기간년수';


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.ndrk_strt_yr; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.ndrk_strt_yr IS '금주시작년도';


--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.cur_smok_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.cur_smok_yn_noans_spcd IS '현재흡연여부무응답구분코드';


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.cur_smok_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.cur_smok_yn_noans_spnm IS '현재흡연여부무응답구분명';


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.shis_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.shis_yn_noans_spcd IS '흡연력여부무응답구분코드';


--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.shis_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.shis_yn_noans_spnm IS '흡연력여부무응답구분명';


--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.smok_strt_age_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.smok_strt_age_vl IS '흡연시작연령값';


--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.smok_qty; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.smok_qty IS '흡연량';


--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.smok_dtrn_ycnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.smok_dtrn_ycnt IS '흡연기간년수';


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.nsmk_strt_yr; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.nsmk_strt_yr IS '금연시작년도';


--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_yn_noans_spcd IS '병력여부무응답구분코드';


--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_yn_noans_spnm IS '병력여부무응답구분명';


--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_htn_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_htn_yn_noans_spcd IS '병력고혈압여부무응답구분코드';


--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_htn_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_htn_yn_noans_spnm IS '병력고혈압여부무응답구분명';


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_dbt_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_dbt_yn_noans_spcd IS '병력당뇨여부무응답구분코드';


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_dbt_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_dbt_yn_noans_spnm IS '병력당뇨여부무응답구분명';


--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_tb_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_tb_yn_noans_spcd IS '병력결핵여부무응답구분코드';


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_tb_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_tb_yn_noans_spnm IS '병력결핵여부무응답구분명';


--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_lvds_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_lvds_yn_noans_spcd IS '병력간질환여부무응답구분코드';


--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_lvds_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_lvds_yn_noans_spnm IS '병력간질환여부무응답구분명';


--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_hl_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_hl_yn_noans_spcd IS '병력고지혈증여부무응답구분코드';


--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_hl_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_hl_yn_noans_spnm IS '병력고지혈증여부무응답구분명';


--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_cncr_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_cncr_yn_noans_spcd IS '병력암여부무응답구분코드';


--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_cncr_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_cncr_yn_noans_spnm IS '병력암여부무응답구분명';


--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_cncr_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_cncr_kncd IS '병력암종류코드';


--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_cncr_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_cncr_knnm IS '병력암종류명';


--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_depr_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_depr_yn_noans_spcd IS '병력우울증여부무응답구분코드';


--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_depr_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_depr_yn_noans_spnm IS '병력우울증여부무응답구분명';


--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_insm_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_insm_yn_noans_spcd IS '병력불면증여부무응답구분코드';


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_insm_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_insm_yn_noans_spnm IS '병력불면증여부무응답구분명';


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_cads_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_cads_yn_noans_spcd IS '병력심장질환여부무응답구분코드';


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.mhis_cads_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.mhis_cads_yn_noans_spnm IS '병력심장질환여부무응답구분명';


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.etc_mhis_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.etc_mhis_yn_noans_spcd IS '기타병력여부무응답구분코드';


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.etc_mhis_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.etc_mhis_yn_noans_spnm IS '기타병력여부무응답구분명';


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.etc_mhis_diss_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.etc_mhis_diss_cont IS '기타병력질환내용';


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.main_sym_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.main_sym_yn_noans_spcd IS '주증상여부무응답구분코드';


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.main_sym_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.main_sym_yn_noans_spnm IS '주증상여부무응답구분명';


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.main_sym_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.main_sym_cont IS '주증상내용';


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.ohad_hstr_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.ohad_hstr_yn_noans_spcd IS '타병원진단후전원여부무응답구분코드';


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.ohad_hstr_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.ohad_hstr_yn_noans_spnm IS '타병원진단후전원여부무응답구분명';


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.dsch_stcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.dsch_stcd IS '퇴원상태코드';


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.dsch_stnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.dsch_stnm IS '퇴원상태명';


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN brcn_pt_hlinf.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_hlinf.crtn_dt IS '생성일시';


--
-- TOC entry 252 (class 1259 OID 25008)
-- Name: brcn_pt_obinf; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_pt_obinf (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    obtr_rcrd_ymd character varying(8) NOT NULL,
    obtr_rcrd_seq numeric(3,0) NOT NULL,
    marg_yn_noans_spcd character varying(20),
    marg_yn_noans_spnm character varying(50),
    marg_detl_cd character varying(20),
    marg_detl_nm character varying(200),
    hrpr_yn_noans_spcd character varying(20),
    hrpr_yn_noans_spnm character varying(50),
    hrt_impl_mcnt numeric(3,0),
    mena_age_vl numeric(4,0),
    delv_age_vl numeric(4,0),
    delv_chld_cnt numeric(3,0),
    bfpr_yn_noans_spcd character varying(20),
    bfpr_yn_noans_spnm character varying(50),
    brfd_mcnt numeric(3,0),
    oc_use_yn_noans_spcd character varying(20),
    oc_use_yn_noans_spnm character varying(50),
    oc_use_mcnt numeric(3,0),
    meno_yn_noans_spcd character varying(20),
    meno_yn_noans_spnm character varying(50),
    meno_age_vl numeric(4,0),
    utec_yn_noans_spcd character varying(20),
    utec_yn_noans_spnm character varying(50),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_pt_obinf OWNER TO gony;

--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE brcn_pt_obinf; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_pt_obinf IS '유방암_환자_산과정보';


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.hosp_cd IS '병원코드';


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.obtr_rcrd_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.obtr_rcrd_ymd IS '산과기록일자';


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.obtr_rcrd_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.obtr_rcrd_seq IS '산과기록순번';


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.marg_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.marg_yn_noans_spcd IS '결혼여부무응답구분코드';


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.marg_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.marg_yn_noans_spnm IS '결혼여부무응답구분명';


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.marg_detl_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.marg_detl_cd IS '결혼상세코드';


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.marg_detl_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.marg_detl_nm IS '결혼상세명';


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.hrpr_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.hrpr_yn_noans_spcd IS 'HRT경험여부무응답구분코드';


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.hrpr_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.hrpr_yn_noans_spnm IS 'HRT경험여부무응답구분명';


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.hrt_impl_mcnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.hrt_impl_mcnt IS 'HRT시행월수';


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.mena_age_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.mena_age_vl IS '초경연령값';


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.delv_age_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.delv_age_vl IS '출산연령값';


--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.delv_chld_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.delv_chld_cnt IS '출산자녀수';


--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.bfpr_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.bfpr_yn_noans_spcd IS '모유수유경험여부무응답구분코드';


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.bfpr_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.bfpr_yn_noans_spnm IS '모유수유경험여부무응답구분명';


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.brfd_mcnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.brfd_mcnt IS '모유수유월수';


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.oc_use_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.oc_use_yn_noans_spcd IS '경구피임약사용여부무응답구분코드';


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.oc_use_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.oc_use_yn_noans_spnm IS '경구피임약사용여부무응답구분명';


--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.oc_use_mcnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.oc_use_mcnt IS '경구피임약사용월수';


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.meno_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.meno_yn_noans_spcd IS '폐경여부무응답구분코드';


--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.meno_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.meno_yn_noans_spnm IS '폐경여부무응답구분명';


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.meno_age_vl; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.meno_age_vl IS '폐경연령값';


--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.utec_yn_noans_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.utec_yn_noans_spcd IS '자궁적출술여부무응답구분코드';


--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.utec_yn_noans_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.utec_yn_noans_spnm IS '자궁적출술여부무응답구분명';


--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN brcn_pt_obinf.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_pt_obinf.crtn_dt IS '생성일시';


--
-- TOC entry 253 (class 1259 OID 25015)
-- Name: brcn_trtm_antp; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_trtm_antp (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    antp_strt_ymd character varying(8) NOT NULL,
    antp_seq numeric(3,0) NOT NULL,
    antp_end_ymd character varying(8),
    antp_nm character varying(200),
    antp_cycl_cnt numeric(3,0),
    antp_line_cnt numeric(3,0),
    antp_temp_stop_yn_unid_spcd character varying(20),
    antp_temp_stop_yn_unid_spnm character varying(50),
    antp_end_resn_cd character varying(20),
    antp_end_resn_nm character varying(200),
    antp_asmt_ymd character varying(8),
    antp_asmt_item_cd character varying(20),
    antp_asmt_item_nm character varying(200),
    antp_seff_item_cd character varying(20),
    antp_seff_item_nm character varying(200),
    antp_seff_grcd character varying(20),
    antp_seff_grnm character varying(200),
    antp_trtm_prps_cd character varying(20),
    antp_trtm_prps_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_trtm_antp OWNER TO gony;

--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE brcn_trtm_antp; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_trtm_antp IS '유방암_치료_항암요법';


--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.hosp_cd IS '병원코드';


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_strt_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_strt_ymd IS '항암요법시작일자';


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_seq IS '항암요법순번';


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_end_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_end_ymd IS '항암요법종료일자';


--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_nm IS '항암요법명';


--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_cycl_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_cycl_cnt IS '항암요법주기수';


--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_line_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_line_cnt IS '항암요법라인수';


--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_temp_stop_yn_unid_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_temp_stop_yn_unid_spcd IS '항암요법임시중단여부확인불가구분코드';


--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_temp_stop_yn_unid_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_temp_stop_yn_unid_spnm IS '항암요법임시중단여부확인불가구분명';


--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_end_resn_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_end_resn_cd IS '항암요법종료이유코드';


--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_end_resn_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_end_resn_nm IS '항암요법종료이유명';


--
-- TOC entry 4554 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_asmt_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_asmt_ymd IS '항암요법평가일자';


--
-- TOC entry 4555 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_asmt_item_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_asmt_item_cd IS '항암요법평가항목코드';


--
-- TOC entry 4556 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_asmt_item_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_asmt_item_nm IS '항암요법평가항목명';


--
-- TOC entry 4557 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_seff_item_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_seff_item_cd IS '항암요법부작용항목코드';


--
-- TOC entry 4558 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_seff_item_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_seff_item_nm IS '항암요법부작용항목명';


--
-- TOC entry 4559 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_seff_grcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_seff_grcd IS '항암요법부작용등급코드';


--
-- TOC entry 4560 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_seff_grnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_seff_grnm IS '항암요법부작용등급명';


--
-- TOC entry 4561 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_trtm_prps_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_trtm_prps_cd IS '항암요법치료목적코드';


--
-- TOC entry 4562 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.antp_trtm_prps_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.antp_trtm_prps_nm IS '항암요법치료목적명';


--
-- TOC entry 4563 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN brcn_trtm_antp.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_antp.crtn_dt IS '생성일시';


--
-- TOC entry 254 (class 1259 OID 25022)
-- Name: brcn_trtm_bltr; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_trtm_bltr (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    bltr_prsc_ymd character varying(8) NOT NULL,
    bltr_prsc_seq numeric(3,0) NOT NULL,
    blpt_kncd character varying(20),
    blpt_knnm character varying(200),
    blpt_cd character varying(20),
    blpt_nm character varying(200),
    blpt_capa numeric(5,0),
    bltr_pack_cnt numeric(3,0),
    bltr_totl_qty numeric(8,0),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_trtm_bltr OWNER TO gony;

--
-- TOC entry 4564 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE brcn_trtm_bltr; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_trtm_bltr IS '유방암_치료_수혈';


--
-- TOC entry 4565 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.hosp_cd IS '병원코드';


--
-- TOC entry 4566 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4567 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.bltr_prsc_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.bltr_prsc_ymd IS '수혈처방일자';


--
-- TOC entry 4568 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.bltr_prsc_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.bltr_prsc_seq IS '수혈처방순번';


--
-- TOC entry 4569 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.blpt_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.blpt_kncd IS '혈액제제종류코드';


--
-- TOC entry 4570 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.blpt_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.blpt_knnm IS '혈액제제종류명';


--
-- TOC entry 4571 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.blpt_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.blpt_cd IS '혈액제제코드';


--
-- TOC entry 4572 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.blpt_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.blpt_nm IS '혈액제제명';


--
-- TOC entry 4573 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.blpt_capa; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.blpt_capa IS '혈액제제용량';


--
-- TOC entry 4574 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.bltr_pack_cnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.bltr_pack_cnt IS '수혈팩수';


--
-- TOC entry 4575 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.bltr_totl_qty; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.bltr_totl_qty IS '수혈총량';


--
-- TOC entry 4576 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN brcn_trtm_bltr.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_bltr.crtn_dt IS '생성일시';


--
-- TOC entry 255 (class 1259 OID 25027)
-- Name: brcn_trtm_drin; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_trtm_drin (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    drug_prsc_ymd character varying(8) NOT NULL,
    drug_prsc_seq numeric(3,0) NOT NULL,
    drug_clcd character varying(20),
    drug_clnm character varying(200),
    andr_spcd character varying(20),
    andr_spnm character varying(200),
    drin_kncd character varying(20),
    drin_knnm character varying(200),
    drin_cd character varying(20),
    drin_nm character varying(200),
    drin_smct_cd character varying(200),
    drin_smct_nm character varying(1000),
    drug_cd character varying(20),
    drug_nm character varying(200),
    drug_edi_cd character varying(20),
    drug_edi_nm character varying(200),
    drug_atc_cd character varying(20),
    drug_atc_nm character varying(200),
    drug_rxnm_cd character varying(20),
    drug_rxnm_nm character varying(200),
    drug_prsc_capa character varying(50),
    drug_prsc_capa_unit_cd character varying(20),
    drug_prsc_capa_unit_nm character varying(200),
    drug_prsc_dcnt numeric(6,0),
    drug_injc_pth_cd character varying(20),
    drug_injc_pth_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_trtm_drin OWNER TO gony;

--
-- TOC entry 4577 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE brcn_trtm_drin; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_trtm_drin IS '유방암_치료_약제성분';


--
-- TOC entry 4578 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.hosp_cd IS '병원코드';


--
-- TOC entry 4579 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4580 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_prsc_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_prsc_ymd IS '약제처방일자';


--
-- TOC entry 4581 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_prsc_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_prsc_seq IS '약제처방순번';


--
-- TOC entry 4582 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_clcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_clcd IS '약제분류코드';


--
-- TOC entry 4583 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_clnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_clnm IS '약제분류명';


--
-- TOC entry 4584 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.andr_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.andr_spcd IS '항암약제구분코드';


--
-- TOC entry 4585 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.andr_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.andr_spnm IS '항암약제구분명';


--
-- TOC entry 4586 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drin_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drin_kncd IS '약제성분종류코드';


--
-- TOC entry 4587 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drin_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drin_knnm IS '약제성분종류명';


--
-- TOC entry 4588 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drin_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drin_cd IS '약제성분코드';


--
-- TOC entry 4589 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drin_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drin_nm IS '약제성분명';


--
-- TOC entry 4590 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drin_smct_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drin_smct_cd IS '약제성분SNOMEDCT코드';


--
-- TOC entry 4591 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drin_smct_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drin_smct_nm IS '약제성분SNOMEDCT명';


--
-- TOC entry 4592 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_cd IS '약제코드';


--
-- TOC entry 4593 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_nm IS '약제명';


--
-- TOC entry 4594 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_edi_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_edi_cd IS '약제EDI코드';


--
-- TOC entry 4595 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_edi_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_edi_nm IS '약제EDI명';


--
-- TOC entry 4596 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_atc_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_atc_cd IS '약제ATC코드';


--
-- TOC entry 4597 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_atc_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_atc_nm IS '약제ATC명';


--
-- TOC entry 4598 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_rxnm_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_rxnm_cd IS '약제RXNORM코드';


--
-- TOC entry 4599 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_rxnm_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_rxnm_nm IS '약제RXNORM명';


--
-- TOC entry 4600 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_prsc_capa; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_prsc_capa IS '약제처방용량';


--
-- TOC entry 4601 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_prsc_capa_unit_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_prsc_capa_unit_cd IS '약제처방용량단위코드';


--
-- TOC entry 4602 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_prsc_capa_unit_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_prsc_capa_unit_nm IS '약제처방용량단위명';


--
-- TOC entry 4603 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_prsc_dcnt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_prsc_dcnt IS '약제처방일수';


--
-- TOC entry 4604 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_injc_pth_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_injc_pth_cd IS '약제투여경로코드';


--
-- TOC entry 4605 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.drug_injc_pth_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.drug_injc_pth_nm IS '약제투여경로명';


--
-- TOC entry 4606 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN brcn_trtm_drin.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_drin.crtn_dt IS '생성일시';


--
-- TOC entry 256 (class 1259 OID 25034)
-- Name: brcn_trtm_oprt; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_trtm_oprt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    oprt_ymd character varying(8) NOT NULL,
    oprt_seq numeric(3,0) NOT NULL,
    oprt_kncd character varying(20),
    oprt_knnm character varying(200),
    oprt_cd character varying(20),
    oprt_nm character varying(500),
    oprt_edi_cd character varying(20),
    oprt_edi_nm character varying(200),
    oprt_smct_cd character varying(200),
    oprt_smct_nm character varying(1000),
    oprt_icd9cm_cd character varying(20),
    oprt_icd9cm_nm character varying(1000),
    oprt_anst_site_cd character varying(20),
    oprt_anst_site_nm character varying(200),
    ebl_qty numeric(5,0),
    oprt_ldtm character varying(20),
    oprt_prps_cd character varying(20),
    oprt_prps_nm character varying(200),
    oprt_site_cd character varying(20),
    oprt_site_nm character varying(200),
    brcn_oprt_mtcd character varying(20),
    brcn_oprt_mtnm character varying(200),
    asa_scor_cd character varying(20),
    asa_scor_nm character varying(200),
    oprt_incs_mthd_cont character varying(4000),
    oprt_icln_tpcd character varying(20),
    oprt_icln_tpnm character varying(200),
    oprt_tumr_loca_cd character varying(20),
    oprt_tumr_loca_nm character varying(200),
    oprt_tumr_detl_loca_cd character varying(20),
    oprt_tumr_detl_loca_nm character varying(200),
    repr_clcd character varying(20),
    repr_clnm character varying(200),
    repr_mtcd character varying(20),
    repr_mtnm character varying(200),
    slnd_dtct_mtcd character varying(20),
    slnd_dtct_mtnm character varying(200),
    afop_asmt_item_cd character varying(20),
    afop_asmt_item_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_trtm_oprt OWNER TO gony;

--
-- TOC entry 4607 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE brcn_trtm_oprt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_trtm_oprt IS '유방암_치료_수술';


--
-- TOC entry 4608 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.hosp_cd IS '병원코드';


--
-- TOC entry 4609 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4610 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_ymd IS '수술일자';


--
-- TOC entry 4611 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_seq IS '수술순번';


--
-- TOC entry 4612 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_kncd IS '수술종류코드';


--
-- TOC entry 4613 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_knnm IS '수술종류명';


--
-- TOC entry 4614 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_cd IS '수술코드';


--
-- TOC entry 4615 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_nm IS '수술명';


--
-- TOC entry 4616 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_edi_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_edi_cd IS '수술EDI코드';


--
-- TOC entry 4617 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_edi_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_edi_nm IS '수술EDI명';


--
-- TOC entry 4618 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_smct_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_smct_cd IS '수술SNOMEDCT코드';


--
-- TOC entry 4619 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_smct_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_smct_nm IS '수술SNOMEDCT명';


--
-- TOC entry 4620 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_icd9cm_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_icd9cm_cd IS '수술ICD9CM코드';


--
-- TOC entry 4621 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_icd9cm_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_icd9cm_nm IS '수술ICD9CM명';


--
-- TOC entry 4622 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_anst_site_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_anst_site_cd IS '수술마취부위코드';


--
-- TOC entry 4623 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_anst_site_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_anst_site_nm IS '수술마취부위명';


--
-- TOC entry 4624 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.ebl_qty; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.ebl_qty IS '추정실혈량';


--
-- TOC entry 4625 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_ldtm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_ldtm IS '수술소요시간';


--
-- TOC entry 4626 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_prps_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_prps_cd IS '수술목적코드';


--
-- TOC entry 4627 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_prps_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_prps_nm IS '수술목적명';


--
-- TOC entry 4628 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_site_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_site_cd IS '수술부위코드';


--
-- TOC entry 4629 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_site_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_site_nm IS '수술부위명';


--
-- TOC entry 4630 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.brcn_oprt_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.brcn_oprt_mtcd IS '유방암수술방법코드';


--
-- TOC entry 4631 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.brcn_oprt_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.brcn_oprt_mtnm IS '유방암수술방법명';


--
-- TOC entry 4632 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.asa_scor_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.asa_scor_cd IS 'ASA점수코드';


--
-- TOC entry 4633 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.asa_scor_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.asa_scor_nm IS 'ASA점수명';


--
-- TOC entry 4634 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_incs_mthd_cont; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_incs_mthd_cont IS '수술절개방법내용';


--
-- TOC entry 4635 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_icln_tpcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_icln_tpcd IS '수술절개선유형코드';


--
-- TOC entry 4636 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_icln_tpnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_icln_tpnm IS '수술절개선유형명';


--
-- TOC entry 4637 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_tumr_loca_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_tumr_loca_cd IS '수술종양위치코드';


--
-- TOC entry 4638 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_tumr_loca_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_tumr_loca_nm IS '수술종양위치명';


--
-- TOC entry 4639 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_tumr_detl_loca_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_tumr_detl_loca_cd IS '수술종양상세위치코드';


--
-- TOC entry 4640 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.oprt_tumr_detl_loca_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.oprt_tumr_detl_loca_nm IS '수술종양상세위치명';


--
-- TOC entry 4641 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.repr_clcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.repr_clcd IS '재건술분류코드';


--
-- TOC entry 4642 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.repr_clnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.repr_clnm IS '재건술분류명';


--
-- TOC entry 4643 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.repr_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.repr_mtcd IS '재건술방법코드';


--
-- TOC entry 4644 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.repr_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.repr_mtnm IS '재건술방법명';


--
-- TOC entry 4645 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.slnd_dtct_mtcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.slnd_dtct_mtcd IS '감시림프절검출방법코드';


--
-- TOC entry 4646 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.slnd_dtct_mtnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.slnd_dtct_mtnm IS '감시림프절검출방법명';


--
-- TOC entry 4647 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.afop_asmt_item_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.afop_asmt_item_cd IS '수술후평가항목코드';


--
-- TOC entry 4648 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.afop_asmt_item_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.afop_asmt_item_nm IS '수술후평가항목명';


--
-- TOC entry 4649 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN brcn_trtm_oprt.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_oprt.crtn_dt IS '생성일시';


--
-- TOC entry 257 (class 1259 OID 25041)
-- Name: brcn_trtm_rd; Type: TABLE; Schema: cancle_breast; Owner: gony
--

CREATE TABLE cancle_breast.brcn_trtm_rd (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    rdt_prsc_ymd character varying(8) NOT NULL,
    rdt_prsc_seq numeric(3,0) NOT NULL,
    rdt_kncd character varying(20),
    rdt_knnm character varying(200),
    rdt_cd character varying(20),
    rdt_nm character varying(200),
    rdt_edi_cd character varying(20),
    rdt_edi_nm character varying(200),
    rdt_smct_cd character varying(200),
    rdt_smct_nm character varying(1000),
    rdt_prps_cd character varying(20),
    rdt_prps_nm character varying(200),
    rdt_site_cd character varying(20),
    rdt_site_nm character varying(200),
    rd_gy numeric(10,3),
    rd_impl_nt numeric(5,0),
    rd_totl_gy numeric(10,3),
    rdt_asmt_ymd character varying(8),
    rdt_seff_perd_spcd character varying(20),
    rdt_seff_perd_spnm character varying(200),
    rdt_seff_kncd character varying(20),
    rdt_seff_knnm character varying(200),
    rdt_seff_grcd character varying(20),
    rdt_seff_grnm character varying(200),
    rdt_asmt_item_cd character varying(20),
    rdt_asmt_item_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_breast.brcn_trtm_rd OWNER TO gony;

--
-- TOC entry 4650 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE brcn_trtm_rd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON TABLE cancle_breast.brcn_trtm_rd IS '유방암_치료_방사선';


--
-- TOC entry 4651 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.hosp_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.hosp_cd IS '병원코드';


--
-- TOC entry 4652 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.pt_sbst_no; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4653 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_prsc_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_prsc_ymd IS '방사선치료처방일자';


--
-- TOC entry 4654 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_prsc_seq; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_prsc_seq IS '방사선치료처방순번';


--
-- TOC entry 4655 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_kncd IS '방사선치료종류코드';


--
-- TOC entry 4656 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_knnm IS '방사선치료종류명';


--
-- TOC entry 4657 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_cd IS '방사선치료코드';


--
-- TOC entry 4658 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_nm IS '방사선치료명';


--
-- TOC entry 4659 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_edi_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_edi_cd IS '방사선치료EDI코드';


--
-- TOC entry 4660 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_edi_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_edi_nm IS '방사선치료EDI명';


--
-- TOC entry 4661 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_smct_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_smct_cd IS '방사선치료SNOMEDCT코드';


--
-- TOC entry 4662 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_smct_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_smct_nm IS '방사선치료SNOMEDCT명';


--
-- TOC entry 4663 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_prps_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_prps_cd IS '방사선치료목적코드';


--
-- TOC entry 4664 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_prps_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_prps_nm IS '방사선치료목적명';


--
-- TOC entry 4665 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_site_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_site_cd IS '방사선치료부위코드';


--
-- TOC entry 4666 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_site_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_site_nm IS '방사선치료부위명';


--
-- TOC entry 4667 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rd_gy; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rd_gy IS '방사선선량';


--
-- TOC entry 4668 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rd_impl_nt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rd_impl_nt IS '방사선시행횟수';


--
-- TOC entry 4669 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rd_totl_gy; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rd_totl_gy IS '방사선총선량';


--
-- TOC entry 4670 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_asmt_ymd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_asmt_ymd IS '방사선치료평가일자';


--
-- TOC entry 4671 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_seff_perd_spcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_seff_perd_spcd IS '방사선치료부작용시기구분코드';


--
-- TOC entry 4672 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_seff_perd_spnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_seff_perd_spnm IS '방사선치료부작용시기구분명';


--
-- TOC entry 4673 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_seff_kncd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_seff_kncd IS '방사선치료부작용종류코드';


--
-- TOC entry 4674 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_seff_knnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_seff_knnm IS '방사선치료부작용종류명';


--
-- TOC entry 4675 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_seff_grcd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_seff_grcd IS '방사선치료부작용등급코드';


--
-- TOC entry 4676 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_seff_grnm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_seff_grnm IS '방사선치료부작용등급명';


--
-- TOC entry 4677 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_asmt_item_cd; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_asmt_item_cd IS '방사선치료평가항목코드';


--
-- TOC entry 4678 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.rdt_asmt_item_nm; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.rdt_asmt_item_nm IS '방사선치료평가항목명';


--
-- TOC entry 4679 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN brcn_trtm_rd.crtn_dt; Type: COMMENT; Schema: cancle_breast; Owner: gony
--

COMMENT ON COLUMN cancle_breast.brcn_trtm_rd.crtn_dt IS '생성일시';


--
-- TOC entry 213 (class 1259 OID 24738)
-- Name: gscn_diag_afoc; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_diag_afoc (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    comp_ocrn_oprt_ymd character varying(8) NOT NULL,
    comp_ocrn_oprt_seq numeric(3,0) NOT NULL,
    afoc_clcd character varying(20),
    afoc_clnm character varying(200),
    afoc_cd character varying(20),
    afoc_nm character varying(200),
    afop_etc_comp_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_diag_afoc OWNER TO gony;

--
-- TOC entry 4680 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE gscn_diag_afoc; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_diag_afoc IS '위암_진단_수술후합병증';


--
-- TOC entry 4681 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.hosp_cd IS '병원코드';


--
-- TOC entry 4682 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4683 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.comp_ocrn_oprt_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.comp_ocrn_oprt_ymd IS '합병증발생수술일자';


--
-- TOC entry 4684 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.comp_ocrn_oprt_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.comp_ocrn_oprt_seq IS '합병증발생수술순번';


--
-- TOC entry 4685 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.afoc_clcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.afoc_clcd IS '수술후합병증분류코드';


--
-- TOC entry 4686 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.afoc_clnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.afoc_clnm IS '수술후합병증분류명';


--
-- TOC entry 4687 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.afoc_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.afoc_cd IS '수술후합병증코드';


--
-- TOC entry 4688 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.afoc_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.afoc_nm IS '수술후합병증명';


--
-- TOC entry 4689 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.afop_etc_comp_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.afop_etc_comp_cont IS '수술후기타합병증내용';


--
-- TOC entry 4690 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN gscn_diag_afoc.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_afoc.crtn_dt IS '생성일시';


--
-- TOC entry 214 (class 1259 OID 24745)
-- Name: gscn_diag_aninf; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_diag_aninf (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    anth_rcrd_ymd character varying(8) NOT NULL,
    anth_rcrd_seq numeric(3,0) NOT NULL,
    ht_msrm_vl numeric(10,3),
    wt_msrm_vl numeric(10,3),
    bmi_vl numeric(10,3),
    rlxt_blpr_vl character varying(200),
    ctrt_blpr_vl character varying(200),
    ecog_cd character varying(20),
    ecog_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_diag_aninf OWNER TO gony;

--
-- TOC entry 4691 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE gscn_diag_aninf; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_diag_aninf IS '위암_진단_신체계측정보';


--
-- TOC entry 4692 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.hosp_cd IS '병원코드';


--
-- TOC entry 4693 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4694 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.anth_rcrd_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.anth_rcrd_ymd IS '신체계측기록일자';


--
-- TOC entry 4695 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.anth_rcrd_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.anth_rcrd_seq IS '신체계측기록순번';


--
-- TOC entry 4696 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.ht_msrm_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.ht_msrm_vl IS '신장측정값';


--
-- TOC entry 4697 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.wt_msrm_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.wt_msrm_vl IS '체중측정값';


--
-- TOC entry 4698 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.bmi_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.bmi_vl IS 'BMI값';


--
-- TOC entry 4699 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.rlxt_blpr_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.rlxt_blpr_vl IS '이완혈압값';


--
-- TOC entry 4700 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.ctrt_blpr_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.ctrt_blpr_vl IS '수축혈압값';


--
-- TOC entry 4701 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.ecog_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.ecog_cd IS 'ECOG코드';


--
-- TOC entry 4702 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.ecog_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.ecog_nm IS 'ECOG명';


--
-- TOC entry 4703 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN gscn_diag_aninf.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_aninf.crtn_dt IS '생성일시';


--
-- TOC entry 215 (class 1259 OID 24752)
-- Name: gscn_diag_inf; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_diag_inf (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    diag_rgst_ymd character varying(8) NOT NULL,
    diag_rgst_seq numeric(3,0) NOT NULL,
    gscn_diag_kncd character varying(20),
    gscn_diag_knnm character varying(200),
    diag_cd character varying(20),
    diag_nm character varying(300),
    diag_kcd_cd character varying(20),
    diag_kcd_nm character varying(200),
    diag_smct_cd character varying(200),
    diag_smct_nm character varying(1000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_diag_inf OWNER TO gony;

--
-- TOC entry 4704 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE gscn_diag_inf; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_diag_inf IS '위암_진단_정보';


--
-- TOC entry 4705 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.hosp_cd IS '병원코드';


--
-- TOC entry 4706 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4707 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_rgst_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_rgst_ymd IS '진단등록일자';


--
-- TOC entry 4708 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_rgst_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_rgst_seq IS '진단등록순번';


--
-- TOC entry 4709 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.gscn_diag_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.gscn_diag_kncd IS '위암진단종류코드';


--
-- TOC entry 4710 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.gscn_diag_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.gscn_diag_knnm IS '위암진단종류명';


--
-- TOC entry 4711 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_cd IS '진단코드';


--
-- TOC entry 4712 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_nm IS '진단명';


--
-- TOC entry 4713 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_kcd_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_kcd_cd IS '진단KCD코드';


--
-- TOC entry 4714 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_kcd_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_kcd_nm IS '진단KCD명';


--
-- TOC entry 4715 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_smct_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_smct_cd IS '진단SNOMEDCT코드';


--
-- TOC entry 4716 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.diag_smct_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.diag_smct_nm IS '진단SNOMEDCT명';


--
-- TOC entry 4717 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN gscn_diag_inf.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_inf.crtn_dt IS '생성일시';


--
-- TOC entry 216 (class 1259 OID 24759)
-- Name: gscn_diag_mtst; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_diag_mtst (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    mtdg_ymd character varying(8) NOT NULL,
    mtdg_seq numeric(3,0) NOT NULL,
    mtdg_mtcd character varying(20),
    mtdg_mtnm character varying(200),
    mtst_site_cd character varying(20),
    mtst_site_nm character varying(200),
    mtst_aspt_cd character varying(20),
    mtst_aspt_nm character varying(200),
    mtst_trtm_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_diag_mtst OWNER TO gony;

--
-- TOC entry 4718 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE gscn_diag_mtst; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_diag_mtst IS '위암_진단_전이';


--
-- TOC entry 4719 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.hosp_cd IS '병원코드';


--
-- TOC entry 4720 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4721 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtdg_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtdg_ymd IS '전이진단일자';


--
-- TOC entry 4722 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtdg_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtdg_seq IS '전이진단순번';


--
-- TOC entry 4723 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtdg_mtcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtdg_mtcd IS '전이진단방법코드';


--
-- TOC entry 4724 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtdg_mtnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtdg_mtnm IS '전이진단방법명';


--
-- TOC entry 4725 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtst_site_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtst_site_cd IS '전이부위코드';


--
-- TOC entry 4726 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtst_site_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtst_site_nm IS '전이부위명';


--
-- TOC entry 4727 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtst_aspt_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtst_aspt_cd IS '전이양상코드';


--
-- TOC entry 4728 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtst_aspt_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtst_aspt_nm IS '전이양상명';


--
-- TOC entry 4729 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.mtst_trtm_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.mtst_trtm_cont IS '전이치료내용';


--
-- TOC entry 4730 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN gscn_diag_mtst.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_mtst.crtn_dt IS '생성일시';


--
-- TOC entry 217 (class 1259 OID 24766)
-- Name: gscn_diag_stag; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_diag_stag (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    diag_stag_rcrd_ymd character varying(8) NOT NULL,
    diag_stag_rcrd_seq numeric(3,0) NOT NULL,
    clnc_tumr_prty_cd character varying(20),
    clnc_tumr_prty_nm character varying(200),
    ajcc_yr character varying(4),
    clnc_tnm_stag_vl character varying(200),
    clnc_t_stag_vl character varying(200),
    clnc_n_stag_vl character varying(200),
    clnc_m_stag_vl character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_diag_stag OWNER TO gony;

--
-- TOC entry 4731 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE gscn_diag_stag; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_diag_stag IS '위암_진단_병기';


--
-- TOC entry 4732 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.hosp_cd IS '병원코드';


--
-- TOC entry 4733 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4734 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.diag_stag_rcrd_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.diag_stag_rcrd_ymd IS '진단병기기록일자';


--
-- TOC entry 4735 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.diag_stag_rcrd_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.diag_stag_rcrd_seq IS '진단병기기록순번';


--
-- TOC entry 4736 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.clnc_tumr_prty_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.clnc_tumr_prty_cd IS '임상종양특성코드';


--
-- TOC entry 4737 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.clnc_tumr_prty_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.clnc_tumr_prty_nm IS '임상종양특성명';


--
-- TOC entry 4738 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.ajcc_yr; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.ajcc_yr IS 'AJCC년도';


--
-- TOC entry 4739 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.clnc_tnm_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.clnc_tnm_stag_vl IS '임상TNM병기값';


--
-- TOC entry 4740 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.clnc_t_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.clnc_t_stag_vl IS '임상T병기값';


--
-- TOC entry 4741 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.clnc_n_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.clnc_n_stag_vl IS '임상N병기값';


--
-- TOC entry 4742 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.clnc_m_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.clnc_m_stag_vl IS '임상M병기값';


--
-- TOC entry 4743 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN gscn_diag_stag.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_diag_stag.crtn_dt IS '생성일시';


--
-- TOC entry 218 (class 1259 OID 24773)
-- Name: gscn_exam_byps; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_byps (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    bpsy_ymd character varying(8) NOT NULL,
    bpsy_seq numeric(3,0) NOT NULL,
    bpsy_read_ymd character varying(8),
    bpsy_site_cd character varying(20),
    bpsy_site_nm character varying(200),
    bpsy_mtcd character varying(20),
    bpsy_mtnm character varying(200),
    bpsy_mthd_kncd character varying(20),
    bpsy_mthd_knnm character varying(200),
    bpsy_rslt_cont character varying(4000),
    htlg_diag_cd character varying(20),
    htlg_diag_nm character varying(200),
    htlg_dfgd_cd character varying(20),
    htlg_dfgd_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_byps OWNER TO gony;

--
-- TOC entry 4744 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE gscn_exam_byps; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_byps IS '위암_검사_생체';


--
-- TOC entry 4745 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.hosp_cd IS '병원코드';


--
-- TOC entry 4746 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4747 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_ymd IS '생체검사일자';


--
-- TOC entry 4748 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_seq IS '생체검사순번';


--
-- TOC entry 4749 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_read_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_read_ymd IS '생체검사판독일자';


--
-- TOC entry 4750 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_site_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_site_cd IS '생체검사부위코드';


--
-- TOC entry 4751 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_site_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_site_nm IS '생체검사부위명';


--
-- TOC entry 4752 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_mtcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_mtcd IS '생체검사방법코드';


--
-- TOC entry 4753 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_mtnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_mtnm IS '생체검사방법명';


--
-- TOC entry 4754 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_mthd_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_mthd_kncd IS '생체검사방법종류코드';


--
-- TOC entry 4755 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_mthd_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_mthd_knnm IS '생체검사방법종류명';


--
-- TOC entry 4756 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.bpsy_rslt_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.bpsy_rslt_cont IS '생체검사결과내용';


--
-- TOC entry 4757 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.htlg_diag_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.htlg_diag_cd IS '조직학적진단코드';


--
-- TOC entry 4758 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.htlg_diag_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.htlg_diag_nm IS '조직학적진단명';


--
-- TOC entry 4759 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.htlg_dfgd_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.htlg_dfgd_cd IS '조직학적분화도코드';


--
-- TOC entry 4760 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.htlg_dfgd_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.htlg_dfgd_nm IS '조직학적분화도명';


--
-- TOC entry 4761 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN gscn_exam_byps.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_byps.crtn_dt IS '생성일시';


--
-- TOC entry 219 (class 1259 OID 24780)
-- Name: gscn_exam_diag; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_diag (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    cexm_ymd character varying(8) NOT NULL,
    cexm_seq numeric(3,0) NOT NULL,
    cexm_kncd character varying(20),
    cexm_knnm character varying(200),
    cexm_cd character varying(20),
    cexm_nm character varying(200),
    cexm_edi_cd character varying(20),
    cexm_edi_nm character varying(200),
    cexm_smct_cd character varying(200),
    cexm_smct_nm character varying(1000),
    cexm_loinc_cd character varying(20),
    cexm_loinc_nm character varying(1000),
    cexm_rslt_cont character varying(4000),
    cexm_rslt_unit_cont character varying(4000),
    cexm_nlrg_ref_vl character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_diag OWNER TO gony;

--
-- TOC entry 4762 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE gscn_exam_diag; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_diag IS '위암_검사_진단';


--
-- TOC entry 4763 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.hosp_cd IS '병원코드';


--
-- TOC entry 4764 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4765 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_ymd IS '진단검사일자';


--
-- TOC entry 4766 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_seq IS '진단검사순번';


--
-- TOC entry 4767 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_kncd IS '진단검사종류코드';


--
-- TOC entry 4768 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_knnm IS '진단검사종류명';


--
-- TOC entry 4769 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_cd IS '진단검사코드';


--
-- TOC entry 4770 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_nm IS '진단검사명';


--
-- TOC entry 4771 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_edi_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_edi_cd IS '진단검사EDI코드';


--
-- TOC entry 4772 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_edi_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_edi_nm IS '진단검사EDI명';


--
-- TOC entry 4773 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_smct_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_smct_cd IS '진단검사SNOMEDCT코드';


--
-- TOC entry 4774 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_smct_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_smct_nm IS '진단검사SNOMEDCT명';


--
-- TOC entry 4775 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_loinc_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_loinc_cd IS '진단검사LOINC코드';


--
-- TOC entry 4776 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_loinc_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_loinc_nm IS '진단검사LOINC명';


--
-- TOC entry 4777 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_rslt_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_rslt_cont IS '진단검사결과내용';


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_rslt_unit_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_rslt_unit_cont IS '진단검사결과단위내용';


--
-- TOC entry 4779 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.cexm_nlrg_ref_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.cexm_nlrg_ref_vl IS '진단검사정상범위참고값';


--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN gscn_exam_diag.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_diag.crtn_dt IS '생성일시';


--
-- TOC entry 220 (class 1259 OID 24787)
-- Name: gscn_exam_eus; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_eus (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    eus_exam_ymd character varying(8) NOT NULL,
    eus_exam_seq numeric(3,0) NOT NULL,
    eus_t_stag_cd character varying(20),
    eus_t_stag_nm character varying(200),
    eus_n_stag_cd character varying(20),
    eus_n_stag_nm character varying(200),
    eus_m_stag_cd character varying(20),
    eus_m_stag_nm character varying(200),
    eus_exam_opn_cont character varying(4000),
    eus_exam_rslt_cont character varying(4000),
    eus_comp_cd character varying(20),
    eus_comp_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_eus OWNER TO gony;

--
-- TOC entry 4781 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE gscn_exam_eus; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_eus IS '위암_검사_EUS';


--
-- TOC entry 4782 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.hosp_cd IS '병원코드';


--
-- TOC entry 4783 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4784 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_exam_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_exam_ymd IS 'EUS검사일자';


--
-- TOC entry 4785 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_exam_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_exam_seq IS 'EUS검사순번';


--
-- TOC entry 4786 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_t_stag_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_t_stag_cd IS 'EUS_T병기코드';


--
-- TOC entry 4787 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_t_stag_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_t_stag_nm IS 'EUS_T병기명';


--
-- TOC entry 4788 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_n_stag_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_n_stag_cd IS 'EUS_N병기코드';


--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_n_stag_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_n_stag_nm IS 'EUS_N병기명';


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_m_stag_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_m_stag_cd IS 'EUS_M병기코드';


--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_m_stag_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_m_stag_nm IS 'EUS_M병기명';


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_exam_opn_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_exam_opn_cont IS 'EUS검사소견내용';


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_exam_rslt_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_exam_rslt_cont IS 'EUS검사결과내용';


--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_comp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_comp_cd IS 'EUS합병증코드';


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.eus_comp_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.eus_comp_nm IS 'EUS합병증명';


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN gscn_exam_eus.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_eus.crtn_dt IS '생성일시';


--
-- TOC entry 221 (class 1259 OID 24794)
-- Name: gscn_exam_gtsp; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_gtsp (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    stmc_edex_ymd character varying(8) NOT NULL,
    stmc_edex_seq numeric(3,0) NOT NULL,
    stmc_edex_prps_cd character varying(20),
    stmc_edex_prps_nm character varying(200),
    gtsp_tspc_cnt character varying(100),
    stmc_edex_opn_cont character varying(4000),
    stmc_edex_rslt_cont character varying(4000),
    stmc_edex_rslt_tpcd character varying(20),
    stmc_edex_rslt_tpnm character varying(200),
    gtsp_comp_grcd character varying(20),
    gtsp_comp_grnm character varying(200),
    gtsp_comp_cd character varying(20),
    gtsp_comp_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_gtsp OWNER TO gony;

--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE gscn_exam_gtsp; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_gtsp IS '위암_검사_위내시경';


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.hosp_cd IS '병원코드';


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_ymd IS '위내시경검사일자';


--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_seq IS '위내시경검사순번';


--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_prps_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_prps_cd IS '위내시경검사목적코드';


--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_prps_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_prps_nm IS '위내시경검사목적명';


--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.gtsp_tspc_cnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.gtsp_tspc_cnt IS '위내시경조직표본수';


--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_opn_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_opn_cont IS '위내시경검사소견내용';


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_rslt_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_rslt_cont IS '위내시경검사결과내용';


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_rslt_tpcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_rslt_tpcd IS '위내시경검사결과유형코드';


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.stmc_edex_rslt_tpnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.stmc_edex_rslt_tpnm IS '위내시경검사결과유형명';


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.gtsp_comp_grcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.gtsp_comp_grcd IS '위내시경합병증등급코드';


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.gtsp_comp_grnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.gtsp_comp_grnm IS '위내시경합병증등급명';


--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.gtsp_comp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.gtsp_comp_cd IS '위내시경합병증코드';


--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.gtsp_comp_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.gtsp_comp_nm IS '위내시경합병증명';


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN gscn_exam_gtsp.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_gtsp.crtn_dt IS '생성일시';


--
-- TOC entry 222 (class 1259 OID 24801)
-- Name: gscn_exam_hpli; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_hpli (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    hpli_exam_ymd character varying(8) NOT NULL,
    hpli_exam_seq numeric(3,0) NOT NULL,
    hpli_exam_mtcd character varying(20),
    hpli_exam_mtnm character varying(200),
    hpli_exam_rslt_cd character varying(20),
    hpli_exam_rslt_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_hpli OWNER TO gony;

--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE gscn_exam_hpli; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_hpli IS '위암_검사_HPYLORI';


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.hosp_cd IS '병원코드';


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.hpli_exam_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.hpli_exam_ymd IS 'HPYLORI검사일자';


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.hpli_exam_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.hpli_exam_seq IS 'HPYLORI검사순번';


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.hpli_exam_mtcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.hpli_exam_mtcd IS 'HPYLORI검사방법코드';


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.hpli_exam_mtnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.hpli_exam_mtnm IS 'HPYLORI검사방법명';


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.hpli_exam_rslt_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.hpli_exam_rslt_cd IS 'HPYLORI검사결과코드';


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.hpli_exam_rslt_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.hpli_exam_rslt_nm IS 'HPYLORI검사결과명';


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN gscn_exam_hpli.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_hpli.crtn_dt IS '생성일시';


--
-- TOC entry 223 (class 1259 OID 24806)
-- Name: gscn_exam_imag; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_imag (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    imex_ymd character varying(8) NOT NULL,
    imex_seq numeric(3,0) NOT NULL,
    imex_kncd character varying(20),
    imex_knnm character varying(200),
    imex_cd character varying(20),
    imex_nm character varying(200),
    imex_edi_cd character varying(20),
    imex_edi_nm character varying(300),
    imex_smct_cd character varying(200),
    imex_smct_nm character varying(1000),
    imex_rslt_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_imag OWNER TO gony;

--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE gscn_exam_imag; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_imag IS '위암_검사_영상';


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.hosp_cd IS '병원코드';


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_ymd IS '영상검사일자';


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_seq IS '영상검사순번';


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_kncd IS '영상검사종류코드';


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_knnm IS '영상검사종류명';


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_cd IS '영상검사코드';


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_nm IS '영상검사명';


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_edi_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_edi_cd IS '영상검사EDI코드';


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_edi_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_edi_nm IS '영상검사EDI명';


--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_smct_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_smct_cd IS '영상검사SNOMEDCT코드';


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_smct_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_smct_nm IS '영상검사SNOMEDCT명';


--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.imex_rslt_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.imex_rslt_cont IS '영상검사결과내용';


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gscn_exam_imag.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_imag.crtn_dt IS '생성일시';


--
-- TOC entry 224 (class 1259 OID 24813)
-- Name: gscn_exam_impt; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_impt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    imem_ymd character varying(8) NOT NULL,
    imem_seq numeric(3,0) NOT NULL,
    impt_read_ymd character varying(8),
    imem_cd character varying(20),
    imem_nm character varying(200),
    imem_kncd character varying(20),
    imem_knnm character varying(200),
    imem_mthd_cont character varying(4000),
    imem_opn_cd character varying(20),
    imem_opn_nm character varying(200),
    imem_rslt_vl character varying(200),
    imem_rslt_unit_cd character varying(20),
    imem_rslt_unit_nm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_impt OWNER TO gony;

--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE gscn_exam_impt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_impt IS '위암_검사_면역병리';


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.hosp_cd IS '병원코드';


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_ymd IS '면역병리검사일자';


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_seq IS '면역병리검사순번';


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.impt_read_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.impt_read_ymd IS '면역병리판독일자';


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_cd IS '면역병리검사코드';


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_nm IS '면역병리검사명';


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_kncd IS '면역병리검사종류코드';


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_knnm IS '면역병리검사종류명';


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_mthd_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_mthd_cont IS '면역병리검사방법내용';


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_opn_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_opn_cd IS '면역병리검사소견코드';


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_opn_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_opn_nm IS '면역병리검사소견명';


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_rslt_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_rslt_vl IS '면역병리검사결과값';


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_rslt_unit_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_rslt_unit_cd IS '면역병리검사결과단위코드';


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.imem_rslt_unit_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.imem_rslt_unit_nm IS '면역병리검사결과단위명';


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN gscn_exam_impt.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_impt.crtn_dt IS '생성일시';


--
-- TOC entry 225 (class 1259 OID 24820)
-- Name: gscn_exam_mlpt; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_mlpt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    mlem_ymd character varying(8) NOT NULL,
    mlem_seq numeric(3,0) NOT NULL,
    mlpt_read_ymd character varying(8),
    mlem_cd character varying(20),
    mlem_nm character varying(200),
    mlem_kncd character varying(20),
    mlem_knnm character varying(200),
    mlem_mthd_cont character varying(4000),
    mlem_rslt_bas_cont character varying(4000),
    mlem_opn_cd character varying(20),
    mlem_opn_nm character varying(200),
    mlem_rslt_cont character varying(4000),
    mlem_rslt_unit_cont character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_mlpt OWNER TO gony;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE gscn_exam_mlpt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_mlpt IS '위암_검사_분자병리';


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.hosp_cd IS '병원코드';


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_ymd IS '분자병리검사일자';


--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_seq IS '분자병리검사순번';


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlpt_read_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlpt_read_ymd IS '분자병리판독일자';


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_cd IS '분자병리검사코드';


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_nm IS '분자병리검사명';


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_kncd IS '분자병리검사종류코드';


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_knnm IS '분자병리검사종류명';


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_mthd_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_mthd_cont IS '분자병리검사방법내용';


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_rslt_bas_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_rslt_bas_cont IS '분자병리결과근거내용';


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_opn_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_opn_cd IS '분자병리검사소견코드';


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_opn_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_opn_nm IS '분자병리검사소견명';


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_rslt_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_rslt_cont IS '분자병리검사결과내용';


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.mlem_rslt_unit_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.mlem_rslt_unit_cont IS '분자병리검사결과단위내용';


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN gscn_exam_mlpt.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_mlpt.crtn_dt IS '생성일시';


--
-- TOC entry 226 (class 1259 OID 24827)
-- Name: gscn_exam_sgpt; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_exam_sgpt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    srgc_ptem_ymd character varying(8) NOT NULL,
    srgc_ptem_seq numeric(3,0) NOT NULL,
    sgpt_read_ymd character varying(8),
    sgpt_hvst_site_cd character varying(20),
    sgpt_hvst_site_nm character varying(200),
    srgc_ptem_rslt_tumr_cnt numeric(3,0),
    htlg_diag_cd character varying(20),
    htlg_diag_nm character varying(200),
    htlg_dfgd_cd character varying(20),
    htlg_dfgd_nm character varying(200),
    afop_crmr_tumr_loca_cd character varying(20),
    afop_crmr_tumr_loca_nm character varying(200),
    afop_lngt_1_tumr_loca_cd character varying(20),
    afop_lngt_1_tumr_loca_nm character varying(200),
    afop_lngt_2_tumr_loca_cd character varying(20),
    afop_lngt_2_tumr_loca_nm character varying(200),
    gros_tpcd character varying(20),
    gros_tpnm character varying(200),
    gros_type_cont character varying(4000),
    tumr_wdth_lnth_vl numeric(10,3),
    tumr_lgtd_lnth_vl numeric(10,3),
    tumr_hght_vl numeric(10,3),
    tumr_max_diam_vl numeric(10,3),
    iflt_orgn_cd character varying(20),
    iflt_orgn_nm character varying(200),
    inva_dgre_cd character varying(20),
    inva_dgre_nm character varying(200),
    inva_dpth_vl numeric(10,3),
    lymp_inva_ex_yn_spcd character varying(20),
    lymp_inva_ex_yn_spnm character varying(50),
    vasc_inva_ex_yn_spcd character varying(20),
    vasc_inva_ex_yn_spnm character varying(50),
    nerv_prex_ex_yn_spcd character varying(20),
    nerv_prex_ex_yn_spnm character varying(50),
    oprt_pmrg_rlcr_invl_yn_spcd character varying(20),
    oprt_pmrg_rlcr_invl_yn_spnm character varying(50),
    oprt_pmrg_size_vl numeric(10,3),
    oprt_dmrg_rlcr_invl_yn_spcd character varying(20),
    oprt_dmrg_rlcr_invl_yn_spnm character varying(50),
    oprt_dmrg_size_vl numeric(10,3),
    stes_bnst_cncr_clcd character varying(20),
    stes_bnst_cncr_clnm character varying(200),
    totl_ln_cnt numeric(3,0),
    pstv_ln_cnt character varying(100),
    ln_bylc_mtst_cont character varying(4000),
    ajcc_yr character varying(4),
    afop_path_tnm_stag_vl character varying(200),
    afop_path_t_stag_vl character varying(200),
    afop_path_n_stag_vl character varying(200),
    afop_path_m_stag_vl character varying(200),
    esd_vmrg_rlcr_pstv_yn_spcd character varying(20),
    esd_vmrg_rlcr_pstv_yn_spnm character varying(50),
    esd_vmrg_vl numeric(10,3),
    esd_hmrg_rlcr_pstv_yn_spcd character varying(20),
    esd_hmrg_rlcr_pstv_yn_spnm character varying(50),
    esd_hmrg_vl numeric(10,3),
    esd_hmrg_rlcr_lnth_vl numeric(10,3),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_exam_sgpt OWNER TO gony;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE gscn_exam_sgpt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_exam_sgpt IS '위암_검사_외과병리';


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.hosp_cd IS '병원코드';


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.srgc_ptem_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.srgc_ptem_ymd IS '외과병리검사일자';


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.srgc_ptem_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.srgc_ptem_seq IS '외과병리검사순번';


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.sgpt_read_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.sgpt_read_ymd IS '외과병리판독일자';


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.sgpt_hvst_site_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.sgpt_hvst_site_cd IS '외과병리채취부위코드';


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.sgpt_hvst_site_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.sgpt_hvst_site_nm IS '외과병리채취부위명';


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.srgc_ptem_rslt_tumr_cnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.srgc_ptem_rslt_tumr_cnt IS '외과병리검사결과종양수';


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.htlg_diag_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.htlg_diag_cd IS '조직학적진단코드';


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.htlg_diag_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.htlg_diag_nm IS '조직학적진단명';


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.htlg_dfgd_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.htlg_dfgd_cd IS '조직학적분화도코드';


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.htlg_dfgd_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.htlg_dfgd_nm IS '조직학적분화도명';


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_crmr_tumr_loca_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_crmr_tumr_loca_cd IS '수술후둘레방향종양위치코드';


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_crmr_tumr_loca_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_crmr_tumr_loca_nm IS '수술후둘레방향종양위치명';


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_lngt_1_tumr_loca_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_lngt_1_tumr_loca_cd IS '수술후종방향1종양위치코드';


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_lngt_1_tumr_loca_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_lngt_1_tumr_loca_nm IS '수술후종방향1종양위치명';


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_lngt_2_tumr_loca_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_lngt_2_tumr_loca_cd IS '수술후종방향2종양위치코드';


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_lngt_2_tumr_loca_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_lngt_2_tumr_loca_nm IS '수술후종방향2종양위치명';


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.gros_tpcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.gros_tpcd IS 'GROSS유형코드';


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.gros_tpnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.gros_tpnm IS 'GROSS유형명';


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.gros_type_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.gros_type_cont IS 'GROSS유형내용';


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.tumr_wdth_lnth_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.tumr_wdth_lnth_vl IS '종양가로길이값';


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.tumr_lgtd_lnth_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.tumr_lgtd_lnth_vl IS '종양세로길이값';


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.tumr_hght_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.tumr_hght_vl IS '종양높이값';


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.tumr_max_diam_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.tumr_max_diam_vl IS '종양최대직경값';


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.iflt_orgn_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.iflt_orgn_cd IS '침습장기코드';


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.iflt_orgn_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.iflt_orgn_nm IS '침습장기명';


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.inva_dgre_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.inva_dgre_cd IS '침윤정도코드';


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.inva_dgre_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.inva_dgre_nm IS '침윤정도명';


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.inva_dpth_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.inva_dpth_vl IS '침윤깊이값';


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.lymp_inva_ex_yn_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.lymp_inva_ex_yn_spcd IS '림프성침윤존재여부구분코드';


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.lymp_inva_ex_yn_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.lymp_inva_ex_yn_spnm IS '림프성침윤존재여부구분명';


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.vasc_inva_ex_yn_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.vasc_inva_ex_yn_spcd IS '혈관성침윤존재여부구분코드';


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.vasc_inva_ex_yn_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.vasc_inva_ex_yn_spnm IS '혈관성침윤존재여부구분명';


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.nerv_prex_ex_yn_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.nerv_prex_ex_yn_spcd IS '신경주위침윤존재여부구분코드';


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.nerv_prex_ex_yn_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.nerv_prex_ex_yn_spnm IS '신경주위침윤존재여부구분명';


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.oprt_pmrg_rlcr_invl_yn_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.oprt_pmrg_rlcr_invl_yn_spcd IS '수술근위절제면잔존암포함여부구분코드';


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.oprt_pmrg_rlcr_invl_yn_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.oprt_pmrg_rlcr_invl_yn_spnm IS '수술근위절제면잔존암포함여부구분명';


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.oprt_pmrg_size_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.oprt_pmrg_size_vl IS '수술근위절제면크기값';


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.oprt_dmrg_rlcr_invl_yn_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.oprt_dmrg_rlcr_invl_yn_spcd IS '수술원위절제면잔존암포함여부구분코드';


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.oprt_dmrg_rlcr_invl_yn_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.oprt_dmrg_rlcr_invl_yn_spnm IS '수술원위절제면잔존암포함여부구분명';


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.oprt_dmrg_size_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.oprt_dmrg_size_vl IS '수술원위절제면크기값';


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.stes_bnst_cncr_clcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.stes_bnst_cncr_clcd IS '위식도경계부위암분류코드';


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.stes_bnst_cncr_clnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.stes_bnst_cncr_clnm IS '위식도경계부위암분류명';


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.totl_ln_cnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.totl_ln_cnt IS '총림프절수';


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.pstv_ln_cnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.pstv_ln_cnt IS '양성림프절수';


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.ln_bylc_mtst_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.ln_bylc_mtst_cont IS '림프절위치별전이내용';


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.ajcc_yr; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.ajcc_yr IS 'AJCC년도';


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_path_tnm_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_path_tnm_stag_vl IS '수술후병리TNM병기값';


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_path_t_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_path_t_stag_vl IS '수술후병리T병기값';


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_path_n_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_path_n_stag_vl IS '수술후병리N병기값';


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.afop_path_m_stag_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.afop_path_m_stag_vl IS '수술후병리M병기값';


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.esd_vmrg_rlcr_pstv_yn_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.esd_vmrg_rlcr_pstv_yn_spcd IS 'ESD수직절제면잔존암양성여부구분코드';


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.esd_vmrg_rlcr_pstv_yn_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.esd_vmrg_rlcr_pstv_yn_spnm IS 'ESD수직절제면잔존암양성여부구분명';


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.esd_vmrg_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.esd_vmrg_vl IS 'ESD수직절제면값';


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.esd_hmrg_rlcr_pstv_yn_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.esd_hmrg_rlcr_pstv_yn_spcd IS 'ESD수평절제면잔존암양성여부구분코드';


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.esd_hmrg_rlcr_pstv_yn_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.esd_hmrg_rlcr_pstv_yn_spnm IS 'ESD수평절제면잔존암양성여부구분명';


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.esd_hmrg_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.esd_hmrg_vl IS 'ESD수평절제면값';


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.esd_hmrg_rlcr_lnth_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.esd_hmrg_rlcr_lnth_vl IS 'ESD수평절제면잔존암길이값';


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN gscn_exam_sgpt.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_exam_sgpt.crtn_dt IS '생성일시';


--
-- TOC entry 227 (class 1259 OID 24834)
-- Name: gscn_fuor_rlps; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_fuor_rlps (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    rldg_ymd character varying(8) NOT NULL,
    rldg_seq numeric(3,0) NOT NULL,
    rldg_mtcd character varying(20),
    rldg_mtnm character varying(200),
    rlps_site_cd character varying(20),
    rlps_site_nm character varying(200),
    rlps_kncd character varying(20),
    rlps_knnm character varying(200),
    rlps_trtm_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_fuor_rlps OWNER TO gony;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE gscn_fuor_rlps; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_fuor_rlps IS '위암_추적관찰_재발';


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.hosp_cd IS '병원코드';


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rldg_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rldg_ymd IS '재발진단일자';


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rldg_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rldg_seq IS '재발진단순번';


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rldg_mtcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rldg_mtcd IS '재발진단방법코드';


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rldg_mtnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rldg_mtnm IS '재발진단방법명';


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rlps_site_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rlps_site_cd IS '재발부위코드';


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rlps_site_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rlps_site_nm IS '재발부위명';


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rlps_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rlps_kncd IS '재발종류코드';


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rlps_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rlps_knnm IS '재발종류명';


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.rlps_trtm_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.rlps_trtm_cont IS '재발치료내용';


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN gscn_fuor_rlps.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_fuor_rlps.crtn_dt IS '생성일시';


--
-- TOC entry 228 (class 1259 OID 24841)
-- Name: gscn_pt_fmht; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_pt_fmht (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    fmht_rcrd_ymd character varying(8) NOT NULL,
    fmht_rcrd_seq numeric(3,0) NOT NULL,
    fmht_yn_noans_spcd character varying(20),
    fmht_yn_noans_spnm character varying(50),
    pt_fm_rlcd character varying(20),
    pt_fm_rlnm character varying(200),
    pt_fmrl_etc_cont character varying(4000),
    fmhs_htn_yn_noans_spcd character varying(20),
    fmhs_htn_yn_noans_spnm character varying(50),
    fmhs_dbt_yn_noans_spcd character varying(20),
    fmhs_dbt_yn_noans_spnm character varying(50),
    fmht_tb_yn_noans_spcd character varying(20),
    fmht_tb_yn_noans_spnm character varying(50),
    fmhs_lvds_yn_noans_spcd character varying(20),
    fmhs_lvds_yn_noans_spnm character varying(50),
    fmhs_cncr_yn_noans_spcd character varying(20),
    fmhs_cncr_yn_noans_spnm character varying(50),
    fmht_cncr_kncd character varying(20),
    fmht_cncr_knnm character varying(200),
    fmht_cncr_kind_etc_cont character varying(4000),
    fmhs_etc_yn_noans_spcd character varying(20),
    fmhs_etc_yn_noans_spnm character varying(50),
    fmhs_etc_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_pt_fmht OWNER TO gony;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE gscn_pt_fmht; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_pt_fmht IS '위암_환자_가족력';


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.hosp_cd IS '병원코드';


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_rcrd_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_rcrd_ymd IS '가족력기록일자';


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_rcrd_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_rcrd_seq IS '가족력기록순번';


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_yn_noans_spcd IS '가족력여부무응답구분코드';


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_yn_noans_spnm IS '가족력여부무응답구분명';


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.pt_fm_rlcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.pt_fm_rlcd IS '환자가족관계코드';


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.pt_fm_rlnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.pt_fm_rlnm IS '환자가족관계명';


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.pt_fmrl_etc_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.pt_fmrl_etc_cont IS '환자가족관계기타내용';


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_htn_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_htn_yn_noans_spcd IS '가족병력고혈압여부무응답구분코드';


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_htn_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_htn_yn_noans_spnm IS '가족병력고혈압여부무응답구분명';


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_dbt_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_dbt_yn_noans_spcd IS '가족병력당뇨여부무응답구분코드';


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_dbt_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_dbt_yn_noans_spnm IS '가족병력당뇨여부무응답구분명';


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_tb_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_tb_yn_noans_spcd IS '가족력결핵여부무응답구분코드';


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_tb_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_tb_yn_noans_spnm IS '가족력결핵여부무응답구분명';


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_lvds_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_lvds_yn_noans_spcd IS '가족병력간질환여부무응답구분코드';


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_lvds_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_lvds_yn_noans_spnm IS '가족병력간질환여부무응답구분명';


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_cncr_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_cncr_yn_noans_spcd IS '가족병력암여부무응답구분코드';


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_cncr_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_cncr_yn_noans_spnm IS '가족병력암여부무응답구분명';


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_cncr_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_cncr_kncd IS '가족력암종류코드';


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_cncr_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_cncr_knnm IS '가족력암종류명';


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmht_cncr_kind_etc_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmht_cncr_kind_etc_cont IS '가족력암종류기타내용';


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_etc_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_etc_yn_noans_spcd IS '가족병력기타여부무응답구분코드';


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_etc_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_etc_yn_noans_spnm IS '가족병력기타여부무응답구분명';


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.fmhs_etc_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.fmhs_etc_cont IS '가족병력기타내용';


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN gscn_pt_fmht.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_fmht.crtn_dt IS '생성일시';


--
-- TOC entry 229 (class 1259 OID 24848)
-- Name: gscn_pt_hlinf; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_pt_hlinf (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    adm_ymd character varying(8) NOT NULL,
    hlinf_seq numeric(3,0) NOT NULL,
    dsch_ymd character varying(8),
    cur_drnk_yn_noans_spcd character varying(20),
    cur_drnk_yn_noans_spnm character varying(50),
    dhis_yn_noans_spcd character varying(20),
    dhis_yn_noans_spnm character varying(50),
    drnk_strt_age_vl character varying(100),
    drnk_kncd character varying(20),
    drnk_knnm character varying(200),
    drnk_qty character varying(100),
    drnk_nt character varying(100),
    drnk_dtrn_ycnt character varying(100),
    ndrk_strt_yr character varying(4),
    cur_smok_yn_noans_spcd character varying(100),
    cur_smok_yn_noans_spnm character varying(50),
    shis_yn_noans_spcd character varying(20),
    shis_yn_noans_spnm character varying(50),
    smok_strt_age_vl character varying(100),
    smok_dtrn_ycnt character varying(100),
    smok_qty character varying(200),
    nsmk_strt_yr character varying(4),
    mhis_yn_noans_spcd character varying(20),
    mhis_yn_noans_spnm character varying(50),
    mhis_hl_yn_noans_spcd character varying(20),
    mhis_hl_yn_noans_spnm character varying(50),
    mhis_htn_yn_noans_spcd character varying(20),
    mhis_htn_yn_noans_spnm character varying(50),
    mhis_dbt_yn_noans_spcd character varying(20),
    mhis_dbt_yn_noans_spnm character varying(50),
    mhis_tb_yn_noans_spcd character varying(20),
    mhis_tb_yn_noans_spnm character varying(50),
    mhis_lvds_yn_noans_spcd character varying(20),
    mhis_lvds_yn_noans_spnm character varying(50),
    mhis_cncr_yn_noans_spcd character varying(20),
    mhis_cncr_yn_noans_spnm character varying(50),
    mhis_cncr_kncd character varying(20),
    mhis_cncr_knnm character varying(200),
    mhis_depr_yn_noans_spcd character varying(20),
    mhis_depr_yn_noans_spnm character varying(50),
    mhis_insm_yn_noans_spcd character varying(20),
    mhis_insm_yn_noans_spnm character varying(50),
    mhis_cads_yn_noans_spcd character varying(20),
    mhis_cads_yn_noans_spnm character varying(50),
    etc_mhis_yn_noans_spcd character varying(20),
    etc_mhis_yn_noans_spnm character varying(50),
    etc_mhis_diss_cont character varying(4000),
    main_sym_cont character varying(4000),
    main_sym_yn_noans_spcd character varying(20),
    main_sym_yn_noans_spnm character varying(50),
    ohad_hstr_yn_noans_spcd character varying(20),
    ohad_hstr_yn_noans_spnm character varying(50),
    dsch_stcd character varying(20),
    dsch_stnm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_pt_hlinf OWNER TO gony;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE gscn_pt_hlinf; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_pt_hlinf IS '위암_환자_건강정보';


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.hosp_cd IS '병원코드';


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.adm_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.adm_ymd IS '입원일자';


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.hlinf_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.hlinf_seq IS '건강정보순번';


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.dsch_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.dsch_ymd IS '퇴원일자';


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.cur_drnk_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.cur_drnk_yn_noans_spcd IS '현재음주여부무응답구분코드';


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.cur_drnk_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.cur_drnk_yn_noans_spnm IS '현재음주여부무응답구분명';


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.dhis_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.dhis_yn_noans_spcd IS '음주력여부무응답구분코드';


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.dhis_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.dhis_yn_noans_spnm IS '음주력여부무응답구분명';


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.drnk_strt_age_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.drnk_strt_age_vl IS '음주시작연령값';


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.drnk_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.drnk_kncd IS '음주종류코드';


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.drnk_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.drnk_knnm IS '음주종류명';


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.drnk_qty; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.drnk_qty IS '음주량';


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.drnk_nt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.drnk_nt IS '음주횟수';


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.drnk_dtrn_ycnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.drnk_dtrn_ycnt IS '음주기간년수';


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.ndrk_strt_yr; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.ndrk_strt_yr IS '금주시작년도';


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.cur_smok_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.cur_smok_yn_noans_spcd IS '현재흡연여부무응답구분코드';


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.cur_smok_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.cur_smok_yn_noans_spnm IS '현재흡연여부무응답구분명';


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.shis_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.shis_yn_noans_spcd IS '흡연력여부무응답구분코드';


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.shis_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.shis_yn_noans_spnm IS '흡연력여부무응답구분명';


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.smok_strt_age_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.smok_strt_age_vl IS '흡연시작연령값';


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.smok_dtrn_ycnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.smok_dtrn_ycnt IS '흡연기간년수';


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.smok_qty; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.smok_qty IS '흡연량';


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.nsmk_strt_yr; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.nsmk_strt_yr IS '금연시작년도';


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_yn_noans_spcd IS '병력여부무응답구분코드';


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_yn_noans_spnm IS '병력여부무응답구분명';


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_hl_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_hl_yn_noans_spcd IS '병력고지혈증여부무응답구분코드';


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_hl_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_hl_yn_noans_spnm IS '병력고지혈증여부무응답구분명';


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_htn_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_htn_yn_noans_spcd IS '병력고혈압여부무응답구분코드';


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_htn_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_htn_yn_noans_spnm IS '병력고혈압여부무응답구분명';


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_dbt_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_dbt_yn_noans_spcd IS '병력당뇨여부무응답구분코드';


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_dbt_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_dbt_yn_noans_spnm IS '병력당뇨여부무응답구분명';


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_tb_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_tb_yn_noans_spcd IS '병력결핵여부무응답구분코드';


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_tb_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_tb_yn_noans_spnm IS '병력결핵여부무응답구분명';


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_lvds_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_lvds_yn_noans_spcd IS '병력간질환여부무응답구분코드';


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_lvds_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_lvds_yn_noans_spnm IS '병력간질환여부무응답구분명';


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_cncr_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_cncr_yn_noans_spcd IS '병력암여부무응답구분코드';


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_cncr_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_cncr_yn_noans_spnm IS '병력암여부무응답구분명';


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_cncr_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_cncr_kncd IS '병력암종류코드';


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_cncr_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_cncr_knnm IS '병력암종류명';


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_depr_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_depr_yn_noans_spcd IS '병력우울증여부무응답구분코드';


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_depr_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_depr_yn_noans_spnm IS '병력우울증여부무응답구분명';


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_insm_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_insm_yn_noans_spcd IS '병력불면증여부무응답구분코드';


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_insm_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_insm_yn_noans_spnm IS '병력불면증여부무응답구분명';


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_cads_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_cads_yn_noans_spcd IS '병력심장질환여부무응답구분코드';


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.mhis_cads_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.mhis_cads_yn_noans_spnm IS '병력심장질환여부무응답구분명';


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.etc_mhis_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.etc_mhis_yn_noans_spcd IS '기타병력여부무응답구분코드';


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.etc_mhis_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.etc_mhis_yn_noans_spnm IS '기타병력여부무응답구분명';


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.etc_mhis_diss_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.etc_mhis_diss_cont IS '기타병력질환내용';


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.main_sym_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.main_sym_cont IS '주증상내용';


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.main_sym_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.main_sym_yn_noans_spcd IS '주증상여부무응답구분코드';


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.main_sym_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.main_sym_yn_noans_spnm IS '주증상여부무응답구분명';


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.ohad_hstr_yn_noans_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.ohad_hstr_yn_noans_spcd IS '타병원진단후전원여부무응답구분코드';


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.ohad_hstr_yn_noans_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.ohad_hstr_yn_noans_spnm IS '타병원진단후전원여부무응답구분명';


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.dsch_stcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.dsch_stcd IS '퇴원상태코드';


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.dsch_stnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.dsch_stnm IS '퇴원상태명';


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN gscn_pt_hlinf.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_pt_hlinf.crtn_dt IS '생성일시';


--
-- TOC entry 230 (class 1259 OID 24855)
-- Name: gscn_trtm_antp; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_trtm_antp (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    antp_strt_ymd character varying(8) NOT NULL,
    antp_seq numeric(3,0) NOT NULL,
    antp_end_ymd character varying(8),
    antp_line_cnt numeric(3,0),
    antp_totl_cycl_cnt numeric(3,0),
    antp_trtm_prps_cd character varying(20),
    antp_trtm_prps_nm character varying(200),
    antp_nm character varying(200),
    antp_temp_stop_yn_unid_spcd character varying(20),
    antp_temp_stop_yn_unid_spnm character varying(50),
    antp_end_resn_cd character varying(20),
    antp_end_resn_nm character varying(200),
    antp_asmt_ymd character varying(8),
    antp_asmt_item_cd character varying(20),
    antp_asmt_item_nm character varying(200),
    antp_seff_cd character varying(20),
    antp_seff_nm character varying(200),
    antp_seff_grcd character varying(20),
    antp_seff_grnm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_trtm_antp OWNER TO gony;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE gscn_trtm_antp; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_trtm_antp IS '위암_치료_항암요법';


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.hosp_cd IS '병원코드';


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_strt_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_strt_ymd IS '항암요법시작일자';


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_seq IS '항암요법순번';


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_end_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_end_ymd IS '항암요법종료일자';


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_line_cnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_line_cnt IS '항암요법라인수';


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_totl_cycl_cnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_totl_cycl_cnt IS '항암요법총주기수';


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_trtm_prps_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_trtm_prps_cd IS '항암요법치료목적코드';


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_trtm_prps_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_trtm_prps_nm IS '항암요법치료목적명';


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_nm IS '항암요법명';


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_temp_stop_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_temp_stop_yn_unid_spcd IS '항암요법임시중단여부확인불가구분코드';


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_temp_stop_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_temp_stop_yn_unid_spnm IS '항암요법임시중단여부확인불가구분명';


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_end_resn_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_end_resn_cd IS '항암요법종료이유코드';


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_end_resn_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_end_resn_nm IS '항암요법종료이유명';


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_asmt_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_asmt_ymd IS '항암요법평가일자';


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_asmt_item_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_asmt_item_cd IS '항암요법평가항목코드';


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_asmt_item_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_asmt_item_nm IS '항암요법평가항목명';


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_seff_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_seff_cd IS '항암요법부작용코드';


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_seff_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_seff_nm IS '항암요법부작용명';


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_seff_grcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_seff_grcd IS '항암요법부작용등급코드';


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.antp_seff_grnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.antp_seff_grnm IS '항암요법부작용등급명';


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN gscn_trtm_antp.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_antp.crtn_dt IS '생성일시';


--
-- TOC entry 231 (class 1259 OID 24862)
-- Name: gscn_trtm_bltr; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_trtm_bltr (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    bltr_prsc_ymd character varying(8) NOT NULL,
    bltr_prsc_seq numeric(3,0) NOT NULL,
    blpt_kncd character varying(20),
    blpt_knnm character varying(200),
    blpt_cd character varying(20),
    blpt_nm character varying(200),
    bltr_pack_cnt numeric(3,0),
    bltr_totl_qty numeric(8,0),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_trtm_bltr OWNER TO gony;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE gscn_trtm_bltr; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_trtm_bltr IS '위암_치료_수혈';


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.hosp_cd IS '병원코드';


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.bltr_prsc_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.bltr_prsc_ymd IS '수혈처방일자';


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.bltr_prsc_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.bltr_prsc_seq IS '수혈처방순번';


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.blpt_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.blpt_kncd IS '혈액제제종류코드';


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.blpt_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.blpt_knnm IS '혈액제제종류명';


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.blpt_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.blpt_cd IS '혈액제제코드';


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.blpt_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.blpt_nm IS '혈액제제명';


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.bltr_pack_cnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.bltr_pack_cnt IS '수혈팩수';


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.bltr_totl_qty; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.bltr_totl_qty IS '수혈총량';


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN gscn_trtm_bltr.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_bltr.crtn_dt IS '생성일시';


--
-- TOC entry 232 (class 1259 OID 24867)
-- Name: gscn_trtm_drin; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_trtm_drin (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    drug_prsc_ymd character varying(8) NOT NULL,
    drug_prsc_seq numeric(3,0) NOT NULL,
    drug_clcd character varying(20),
    drug_clnm character varying(200),
    drug_spcd character varying(20),
    drug_spnm character varying(200),
    drin_kncd character varying(20),
    drin_knnm character varying(200),
    drin_cd character varying(20),
    drin_nm character varying(200),
    drin_smct_cd character varying(200),
    drin_smct_nm character varying(1000),
    drug_cd character varying(20),
    drug_nm character varying(200),
    drug_edi_cd character varying(20),
    drug_edi_nm character varying(200),
    drug_atc_cd character varying(20),
    drug_atc_nm character varying(200),
    drug_rxnm_cd character varying(20),
    drug_rxnm_nm character varying(200),
    drug_prsc_capa character varying(50),
    drug_prsc_dcnt numeric(6,0),
    drug_injc_pth_cd character varying(20),
    drug_injc_pth_nm character varying(200),
    drug_prsc_capa_unit_cd character varying(20),
    drug_prsc_capa_unit_nm character varying(200),
    drug_mdct_dtrn_mcnt numeric(10,3),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_trtm_drin OWNER TO gony;

--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE gscn_trtm_drin; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_trtm_drin IS '위암_치료_약제성분';


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.hosp_cd IS '병원코드';


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_prsc_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_prsc_ymd IS '약제처방일자';


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_prsc_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_prsc_seq IS '약제처방순번';


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_clcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_clcd IS '약제분류코드';


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_clnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_clnm IS '약제분류명';


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_spcd IS '약제구분코드';


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_spnm IS '약제구분명';


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drin_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drin_kncd IS '약제성분종류코드';


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drin_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drin_knnm IS '약제성분종류명';


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drin_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drin_cd IS '약제성분코드';


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drin_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drin_nm IS '약제성분명';


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drin_smct_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drin_smct_cd IS '약제성분SNOMEDCT코드';


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drin_smct_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drin_smct_nm IS '약제성분SNOMEDCT명';


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_cd IS '약제코드';


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_nm IS '약제명';


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_edi_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_edi_cd IS '약제EDI코드';


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_edi_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_edi_nm IS '약제EDI명';


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_atc_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_atc_cd IS '약제ATC코드';


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_atc_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_atc_nm IS '약제ATC명';


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_rxnm_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_rxnm_cd IS '약제RXNORM코드';


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_rxnm_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_rxnm_nm IS '약제RXNORM명';


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_prsc_capa; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_prsc_capa IS '약제처방용량';


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_prsc_dcnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_prsc_dcnt IS '약제처방일수';


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_injc_pth_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_injc_pth_cd IS '약제투여경로코드';


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_injc_pth_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_injc_pth_nm IS '약제투여경로명';


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_prsc_capa_unit_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_prsc_capa_unit_cd IS '약제처방용량단위코드';


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_prsc_capa_unit_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_prsc_capa_unit_nm IS '약제처방용량단위명';


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.drug_mdct_dtrn_mcnt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.drug_mdct_dtrn_mcnt IS '약제투약기간월수';


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN gscn_trtm_drin.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_drin.crtn_dt IS '생성일시';


--
-- TOC entry 233 (class 1259 OID 24874)
-- Name: gscn_trtm_oprt; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_trtm_oprt (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    oprt_ymd character varying(8) NOT NULL,
    oprt_seq numeric(3,0) NOT NULL,
    oprt_kncd character varying(20),
    oprt_knnm character varying(200),
    oprt_cd character varying(20),
    oprt_nm character varying(500),
    oprt_edi_cd character varying(20),
    oprt_edi_nm character varying(200),
    oprt_smct_cd character varying(200),
    oprt_smct_nm character varying(1000),
    oprt_icd9cm_cd character varying(20),
    oprt_icd9cm_nm character varying(1000),
    oprt_ldtm character varying(20),
    oprt_prps_cd character varying(20),
    oprt_prps_nm character varying(200),
    oprt_mtcd character varying(20),
    oprt_mtnm character varying(200),
    oprt_anst_site_cd character varying(20),
    oprt_anst_site_nm character varying(200),
    asa_scor_cd character varying(20),
    asa_scor_nm character varying(200),
    oprt_incs_mtcd character varying(20),
    oprt_incs_mtnm character varying(200),
    oprt_crmr_tumr_loca_cd character varying(20),
    oprt_crmr_tumr_loca_nm character varying(200),
    oprt_lngt_1_tumr_loca_cd character varying(20),
    oprt_lngt_1_tumr_loca_nm character varying(200),
    oprt_lngt_2_tumr_loca_cd character varying(20),
    oprt_lngt_2_tumr_loca_nm character varying(200),
    diag_lpex_yn_unid_spcd character varying(20),
    diag_lpex_yn_unid_spnm character varying(50),
    oprm_ensp_use_yn_unid_spcd character varying(20),
    oprm_ensp_use_yn_unid_spnm character varying(50),
    flrn_imag_use_yn_unid_spcd character varying(20),
    flrn_imag_use_yn_unid_spnm character varying(50),
    inop_antp_cd character varying(20),
    inop_antp_nm character varying(200),
    adh_ibtr_use_yn_unid_spcd character varying(20),
    adh_ibtr_use_yn_unid_spnm character varying(50),
    adh_ibtr_gods_nm character varying(200),
    omnl_srmv_rang_cd character varying(20),
    omnl_srmv_rang_nm character varying(200),
    curdg_cd character varying(20),
    curdg_nm character varying(200),
    ln_srmv_dgre_cd character varying(20),
    ln_srmv_dgre_nm character varying(200),
    ln_srmv_dgre_detl_cont character varying(4000),
    mrge_srmv_site_cd character varying(20),
    mrge_srmv_site_nm character varying(200),
    repr_kncd character varying(20),
    repr_knnm character varying(200),
    repr_use_dvce_nm character varying(200),
    repr_mtcd character varying(20),
    repr_mtnm character varying(200),
    repr_aprmthd_cd character varying(20),
    repr_aprmthd_nm character varying(200),
    oprt_ebl_qty numeric(5,0),
    asct_yn_unid_spcd character varying(20),
    asct_yn_unid_spnm character varying(50),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_trtm_oprt OWNER TO gony;

--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE gscn_trtm_oprt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_trtm_oprt IS '위암_치료_수술';


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.hosp_cd IS '병원코드';


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_ymd IS '수술일자';


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_seq IS '수술순번';


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_kncd IS '수술종류코드';


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_knnm IS '수술종류명';


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_cd IS '수술코드';


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_nm IS '수술명';


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_edi_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_edi_cd IS '수술EDI코드';


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_edi_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_edi_nm IS '수술EDI명';


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_smct_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_smct_cd IS '수술SNOMEDCT코드';


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_smct_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_smct_nm IS '수술SNOMEDCT명';


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_icd9cm_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_icd9cm_cd IS '수술ICD9CM코드';


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_icd9cm_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_icd9cm_nm IS '수술ICD9CM명';


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_ldtm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_ldtm IS '수술소요시간';


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_prps_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_prps_cd IS '수술목적코드';


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_prps_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_prps_nm IS '수술목적명';


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_mtcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_mtcd IS '수술방법코드';


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_mtnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_mtnm IS '수술방법명';


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_anst_site_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_anst_site_cd IS '수술마취부위코드';


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_anst_site_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_anst_site_nm IS '수술마취부위명';


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.asa_scor_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.asa_scor_cd IS 'ASA점수코드';


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.asa_scor_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.asa_scor_nm IS 'ASA점수명';


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_incs_mtcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_incs_mtcd IS '수술절개방법코드';


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_incs_mtnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_incs_mtnm IS '수술절개방법명';


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_crmr_tumr_loca_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_crmr_tumr_loca_cd IS '수술둘레방향종양위치코드';


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_crmr_tumr_loca_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_crmr_tumr_loca_nm IS '수술둘레방향종양위치명';


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_lngt_1_tumr_loca_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_lngt_1_tumr_loca_cd IS '수술종방향1종양위치코드';


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_lngt_1_tumr_loca_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_lngt_1_tumr_loca_nm IS '수술종방향1종양위치명';


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_lngt_2_tumr_loca_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_lngt_2_tumr_loca_cd IS '수술종방향2종양위치코드';


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_lngt_2_tumr_loca_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_lngt_2_tumr_loca_nm IS '수술종방향2종양위치명';


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.diag_lpex_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.diag_lpex_yn_unid_spcd IS '진단복강경검사여부확인불가구분코드';


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.diag_lpex_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.diag_lpex_yn_unid_spnm IS '진단복강경검사여부확인불가구분명';


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprm_ensp_use_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprm_ensp_use_yn_unid_spcd IS '수술장내시경사용여부확인불가구분코드';


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprm_ensp_use_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprm_ensp_use_yn_unid_spnm IS '수술장내시경사용여부확인불가구분명';


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.flrn_imag_use_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.flrn_imag_use_yn_unid_spcd IS '형광영상사용여부확인불가구분코드';


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.flrn_imag_use_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.flrn_imag_use_yn_unid_spnm IS '형광영상사용여부확인불가구분명';


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.inop_antp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.inop_antp_cd IS '수술시항암요법코드';


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.inop_antp_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.inop_antp_nm IS '수술시항암요법명';


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.adh_ibtr_use_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.adh_ibtr_use_yn_unid_spcd IS '유착방지제사용여부확인불가구분코드';


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.adh_ibtr_use_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.adh_ibtr_use_yn_unid_spnm IS '유착방지제사용여부확인불가구분명';


--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.adh_ibtr_gods_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.adh_ibtr_gods_nm IS '유착방지제제품명';


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.omnl_srmv_rang_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.omnl_srmv_rang_cd IS '그물막절제범위코드';


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.omnl_srmv_rang_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.omnl_srmv_rang_nm IS '그물막절제범위명';


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.curdg_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.curdg_cd IS '근치도코드';


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.curdg_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.curdg_nm IS '근치도명';


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.ln_srmv_dgre_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.ln_srmv_dgre_cd IS '림프절절제정도코드';


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.ln_srmv_dgre_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.ln_srmv_dgre_nm IS '림프절절제정도명';


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.ln_srmv_dgre_detl_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.ln_srmv_dgre_detl_cont IS '림프절절제정도상세내용';


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.mrge_srmv_site_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.mrge_srmv_site_cd IS '합병절제부위코드';


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.mrge_srmv_site_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.mrge_srmv_site_nm IS '합병절제부위명';


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.repr_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.repr_kncd IS '재건술종류코드';


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.repr_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.repr_knnm IS '재건술종류명';


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.repr_use_dvce_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.repr_use_dvce_nm IS '재건술사용도구명';


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.repr_mtcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.repr_mtcd IS '재건술방법코드';


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.repr_mtnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.repr_mtnm IS '재건술방법명';


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.repr_aprmthd_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.repr_aprmthd_cd IS '재건술접근법코드';


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.repr_aprmthd_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.repr_aprmthd_nm IS '재건술접근법명';


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.oprt_ebl_qty; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.oprt_ebl_qty IS '수술추정실혈량';


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.asct_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.asct_yn_unid_spcd IS '복수여부확인불가구분코드';


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.asct_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.asct_yn_unid_spnm IS '복수여부확인불가구분명';


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN gscn_trtm_oprt.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_oprt.crtn_dt IS '생성일시';


--
-- TOC entry 234 (class 1259 OID 24881)
-- Name: gscn_trtm_rd; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_trtm_rd (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    rdt_prsc_ymd character varying(8) NOT NULL,
    rdt_prsc_seq numeric(3,0) NOT NULL,
    rdt_kncd character varying(20),
    rdt_knnm character varying(200),
    rdt_cd character varying(20),
    rdt_nm character varying(200),
    rdt_edi_cd character varying(20),
    rdt_edi_nm character varying(200),
    rdt_smct_cd character varying(200),
    rdt_smct_nm character varying(1000),
    rdt_prps_cd character varying(20),
    rdt_prps_nm character varying(200),
    rdt_site_cd character varying(20),
    rdt_site_nm character varying(200),
    byst_rd_impl_nt numeric(3,0),
    rd_gy numeric(10,3),
    byst_rd_totl_gy numeric(10,3),
    rdt_asmt_ymd character varying(8),
    rdt_asmt_item_cd character varying(20),
    rdt_asmt_item_nm character varying(200),
    rdt_seff_perd_spcd character varying(20),
    rdt_seff_perd_spnm character varying(200),
    rdt_seff_kncd character varying(20),
    rdt_seff_knnm character varying(200),
    rdt_seff_grcd character varying(20),
    rdt_seff_grnm character varying(200),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_trtm_rd OWNER TO gony;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE gscn_trtm_rd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_trtm_rd IS '위암_치료_방사선';


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.hosp_cd IS '병원코드';


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_prsc_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_prsc_ymd IS '방사선치료처방일자';


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_prsc_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_prsc_seq IS '방사선치료처방순번';


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_kncd IS '방사선치료종류코드';


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_knnm IS '방사선치료종류명';


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_cd IS '방사선치료코드';


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_nm IS '방사선치료명';


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_edi_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_edi_cd IS '방사선치료EDI코드';


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_edi_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_edi_nm IS '방사선치료EDI명';


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_smct_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_smct_cd IS '방사선치료SNOMEDCT코드';


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_smct_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_smct_nm IS '방사선치료SNOMEDCT명';


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_prps_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_prps_cd IS '방사선치료목적코드';


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_prps_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_prps_nm IS '방사선치료목적명';


--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_site_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_site_cd IS '방사선치료부위코드';


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_site_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_site_nm IS '방사선치료부위명';


--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.byst_rd_impl_nt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.byst_rd_impl_nt IS '부위별방사선시행횟수';


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rd_gy; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rd_gy IS '방사선선량';


--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.byst_rd_totl_gy; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.byst_rd_totl_gy IS '부위별방사선총선량';


--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_asmt_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_asmt_ymd IS '방사선치료평가일자';


--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_asmt_item_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_asmt_item_cd IS '방사선치료평가항목코드';


--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_asmt_item_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_asmt_item_nm IS '방사선치료평가항목명';


--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_seff_perd_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_seff_perd_spcd IS '방사선치료부작용시기구분코드';


--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_seff_perd_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_seff_perd_spnm IS '방사선치료부작용시기구분명';


--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_seff_kncd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_seff_kncd IS '방사선치료부작용종류코드';


--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_seff_knnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_seff_knnm IS '방사선치료부작용종류명';


--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_seff_grcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_seff_grcd IS '방사선치료부작용등급코드';


--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.rdt_seff_grnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.rdt_seff_grnm IS '방사선치료부작용등급명';


--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN gscn_trtm_rd.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_rd.crtn_dt IS '생성일시';


--
-- TOC entry 235 (class 1259 OID 24888)
-- Name: gscn_trtm_srpr; Type: TABLE; Schema: cancle_stomach; Owner: gony
--

CREATE TABLE cancle_stomach.gscn_trtm_srpr (
    hosp_cd character varying(20) NOT NULL,
    pt_sbst_no character varying(10) NOT NULL,
    esd_srpr_ymd character varying(8) NOT NULL,
    esd_srpr_seq numeric(3,0) NOT NULL,
    esd_srpr_strt_dt timestamp without time zone NOT NULL,
    esd_srpr_end_dt timestamp without time zone NOT NULL,
    esd_lesn_size_vl numeric(10,3),
    esd_lesn_shap_cd character varying(20),
    esd_lesn_shap_nm character varying(200),
    esd_lesn_loca_wdth_cd character varying(20),
    esd_lesn_loca_wdth_nm character varying(200),
    esd_lesn_loca_lgtd_cd character varying(20),
    esd_lesn_loca_lgtd_nm character varying(200),
    esd_ulcr_yn_unid_spcd character varying(20),
    esd_ulcr_yn_unid_spnm character varying(50),
    esd_perf_yn_unid_spcd character varying(20),
    esd_perf_yn_unid_spnm character varying(50),
    esd_perf_msre_cd character varying(20),
    esd_perf_msre_nm character varying(200),
    esd_rslt_cd character varying(20),
    esd_rslt_nm character varying(200),
    esd_opn_cont character varying(4000),
    esd_rslt_cont character varying(4000),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE cancle_stomach.gscn_trtm_srpr OWNER TO gony;

--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE gscn_trtm_srpr; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON TABLE cancle_stomach.gscn_trtm_srpr IS '위암_치료_시술';


--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.hosp_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.hosp_cd IS '병원코드';


--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.pt_sbst_no; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.pt_sbst_no IS '환자대체번호';


--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_srpr_ymd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_srpr_ymd IS 'ESD시술일자';


--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_srpr_seq; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_srpr_seq IS 'ESD시술순번';


--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_srpr_strt_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_srpr_strt_dt IS 'ESD시술시작일시';


--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_srpr_end_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_srpr_end_dt IS 'ESD시술종료일시';


--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_lesn_size_vl; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_lesn_size_vl IS 'ESD병변크기값';


--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_lesn_shap_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_lesn_shap_cd IS 'ESD병변모양코드';


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_lesn_shap_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_lesn_shap_nm IS 'ESD병변모양명';


--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_lesn_loca_wdth_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_lesn_loca_wdth_cd IS 'ESD병변위치가로코드';


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_lesn_loca_wdth_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_lesn_loca_wdth_nm IS 'ESD병변위치가로명';


--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_lesn_loca_lgtd_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_lesn_loca_lgtd_cd IS 'ESD병변위치세로코드';


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_lesn_loca_lgtd_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_lesn_loca_lgtd_nm IS 'ESD병변위치세로명';


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_ulcr_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_ulcr_yn_unid_spcd IS 'ESD궤양여부확인불가구분코드';


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_ulcr_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_ulcr_yn_unid_spnm IS 'ESD궤양여부확인불가구분명';


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_perf_yn_unid_spcd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_perf_yn_unid_spcd IS 'ESD천공여부확인불가구분코드';


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_perf_yn_unid_spnm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_perf_yn_unid_spnm IS 'ESD천공여부확인불가구분명';


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_perf_msre_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_perf_msre_cd IS 'ESD천공조치코드';


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_perf_msre_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_perf_msre_nm IS 'ESD천공조치명';


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_rslt_cd; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_rslt_cd IS 'ESD결과코드';


--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_rslt_nm; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_rslt_nm IS 'ESD결과명';


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_opn_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_opn_cont IS 'ESD소견내용';


--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.esd_rslt_cont; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.esd_rslt_cont IS 'ESD결과내용';


--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN gscn_trtm_srpr.crtn_dt; Type: COMMENT; Schema: cancle_stomach; Owner: gony
--

COMMENT ON COLUMN cancle_stomach.gscn_trtm_srpr.crtn_dt IS '생성일시';


--
-- TOC entry 258 (class 1259 OID 25050)
-- Name: cncr_code_meta; Type: TABLE; Schema: public; Owner: gony
--

CREATE TABLE public.cncr_code_meta (
    hosp_cd character varying(20) NOT NULL,
    cd_clcd character varying(20) NOT NULL,
    cd_id character varying(20) NOT NULL,
    cd_nm character varying(200) NOT NULL,
    cd_vl character varying(200) NOT NULL,
    cd_vl_nm character varying(200) NOT NULL,
    arry_ord_vl numeric(10,0) NOT NULL,
    cd_expl_cont character varying(4000),
    crtn_dt timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.cncr_code_meta OWNER TO gony;

--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE cncr_code_meta; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON TABLE public.cncr_code_meta IS '암_코드_메타';


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.hosp_cd; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.hosp_cd IS '병원코드';


--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.cd_clcd; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.cd_clcd IS '코드분류코드';


--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.cd_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.cd_id IS '코드ID';


--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.cd_nm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.cd_nm IS '코드명';


--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.cd_vl; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.cd_vl IS '코드값';


--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.cd_vl_nm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.cd_vl_nm IS '코드값명';


--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.arry_ord_vl; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.arry_ord_vl IS '정렬순서값';


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.cd_expl_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.cd_expl_cont IS '코드설명내용';


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN cncr_code_meta.crtn_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_code_meta.crtn_dt IS '생성일시';


--
-- TOC entry 259 (class 1259 OID 25060)
-- Name: cncr_rgst; Type: TABLE; Schema: public; Owner: gony
--

CREATE TABLE public.cncr_rgst (
    hcode character varying(20) NOT NULL,
    ptno character varying(15) NOT NULL,
    fdx character varying(8) NOT NULL,
    cncr_rgst_seq numeric(3,0) NOT NULL,
    brth character varying(6),
    age character varying(3),
    sex character varying(20),
    popcode character varying(20),
    popname character varying(50),
    frgcode character varying(20),
    frgname character varying(50),
    hmlscode character varying(20),
    hmlsname character varying(50),
    jobcode character varying(20),
    jobname character varying(50),
    job1 character varying(50),
    unknownjob character varying(50),
    visitpathcode character varying(20),
    visitpathname character varying(50),
    visitpath_desc character varying(50),
    tcode character varying(20),
    tcode1 character varying(200),
    tcode2 character varying(200),
    latercode character varying(20),
    latername character varying(100),
    mcode character varying(20),
    mcode1 character varying(200),
    mcode2 character varying(200),
    bunhwadocode character varying(20),
    bunhwadoname character varying(50),
    expire character varying(8),
    sain character varying(20),
    methodcode character varying(20),
    methodname character varying(100),
    method2 character varying(50),
    methodetc character varying(50),
    txcheckcode character varying(20),
    txcheckname character varying(50),
    tx character varying(5),
    txetc character varying(50),
    recoyear character varying(50),
    admisdate character varying(8),
    disdate character varying(8),
    dbyear character varying(4),
    inputday character varying(8),
    seeryear character varying(4),
    seercode character varying(20),
    seername character varying(100),
    stagecode character varying(50),
    stageyear character varying(4),
    stagedesc character varying(50),
    metacode1 character varying(20),
    metacode2 character varying(20),
    metacode3 character varying(20),
    crtn_dt timestamp without time zone NOT NULL
);


ALTER TABLE public.cncr_rgst OWNER TO gony;

--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE cncr_rgst; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON TABLE public.cncr_rgst IS '암등록';


--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.hcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.hcode IS '병원번호';


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.ptno; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.ptno IS '환자등록번호';


--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.fdx; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.fdx IS '초진연월일';


--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.cncr_rgst_seq; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.cncr_rgst_seq IS '암등록순번';


--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.brth; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.brth IS '생년월';


--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.age; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.age IS '나이';


--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.sex; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.sex IS '성별';


--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.popcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.popcode IS '모집단구분코드';


--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.popname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.popname IS '모집단구분명';


--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.frgcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.frgcode IS '외국인코드';


--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.frgname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.frgname IS '외국인명';


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.hmlscode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.hmlscode IS '행려환자';


--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.hmlsname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.hmlsname IS '행려환자';


--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.jobcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.jobcode IS '직업분류코드';


--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.jobname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.jobname IS '직업분류명';


--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.job1; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.job1 IS '직업분류기타';


--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.unknownjob; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.unknownjob IS '직업상세설명';


--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.visitpathcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.visitpathcode IS '진단경로코드';


--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.visitpathname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.visitpathname IS '진단경로명';


--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.visitpath_desc; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.visitpath_desc IS '진단경로5세부설명';


--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.tcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.tcode IS '원발부위코드';


--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.tcode1; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.tcode1 IS '원발부위코드설명';


--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.tcode2; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.tcode2 IS '원발부위코드기타설명';


--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.latercode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.latercode IS '편측성코드';


--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.latername; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.latername IS '편측성명';


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.mcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.mcode IS '조직학적진단명코드';


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.mcode1; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.mcode1 IS '조직학적진단명코드설명';


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.mcode2; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.mcode2 IS '조직학적진단명코드기타설명';


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.bunhwadocode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.bunhwadocode IS '분화도코드';


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.bunhwadoname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.bunhwadoname IS '분화도명';


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.expire; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.expire IS '사망연월일';


--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.sain; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.sain IS '사망원인';


--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.methodcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.methodcode IS '진단방법코드';


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.methodname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.methodname IS '진단방법명';


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.method2; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.method2 IS '진단방법임상검사2세부사항';


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.methodetc; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.methodetc IS '진단방법임상검사2기타사항';


--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.txcheckcode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.txcheckcode IS '치료시행여부코드';


--
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.txcheckname; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.txcheckname IS '치료시행여부명';


--
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.tx; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.tx IS '치료';


--
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.txetc; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.txetc IS '기타치료';


--
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.recoyear; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.recoyear IS '출생연대표기';


--
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.admisdate; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.admisdate IS '입원일';


--
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.disdate; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.disdate IS '퇴원일';


--
-- TOC entry 5270 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.dbyear; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.dbyear IS '자료등록년도';


--
-- TOC entry 5271 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.inputday; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.inputday IS '입력일';


--
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.seeryear; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.seeryear IS 'SEERYEAR';


--
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.seercode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.seercode IS 'SEERCODE';


--
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.seername; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.seername IS 'SEERNAME';


--
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.stagecode; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.stagecode IS 'STAGE코드';


--
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.stageyear; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.stageyear IS 'STAGEYEAR';


--
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.stagedesc; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.stagedesc IS '병기STAGE';


--
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.metacode1; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.metacode1 IS '원격전이코드1';


--
-- TOC entry 5279 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.metacode2; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.metacode2 IS '원격전이코드2';


--
-- TOC entry 5280 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.metacode3; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.metacode3 IS '원격전이코드3';


--
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN cncr_rgst.crtn_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.cncr_rgst.crtn_dt IS '생성일시';


--
-- TOC entry 301 (class 1259 OID 33256)
-- Name: ecrf_col_info; Type: TABLE; Schema: public; Owner: gony
--

CREATE TABLE public.ecrf_col_info (
    tbl_enm character varying(100) NOT NULL,
    col_enm character varying(100) NOT NULL,
    col_knm character varying(200),
    col_ord numeric(3,0),
    data_tp_cont character varying(100),
    pk_ord character varying(50),
    domn_nm character varying(1000),
    col_expl_cont character varying(4000),
    col_vl_cont character varying(4000),
    fltr_use_yn character varying(1) NOT NULL,
    fltr_expl_cont character varying(4000),
    fltr_vl_expl_cont character varying(4000),
    cd_id character varying(100),
    com_cd_ref_yn character varying(1) DEFAULT 'N'::character varying NOT NULL,
    frst_regp_id character varying(200) NOT NULL,
    frst_rgst_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
    last_modp_id character varying(200) NOT NULL,
    last_modf_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0) NOT NULL
);


ALTER TABLE public.ecrf_col_info OWNER TO gony;

--
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.tbl_enm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.tbl_enm IS '테이블영문명';


--
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.col_enm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.col_enm IS '컬럼영문명';


--
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.col_knm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.col_knm IS '컬럼한글명';


--
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.col_ord; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.col_ord IS '컬럼순서';


--
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.data_tp_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.data_tp_cont IS '데이터타입내용';


--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.pk_ord; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.pk_ord IS 'PK순서';


--
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.domn_nm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.domn_nm IS '도메인명';


--
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.col_expl_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.col_expl_cont IS '컬럼설명내용';


--
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.col_vl_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.col_vl_cont IS '컬럼값내용';


--
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.fltr_use_yn; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.fltr_use_yn IS '필터사용여부';


--
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.fltr_expl_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.fltr_expl_cont IS '필터설명내용';


--
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.fltr_vl_expl_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.fltr_vl_expl_cont IS '필터값설명내용';


--
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.cd_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.cd_id IS '코드ID';


--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.com_cd_ref_yn; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.com_cd_ref_yn IS '공통코드참조여부';


--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.frst_regp_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.frst_regp_id IS '최초등록자ID';


--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.frst_rgst_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.frst_rgst_dt IS '최초등록일시';


--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.last_modp_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.last_modp_id IS '최종수정자ID';


--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN ecrf_col_info.last_modf_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_col_info.last_modf_dt IS '최종수정일시';


--
-- TOC entry 300 (class 1259 OID 33249)
-- Name: ecrf_tbl_dfnd; Type: TABLE; Schema: public; Owner: gony
--

CREATE TABLE public.ecrf_tbl_dfnd (
    tbl_enm character varying(100) NOT NULL,
    tbl_knm character varying(200),
    tbl_ord numeric(3,0),
    crcn_nm character varying(200),
    lcls_nm character varying(200),
    mcls_nm character varying(200),
    ldng_dtrn_cont character varying(100),
    coll_bldt_col_knm character varying(200),
    coll_bldt_col_enm character varying(200),
    frst_regp_id character varying(200) NOT NULL,
    frst_rgst_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
    last_modp_id character varying(200) NOT NULL,
    last_modf_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0) NOT NULL
);


ALTER TABLE public.ecrf_tbl_dfnd OWNER TO gony;

--
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.tbl_enm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.tbl_enm IS '테이블영문명';


--
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.tbl_knm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.tbl_knm IS '테이블한글명';


--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.tbl_ord; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.tbl_ord IS '테이블순서';


--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.crcn_nm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.crcn_nm IS '암종명';


--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.lcls_nm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.lcls_nm IS '대분류명';


--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.mcls_nm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.mcls_nm IS '중분류명';


--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.ldng_dtrn_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.ldng_dtrn_cont IS '적재기간내용';


--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.coll_bldt_col_knm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.coll_bldt_col_knm IS '수집기준일자컬럼한글명';


--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.coll_bldt_col_enm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.coll_bldt_col_enm IS '수집기준일자컬럼영문명';


--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.frst_regp_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.frst_regp_id IS '최초등록자ID';


--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.frst_rgst_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.frst_rgst_dt IS '최초등록일시';


--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.last_modp_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.last_modp_id IS '최종수정자ID';


--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN ecrf_tbl_dfnd.last_modf_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_tbl_dfnd.last_modf_dt IS '최종수정일시';


--
-- TOC entry 299 (class 1259 OID 33240)
-- Name: ecrf_user; Type: TABLE; Schema: public; Owner: gony
--

CREATE TABLE public.ecrf_user (
    user_id character varying(200) NOT NULL,
    user_nm character varying(50),
    login_pswd character varying(1000),
    user_expl_cont character varying(4000),
    user_wthd_dt timestamp without time zone,
    last_login_dt timestamp without time zone,
    frst_regp_id character varying(200) NOT NULL,
    frst_rgst_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
    last_modp_id character varying(200) NOT NULL,
    last_modf_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0) NOT NULL
);


ALTER TABLE public.ecrf_user OWNER TO gony;

--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.user_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.user_id IS '사용자ID';


--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.user_nm; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.user_nm IS '사용자명';


--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.login_pswd; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.login_pswd IS '로그인비밀번호';


--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.user_expl_cont; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.user_expl_cont IS '사용자설명내용';


--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.user_wthd_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.user_wthd_dt IS '사용자탈퇴일시';


--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.last_login_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.last_login_dt IS '최종로그인일시';


--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.frst_regp_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.frst_regp_id IS '최초등록자ID';


--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.frst_rgst_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.frst_rgst_dt IS '최초등록일시';


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.last_modp_id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.last_modp_id IS '최종수정자ID';


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 299
-- Name: COLUMN ecrf_user.last_modf_dt; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.ecrf_user.last_modf_dt IS '최종수정일시';


--
-- TOC entry 212 (class 1259 OID 16386)
-- Name: tb_test; Type: TABLE; Schema: public; Owner: gony
--

CREATE TABLE public.tb_test (
    id integer NOT NULL,
    researcher text,
    department text,
    research text,
    apply_step text,
    apply_status text,
    imported_data_exists boolean DEFAULT false NOT NULL,
    data_export_request_exists boolean DEFAULT false NOT NULL,
    data_export_approval_existence boolean DEFAULT false NOT NULL,
    date_utilization_start_date timestamp without time zone,
    data_utilization_end_date timestamp without time zone
);


ALTER TABLE public.tb_test OWNER TO gony;

--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN tb_test.id; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.tb_test.id IS 'row id';


--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN tb_test.researcher; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.tb_test.researcher IS '연구자';


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN tb_test.department; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.tb_test.department IS '부서';


--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN tb_test.research; Type: COMMENT; Schema: public; Owner: gony
--

COMMENT ON COLUMN public.tb_test.research IS '연구명';


--
-- TOC entry 4123 (class 0 OID 25209)
-- Dependencies: 271
-- Data for Name: attribute_definition; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.attribute_definition (attribute_definition_id, attribute_name, attribute_description, attribute_type_concept_id, attribute_syntax) FROM stdin;
\.


--
-- TOC entry 4142 (class 0 OID 25284)
-- Dependencies: 290
-- Data for Name: care_site; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.care_site (care_site_id, care_site_name, place_of_service_concept_id, location_id, care_site_source_value, place_of_service_source_value) FROM stdin;
\.


--
-- TOC entry 4124 (class 0 OID 25214)
-- Dependencies: 272
-- Data for Name: cdm_source; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.cdm_source (cdm_source_name, cdm_source_abbreviation, cdm_holder, source_description, source_documentation_reference, cdm_etl_reference, source_release_date, cdm_release_date, cdm_version, vocabulary_version) FROM stdin;
\.


--
-- TOC entry 4146 (class 0 OID 25298)
-- Dependencies: 294
-- Data for Name: cohort; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.cohort (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) FROM stdin;
\.


--
-- TOC entry 4147 (class 0 OID 25301)
-- Dependencies: 295
-- Data for Name: cohort_attribute; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.cohort_attribute (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id, value_as_number, value_as_concept_id) FROM stdin;
\.


--
-- TOC entry 4122 (class 0 OID 25203)
-- Dependencies: 270
-- Data for Name: cohort_definition; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.cohort_definition (cohort_definition_id, cohort_definition_name, cohort_definition_description, definition_type_concept_id, cohort_definition_syntax, subject_concept_id, cohort_initiation_date) FROM stdin;
\.


--
-- TOC entry 4112 (class 0 OID 25119)
-- Dependencies: 260
-- Data for Name: concept; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
\.


--
-- TOC entry 4119 (class 0 OID 25192)
-- Dependencies: 267
-- Data for Name: concept_ancestor; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.concept_ancestor (ancestor_concept_id, descendant_concept_id, min_levels_of_separation, max_levels_of_separation) FROM stdin;
\.


--
-- TOC entry 4115 (class 0 OID 25178)
-- Dependencies: 263
-- Data for Name: concept_class; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.concept_class (concept_class_id, concept_class_name, concept_class_concept_id) FROM stdin;
\.


--
-- TOC entry 4116 (class 0 OID 25181)
-- Dependencies: 264
-- Data for Name: concept_relationship; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
\.


--
-- TOC entry 4118 (class 0 OID 25187)
-- Dependencies: 266
-- Data for Name: concept_synonym; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.concept_synonym (concept_id, concept_synonym_name, language_concept_id) FROM stdin;
\.


--
-- TOC entry 4150 (class 0 OID 25314)
-- Dependencies: 298
-- Data for Name: condition_era; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.condition_era (condition_era_id, person_id, condition_concept_id, condition_era_start_date, condition_era_end_date, condition_occurrence_count) FROM stdin;
\.


--
-- TOC entry 4135 (class 0 OID 25255)
-- Dependencies: 283
-- Data for Name: condition_occurrence; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.condition_occurrence (condition_occurrence_id, person_id, condition_concept_id, condition_start_date, condition_start_datetime, condition_end_date, condition_end_datetime, condition_type_concept_id, stop_reason, provider_id, visit_occurrence_id, visit_detail_id, condition_source_value, condition_source_concept_id, condition_status_source_value, condition_status_concept_id) FROM stdin;
\.


--
-- TOC entry 4145 (class 0 OID 25293)
-- Dependencies: 293
-- Data for Name: cost; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.cost (cost_id, cost_event_id, cost_domain_id, cost_type_concept_id, currency_concept_id, total_charge, total_cost, total_paid, paid_by_payer, paid_by_patient, paid_patient_copay, paid_patient_coinsurance, paid_patient_deductible, paid_by_primary, paid_ingredient_cost, paid_dispensing_fee, payer_plan_period_id, amount_allowed, revenue_code_concept_id, reveue_code_source_value, drg_concept_id, drg_source_value) FROM stdin;
\.


--
-- TOC entry 4129 (class 0 OID 25235)
-- Dependencies: 277
-- Data for Name: death; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.death (person_id, death_date, death_datetime, death_type_concept_id, cause_concept_id, cause_source_value, cause_source_concept_id) FROM stdin;
\.


--
-- TOC entry 4134 (class 0 OID 25252)
-- Dependencies: 282
-- Data for Name: device_exposure; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.device_exposure (device_exposure_id, person_id, device_concept_id, device_exposure_start_date, device_exposure_start_datetime, device_exposure_end_date, device_exposure_end_datetime, device_type_concept_id, unique_device_id, quantity, provider_id, visit_occurrence_id, visit_detail_id, device_source_value, device_source_concept_id) FROM stdin;
\.


--
-- TOC entry 4114 (class 0 OID 25175)
-- Dependencies: 262
-- Data for Name: domain; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.domain (domain_id, domain_name, domain_concept_id) FROM stdin;
\.


--
-- TOC entry 4149 (class 0 OID 25309)
-- Dependencies: 297
-- Data for Name: dose_era; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.dose_era (dose_era_id, person_id, drug_concept_id, unit_concept_id, dose_value, dose_era_start_date, dose_era_end_date) FROM stdin;
\.


--
-- TOC entry 4148 (class 0 OID 25306)
-- Dependencies: 296
-- Data for Name: drug_era; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.drug_era (drug_era_id, person_id, drug_concept_id, drug_era_start_date, drug_era_end_date, drug_exposure_count, gap_days) FROM stdin;
\.


--
-- TOC entry 4133 (class 0 OID 25247)
-- Dependencies: 281
-- Data for Name: drug_exposure; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.drug_exposure (drug_exposure_id, person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_start_datetime, drug_exposure_end_date, drug_exposure_end_datetime, verbatim_end_date, drug_type_concept_id, stop_reason, refills, quantity, days_supply, sig, route_concept_id, lot_number, provider_id, visit_occurrence_id, visit_detail_id, drug_source_value, drug_source_concept_id, route_source_value, dose_unit_source_value) FROM stdin;
\.


--
-- TOC entry 4121 (class 0 OID 25198)
-- Dependencies: 269
-- Data for Name: drug_strength; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.drug_strength (drug_concept_id, ingredient_concept_id, amount_value, amount_unit_concept_id, numerator_value, numerator_unit_concept_id, denominator_value, denominator_unit_concept_id, box_size, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
\.


--
-- TOC entry 4140 (class 0 OID 25278)
-- Dependencies: 288
-- Data for Name: fact_relationship; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.fact_relationship (domain_concept_id_1, fact_id_1, domain_concept_id_2, fact_id_2, relationship_concept_id) FROM stdin;
\.


--
-- TOC entry 4141 (class 0 OID 25281)
-- Dependencies: 289
-- Data for Name: location; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.location (location_id, address_1, address_2, city, state, zip, county, location_source_value) FROM stdin;
\.


--
-- TOC entry 4136 (class 0 OID 25258)
-- Dependencies: 284
-- Data for Name: measurement; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.measurement (measurement_id, person_id, measurement_concept_id, measurement_date, measurement_datetime, measurement_time, measurement_type_concept_id, operator_concept_id, value_as_number, value_as_concept_id, unit_concept_id, range_low, range_high, provider_id, visit_occurrence_id, visit_detail_id, measurement_source_value, measurement_source_concept_id, unit_source_value, value_source_value) FROM stdin;
\.


--
-- TOC entry 4125 (class 0 OID 25219)
-- Dependencies: 273
-- Data for Name: metadata; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.metadata (metadata_concept_id, metadata_type_concept_id, name, value_as_string, value_as_concept_id, metadata_date, metadata_datetime) FROM stdin;
\.


--
-- TOC entry 4137 (class 0 OID 25263)
-- Dependencies: 285
-- Data for Name: note; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.note (note_id, person_id, note_date, note_datetime, note_type_concept_id, note_class_concept_id, note_title, note_text, encoding_concept_id, language_concept_id, provider_id, visit_occurrence_id, visit_detail_id, note_source_value) FROM stdin;
\.


--
-- TOC entry 4138 (class 0 OID 25268)
-- Dependencies: 286
-- Data for Name: note_nlp; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.note_nlp (note_nlp_id, note_id, section_concept_id, snippet, "offset", lexical_variant, note_nlp_concept_id, note_nlp_source_concept_id, nlp_system, nlp_date, nlp_datetime, term_exists, term_temporal, term_modifiers) FROM stdin;
\.


--
-- TOC entry 4139 (class 0 OID 25273)
-- Dependencies: 287
-- Data for Name: observation; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.observation (observation_id, person_id, observation_concept_id, observation_date, observation_datetime, observation_type_concept_id, value_as_number, value_as_string, value_as_concept_id, qualifier_concept_id, unit_concept_id, provider_id, visit_occurrence_id, visit_detail_id, observation_source_value, observation_source_concept_id, unit_source_value, qualifier_source_value) FROM stdin;
\.


--
-- TOC entry 4127 (class 0 OID 25227)
-- Dependencies: 275
-- Data for Name: observation_period; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.observation_period (observation_period_id, person_id, observation_period_start_date, observation_period_end_date, period_type_concept_id) FROM stdin;
\.


--
-- TOC entry 4144 (class 0 OID 25290)
-- Dependencies: 292
-- Data for Name: payer_plan_period; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.payer_plan_period (payer_plan_period_id, person_id, payer_plan_period_start_date, payer_plan_period_end_date, payer_concept_id, payer_source_value, payer_source_concept_id, plan_concept_id, plan_source_value, plan_source_concept_id, sponsor_concept_id, sponsor_source_value, sponsor_source_concept_id, family_source_value, stop_reason_concept_id, stop_reason_source_value, stop_reason_source_concept_id) FROM stdin;
\.


--
-- TOC entry 4126 (class 0 OID 25224)
-- Dependencies: 274
-- Data for Name: person; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.person (person_id, gender_concept_id, year_of_birth, month_of_birth, day_of_birth, birth_datetime, race_concept_id, ethnicity_concept_id, location_id, provider_id, care_site_id, person_source_value, gender_source_value, gender_source_concept_id, race_source_value, race_source_concept_id, ethnicity_source_value, ethnicity_source_concept_id) FROM stdin;
\.


--
-- TOC entry 4132 (class 0 OID 25244)
-- Dependencies: 280
-- Data for Name: procedure_occurrence; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.procedure_occurrence (procedure_occurrence_id, person_id, procedure_concept_id, procedure_date, procedure_datetime, procedure_type_concept_id, modifier_concept_id, quantity, provider_id, visit_occurrence_id, visit_detail_id, procedure_source_value, procedure_source_concept_id, modifier_source_value) FROM stdin;
\.


--
-- TOC entry 4143 (class 0 OID 25287)
-- Dependencies: 291
-- Data for Name: provider; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.provider (provider_id, provider_name, npi, dea, specialty_concept_id, care_site_id, year_of_birth, gender_concept_id, provider_source_value, specialty_source_value, specialty_source_concept_id, gender_source_value, gender_source_concept_id) FROM stdin;
\.


--
-- TOC entry 4117 (class 0 OID 25184)
-- Dependencies: 265
-- Data for Name: relationship; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.relationship (relationship_id, relationship_name, is_hierarchical, defines_ancestry, reverse_relationship_id, relationship_concept_id) FROM stdin;
\.


--
-- TOC entry 4120 (class 0 OID 25195)
-- Dependencies: 268
-- Data for Name: source_to_concept_map; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.source_to_concept_map (source_code, source_concept_id, source_vocabulary_id, source_code_description, target_concept_id, target_vocabulary_id, valid_start_date, valid_end_date, invalid_reason) FROM stdin;
\.


--
-- TOC entry 4128 (class 0 OID 25230)
-- Dependencies: 276
-- Data for Name: specimen; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.specimen (specimen_id, person_id, specimen_concept_id, specimen_type_concept_id, specimen_date, specimen_datetime, quantity, unit_concept_id, anatomic_site_concept_id, disease_status_concept_id, specimen_source_id, specimen_source_value, unit_source_value, anatomic_site_source_value, disease_status_source_value) FROM stdin;
\.


--
-- TOC entry 4131 (class 0 OID 25241)
-- Dependencies: 279
-- Data for Name: visit_detail; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.visit_detail (visit_detail_id, person_id, visit_detail_concept_id, visit_detail_start_date, visit_detail_start_datetime, visit_detail_end_date, visit_detail_end_datetime, visit_detail_type_concept_id, provider_id, care_site_id, admitting_source_concept_id, discharge_to_concept_id, preceding_visit_detail_id, visit_detail_source_value, visit_detail_source_concept_id, admitting_source_value, discharge_to_source_value, visit_detail_parent_id, visit_occurrence_id) FROM stdin;
\.


--
-- TOC entry 4130 (class 0 OID 25238)
-- Dependencies: 278
-- Data for Name: visit_occurrence; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.visit_occurrence (visit_occurrence_id, person_id, visit_concept_id, visit_start_date, visit_start_datetime, visit_end_date, visit_end_datetime, visit_type_concept_id, provider_id, care_site_id, visit_source_value, visit_source_concept_id, admitting_source_concept_id, admitting_source_value, discharge_to_concept_id, discharge_to_source_value, preceding_visit_occurrence_id) FROM stdin;
\.


--
-- TOC entry 4113 (class 0 OID 25170)
-- Dependencies: 261
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: baseline; Owner: gony
--

COPY baseline.vocabulary (vocabulary_id, vocabulary_name, vocabulary_reference, vocabulary_version, vocabulary_concept_id) FROM stdin;
\.


--
-- TOC entry 4088 (class 0 OID 24896)
-- Dependencies: 236
-- Data for Name: brcn_diag_afoc; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_diag_afoc (hosp_cd, pt_sbst_no, comp_ocrn_oprt_ymd, comp_ocrn_oprt_seq, comp_ocrn_ymd, afoc_cont, comp_grcd, comp_grnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4089 (class 0 OID 24903)
-- Dependencies: 237
-- Data for Name: brcn_diag_aninf; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_diag_aninf (hosp_cd, pt_sbst_no, anth_rcrd_ymd, anth_rcrd_seq, ht_msrm_vl, wt_msrm_vl, bmi_vl, rlxt_blpr_vl, ctrt_blpr_vl, ecog_cd, ecog_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4090 (class 0 OID 24910)
-- Dependencies: 238
-- Data for Name: brcn_diag_inf; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_diag_inf (hosp_cd, pt_sbst_no, diag_rgst_ymd, diag_rgst_seq, brcn_diag_kncd, brcn_diag_knnm, diag_cd, diag_nm, diag_kcd_cd, diag_kcd_nm, diag_smct_cd, diag_smct_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4091 (class 0 OID 24917)
-- Dependencies: 239
-- Data for Name: brcn_diag_mtst; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_diag_mtst (hosp_cd, pt_sbst_no, mtdg_ymd, mtdg_seq, mtst_site_cd, mtst_site_nm, mtst_aspt_cd, mtst_aspt_nm, mtdg_mtcd, mtdg_mtnm, mtst_trtm_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4092 (class 0 OID 24924)
-- Dependencies: 240
-- Data for Name: brcn_diag_stag; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_diag_stag (hosp_cd, pt_sbst_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq, clnc_tumr_prty_cd, clnc_tumr_prty_nm, ajcc_yr, clnc_tnm_stag_vl, clnc_t_stag_vl, clnc_n_stag_vl, clnc_m_stag_vl, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4093 (class 0 OID 24931)
-- Dependencies: 241
-- Data for Name: brcn_exam_byps; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_byps (hosp_cd, pt_sbst_no, bpsy_ymd, bpsy_seq, bpsy_read_ymd, bpsy_site_cd, bpsy_site_nm, bpsy_site_latr_cd, bpsy_site_latr_nm, bpsy_mtcd, bpsy_mtnm, bpsy_mthd_kncd, bpsy_mthd_knnm, bpsy_rslt_cont, htlg_diag_cd, htlg_diag_nm, htlg_grcd, htlg_grnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4094 (class 0 OID 24938)
-- Dependencies: 242
-- Data for Name: brcn_exam_diag; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_diag (hosp_cd, pt_sbst_no, cexm_ymd, cexm_seq, cexm_kncd, cexm_knnm, cexm_cd, cexm_nm, cexm_edi_cd, cexm_edi_nm, cexm_smct_cd, cexm_smct_nm, cexm_loinc_cd, cexm_loinc_nm, cexm_rslt_cont, cexm_rslt_unit_cont, cexm_nlrg_ref_vl, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4095 (class 0 OID 24945)
-- Dependencies: 243
-- Data for Name: brcn_exam_gmvx; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_gmvx (hosp_cd, pt_sbst_no, gmvx_ymd, gmvx_seq, gmvx_cd, gmvx_nm, gmvx_mtcd, gmvx_mtnm, gmvx_gene_kncd, gmvx_gene_knnm, gmte_mtst_exam_rslt_cont, pavr_detect_yn_spcd, pavr_detect_yn_spnm, uncl_varnt_detect_yn_spcd, uncl_varnt_detect_yn_spnm, dna_vainf_a_vl, dna_vainf_b_cd, dna_vainf_b_nm, dna_vainf_c_cd, dna_vainf_c_nm, amsn_vainf_a_cd, amsn_vainf_a_nm, amsn_vainf_b_vl, amsn_vainf_c_cd, amsn_vainf_c_nm, ref_seq, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4096 (class 0 OID 24952)
-- Dependencies: 244
-- Data for Name: brcn_exam_gnrx; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_gnrx (hosp_cd, pt_sbst_no, gnrx_ymd, gnrx_seq, gnrx_kncd, gnrx_knnm, gnrx_rslt_kncd, gnrx_rslt_knnm, gnrx_rslt_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4097 (class 0 OID 24959)
-- Dependencies: 245
-- Data for Name: brcn_exam_imag; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_imag (hosp_cd, pt_sbst_no, imex_ymd, imex_seq, imex_kncd, imex_knnm, imex_cd, imex_nm, imex_edi_cd, imex_edi_nm, imex_smct_cd, imex_smct_nm, imex_rslt_cont, brst_dens_clcd, brst_dens_clnm, imex_rslt_diag_clcd, imex_rslt_diag_clnm, micf_yn_unid_spcd, micf_yn_unid_spnm, asyt_yn_unid_spcd, asyt_yn_unid_spnm, boms_yn_unid_spcd, boms_yn_unid_spnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4098 (class 0 OID 24966)
-- Dependencies: 246
-- Data for Name: brcn_exam_impt; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_impt (hosp_cd, pt_sbst_no, imem_ymd, imem_seq, impt_read_ymd, imem_kncd, imem_knnm, imem_nm, imem_cd, imem_opn_clcd, imem_opn_clnm, imem_rslt_vl, imem_rslt_unit_cd, imem_rslt_unit_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4099 (class 0 OID 24973)
-- Dependencies: 247
-- Data for Name: brcn_exam_mlpt; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_mlpt (hosp_cd, pt_sbst_no, mlem_ymd, mlem_seq, mlpt_read_ymd, mlem_cd, mlem_nm, mlem_kncd, mlem_knnm, mlem_mtcd, mlem_mtnm, mlem_rslt_cd, mlem_rslt_nm, mlem_rslt_kncd, mlem_rslt_knnm, mlem_rslt_vl, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4100 (class 0 OID 24980)
-- Dependencies: 248
-- Data for Name: brcn_exam_sgpt; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_exam_sgpt (hosp_cd, pt_sbst_no, srgc_ptem_ymd, srgc_ptem_seq, sgpt_read_ymd, sgpt_hvst_site_cd, sgpt_hvst_site_nm, sgpt_exam_site_latr_cd, sgpt_exam_site_latr_nm, srgc_ptem_rslt_tumr_cnt, tumr_wdth_lnth_vl, tumr_lgtd_lnth_vl, tumr_hght_vl, tumr_max_diam_vl, htlg_diag_cd, htlg_diag_nm, htlg_grcd, htlg_grnm, lvin_ex_yn_spcd, lvin_ex_yn_spnm, lpin_ex_yn_spcd, lpin_ex_yn_spnm, niin_ex_yn_spcd, niin_ex_yn_spnm, sgpt_micf_ex_yn_spcd, sgpt_micf_ex_yn_spnm, incn_necr_ex_yn_spcd, incn_necr_ex_yn_spnm, incn_asso_ex_yn_spcd, incn_asso_ex_yn_spnm, incn_core_grcd, incn_core_grnm, srmg_sfmg_lnth_vl, srmg_detl_cont, srmg_rlct_cd, srmg_rlct_nm, mtcr_size_vl, asso_lesn_cd, asso_lesn_nm, resi_tumr_cd, resi_tumr_nm, ln_totl_cnt, pstv_ln_cnt, slnd_totl_cnt, pstv_slnd_cnt, nsnd_totl_cnt, pstv_nsnd_cnt, ajcc_yr, afop_path_tnm_stag_vl, afop_path_t_stag_vl, afop_path_n_stag_vl, afop_path_m_stag_vl, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4101 (class 0 OID 24987)
-- Dependencies: 249
-- Data for Name: brcn_fuor_rlps; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_fuor_rlps (hosp_cd, pt_sbst_no, rldg_ymd, rldg_seq, rlps_site_cd, rlps_site_nm, rlps_trtm_cont, rldg_mtcd, rldg_mtnm, rlps_kncd, rlps_knnm, rlps_sym_cd, rlps_sym_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4102 (class 0 OID 24994)
-- Dependencies: 250
-- Data for Name: brcn_pt_fmht; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_pt_fmht (hosp_cd, pt_sbst_no, fmht_rcrd_ymd, fmht_rcrd_seq, fmht_yn_noans_spcd, fmht_yn_noans_spnm, pt_fm_rlcd, pt_fm_rlnm, pt_fmrl_etc_cont, fmhs_htn_yn_noans_spcd, fmhs_htn_yn_noans_spnm, fmhs_dbt_yn_noans_spcd, fmhs_dbt_yn_noans_spnm, fmht_tb_yn_noans_spcd, fmht_tb_yn_noans_spnm, fmhs_lvds_yn_noans_spcd, fmhs_lvds_yn_noans_spnm, fmhs_cncr_yn_noans_spcd, fmhs_cncr_yn_noans_spnm, fmht_cncr_kncd, fmht_cncr_knnm, fmht_cncr_kind_etc_cont, fmhs_etc_yn_noans_spcd, fmhs_etc_yn_noans_spnm, fmhs_etc_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4103 (class 0 OID 25001)
-- Dependencies: 251
-- Data for Name: brcn_pt_hlinf; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_pt_hlinf (hosp_cd, pt_sbst_no, adm_ymd, hlinf_seq, dsch_ymd, cur_drnk_yn_noans_spcd, cur_drnk_yn_noans_spnm, dhis_yn_noans_spcd, dhis_yn_noans_spnm, drnk_strt_age_vl, drnk_kncd, drnk_knnm, drnk_qty, drnk_nt, drnk_dtrn_ycnt, ndrk_strt_yr, cur_smok_yn_noans_spcd, cur_smok_yn_noans_spnm, shis_yn_noans_spcd, shis_yn_noans_spnm, smok_strt_age_vl, smok_qty, smok_dtrn_ycnt, nsmk_strt_yr, mhis_yn_noans_spcd, mhis_yn_noans_spnm, mhis_htn_yn_noans_spcd, mhis_htn_yn_noans_spnm, mhis_dbt_yn_noans_spcd, mhis_dbt_yn_noans_spnm, mhis_tb_yn_noans_spcd, mhis_tb_yn_noans_spnm, mhis_lvds_yn_noans_spcd, mhis_lvds_yn_noans_spnm, mhis_hl_yn_noans_spcd, mhis_hl_yn_noans_spnm, mhis_cncr_yn_noans_spcd, mhis_cncr_yn_noans_spnm, mhis_cncr_kncd, mhis_cncr_knnm, mhis_depr_yn_noans_spcd, mhis_depr_yn_noans_spnm, mhis_insm_yn_noans_spcd, mhis_insm_yn_noans_spnm, mhis_cads_yn_noans_spcd, mhis_cads_yn_noans_spnm, etc_mhis_yn_noans_spcd, etc_mhis_yn_noans_spnm, etc_mhis_diss_cont, main_sym_yn_noans_spcd, main_sym_yn_noans_spnm, main_sym_cont, ohad_hstr_yn_noans_spcd, ohad_hstr_yn_noans_spnm, dsch_stcd, dsch_stnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4104 (class 0 OID 25008)
-- Dependencies: 252
-- Data for Name: brcn_pt_obinf; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_pt_obinf (hosp_cd, pt_sbst_no, obtr_rcrd_ymd, obtr_rcrd_seq, marg_yn_noans_spcd, marg_yn_noans_spnm, marg_detl_cd, marg_detl_nm, hrpr_yn_noans_spcd, hrpr_yn_noans_spnm, hrt_impl_mcnt, mena_age_vl, delv_age_vl, delv_chld_cnt, bfpr_yn_noans_spcd, bfpr_yn_noans_spnm, brfd_mcnt, oc_use_yn_noans_spcd, oc_use_yn_noans_spnm, oc_use_mcnt, meno_yn_noans_spcd, meno_yn_noans_spnm, meno_age_vl, utec_yn_noans_spcd, utec_yn_noans_spnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4105 (class 0 OID 25015)
-- Dependencies: 253
-- Data for Name: brcn_trtm_antp; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_trtm_antp (hosp_cd, pt_sbst_no, antp_strt_ymd, antp_seq, antp_end_ymd, antp_nm, antp_cycl_cnt, antp_line_cnt, antp_temp_stop_yn_unid_spcd, antp_temp_stop_yn_unid_spnm, antp_end_resn_cd, antp_end_resn_nm, antp_asmt_ymd, antp_asmt_item_cd, antp_asmt_item_nm, antp_seff_item_cd, antp_seff_item_nm, antp_seff_grcd, antp_seff_grnm, antp_trtm_prps_cd, antp_trtm_prps_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4106 (class 0 OID 25022)
-- Dependencies: 254
-- Data for Name: brcn_trtm_bltr; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_trtm_bltr (hosp_cd, pt_sbst_no, bltr_prsc_ymd, bltr_prsc_seq, blpt_kncd, blpt_knnm, blpt_cd, blpt_nm, blpt_capa, bltr_pack_cnt, bltr_totl_qty, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4107 (class 0 OID 25027)
-- Dependencies: 255
-- Data for Name: brcn_trtm_drin; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_trtm_drin (hosp_cd, pt_sbst_no, drug_prsc_ymd, drug_prsc_seq, drug_clcd, drug_clnm, andr_spcd, andr_spnm, drin_kncd, drin_knnm, drin_cd, drin_nm, drin_smct_cd, drin_smct_nm, drug_cd, drug_nm, drug_edi_cd, drug_edi_nm, drug_atc_cd, drug_atc_nm, drug_rxnm_cd, drug_rxnm_nm, drug_prsc_capa, drug_prsc_capa_unit_cd, drug_prsc_capa_unit_nm, drug_prsc_dcnt, drug_injc_pth_cd, drug_injc_pth_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4108 (class 0 OID 25034)
-- Dependencies: 256
-- Data for Name: brcn_trtm_oprt; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_trtm_oprt (hosp_cd, pt_sbst_no, oprt_ymd, oprt_seq, oprt_kncd, oprt_knnm, oprt_cd, oprt_nm, oprt_edi_cd, oprt_edi_nm, oprt_smct_cd, oprt_smct_nm, oprt_icd9cm_cd, oprt_icd9cm_nm, oprt_anst_site_cd, oprt_anst_site_nm, ebl_qty, oprt_ldtm, oprt_prps_cd, oprt_prps_nm, oprt_site_cd, oprt_site_nm, brcn_oprt_mtcd, brcn_oprt_mtnm, asa_scor_cd, asa_scor_nm, oprt_incs_mthd_cont, oprt_icln_tpcd, oprt_icln_tpnm, oprt_tumr_loca_cd, oprt_tumr_loca_nm, oprt_tumr_detl_loca_cd, oprt_tumr_detl_loca_nm, repr_clcd, repr_clnm, repr_mtcd, repr_mtnm, slnd_dtct_mtcd, slnd_dtct_mtnm, afop_asmt_item_cd, afop_asmt_item_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4109 (class 0 OID 25041)
-- Dependencies: 257
-- Data for Name: brcn_trtm_rd; Type: TABLE DATA; Schema: cancle_breast; Owner: gony
--

COPY cancle_breast.brcn_trtm_rd (hosp_cd, pt_sbst_no, rdt_prsc_ymd, rdt_prsc_seq, rdt_kncd, rdt_knnm, rdt_cd, rdt_nm, rdt_edi_cd, rdt_edi_nm, rdt_smct_cd, rdt_smct_nm, rdt_prps_cd, rdt_prps_nm, rdt_site_cd, rdt_site_nm, rd_gy, rd_impl_nt, rd_totl_gy, rdt_asmt_ymd, rdt_seff_perd_spcd, rdt_seff_perd_spnm, rdt_seff_kncd, rdt_seff_knnm, rdt_seff_grcd, rdt_seff_grnm, rdt_asmt_item_cd, rdt_asmt_item_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4065 (class 0 OID 24738)
-- Dependencies: 213
-- Data for Name: gscn_diag_afoc; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_diag_afoc (hosp_cd, pt_sbst_no, comp_ocrn_oprt_ymd, comp_ocrn_oprt_seq, afoc_clcd, afoc_clnm, afoc_cd, afoc_nm, afop_etc_comp_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4066 (class 0 OID 24745)
-- Dependencies: 214
-- Data for Name: gscn_diag_aninf; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_diag_aninf (hosp_cd, pt_sbst_no, anth_rcrd_ymd, anth_rcrd_seq, ht_msrm_vl, wt_msrm_vl, bmi_vl, rlxt_blpr_vl, ctrt_blpr_vl, ecog_cd, ecog_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4067 (class 0 OID 24752)
-- Dependencies: 215
-- Data for Name: gscn_diag_inf; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_diag_inf (hosp_cd, pt_sbst_no, diag_rgst_ymd, diag_rgst_seq, gscn_diag_kncd, gscn_diag_knnm, diag_cd, diag_nm, diag_kcd_cd, diag_kcd_nm, diag_smct_cd, diag_smct_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4068 (class 0 OID 24759)
-- Dependencies: 216
-- Data for Name: gscn_diag_mtst; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_diag_mtst (hosp_cd, pt_sbst_no, mtdg_ymd, mtdg_seq, mtdg_mtcd, mtdg_mtnm, mtst_site_cd, mtst_site_nm, mtst_aspt_cd, mtst_aspt_nm, mtst_trtm_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4069 (class 0 OID 24766)
-- Dependencies: 217
-- Data for Name: gscn_diag_stag; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_diag_stag (hosp_cd, pt_sbst_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq, clnc_tumr_prty_cd, clnc_tumr_prty_nm, ajcc_yr, clnc_tnm_stag_vl, clnc_t_stag_vl, clnc_n_stag_vl, clnc_m_stag_vl, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4070 (class 0 OID 24773)
-- Dependencies: 218
-- Data for Name: gscn_exam_byps; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_byps (hosp_cd, pt_sbst_no, bpsy_ymd, bpsy_seq, bpsy_read_ymd, bpsy_site_cd, bpsy_site_nm, bpsy_mtcd, bpsy_mtnm, bpsy_mthd_kncd, bpsy_mthd_knnm, bpsy_rslt_cont, htlg_diag_cd, htlg_diag_nm, htlg_dfgd_cd, htlg_dfgd_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4071 (class 0 OID 24780)
-- Dependencies: 219
-- Data for Name: gscn_exam_diag; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_diag (hosp_cd, pt_sbst_no, cexm_ymd, cexm_seq, cexm_kncd, cexm_knnm, cexm_cd, cexm_nm, cexm_edi_cd, cexm_edi_nm, cexm_smct_cd, cexm_smct_nm, cexm_loinc_cd, cexm_loinc_nm, cexm_rslt_cont, cexm_rslt_unit_cont, cexm_nlrg_ref_vl, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4072 (class 0 OID 24787)
-- Dependencies: 220
-- Data for Name: gscn_exam_eus; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_eus (hosp_cd, pt_sbst_no, eus_exam_ymd, eus_exam_seq, eus_t_stag_cd, eus_t_stag_nm, eus_n_stag_cd, eus_n_stag_nm, eus_m_stag_cd, eus_m_stag_nm, eus_exam_opn_cont, eus_exam_rslt_cont, eus_comp_cd, eus_comp_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4073 (class 0 OID 24794)
-- Dependencies: 221
-- Data for Name: gscn_exam_gtsp; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_gtsp (hosp_cd, pt_sbst_no, stmc_edex_ymd, stmc_edex_seq, stmc_edex_prps_cd, stmc_edex_prps_nm, gtsp_tspc_cnt, stmc_edex_opn_cont, stmc_edex_rslt_cont, stmc_edex_rslt_tpcd, stmc_edex_rslt_tpnm, gtsp_comp_grcd, gtsp_comp_grnm, gtsp_comp_cd, gtsp_comp_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4074 (class 0 OID 24801)
-- Dependencies: 222
-- Data for Name: gscn_exam_hpli; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_hpli (hosp_cd, pt_sbst_no, hpli_exam_ymd, hpli_exam_seq, hpli_exam_mtcd, hpli_exam_mtnm, hpli_exam_rslt_cd, hpli_exam_rslt_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4075 (class 0 OID 24806)
-- Dependencies: 223
-- Data for Name: gscn_exam_imag; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_imag (hosp_cd, pt_sbst_no, imex_ymd, imex_seq, imex_kncd, imex_knnm, imex_cd, imex_nm, imex_edi_cd, imex_edi_nm, imex_smct_cd, imex_smct_nm, imex_rslt_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4076 (class 0 OID 24813)
-- Dependencies: 224
-- Data for Name: gscn_exam_impt; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_impt (hosp_cd, pt_sbst_no, imem_ymd, imem_seq, impt_read_ymd, imem_cd, imem_nm, imem_kncd, imem_knnm, imem_mthd_cont, imem_opn_cd, imem_opn_nm, imem_rslt_vl, imem_rslt_unit_cd, imem_rslt_unit_nm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4077 (class 0 OID 24820)
-- Dependencies: 225
-- Data for Name: gscn_exam_mlpt; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_mlpt (hosp_cd, pt_sbst_no, mlem_ymd, mlem_seq, mlpt_read_ymd, mlem_cd, mlem_nm, mlem_kncd, mlem_knnm, mlem_mthd_cont, mlem_rslt_bas_cont, mlem_opn_cd, mlem_opn_nm, mlem_rslt_cont, mlem_rslt_unit_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4078 (class 0 OID 24827)
-- Dependencies: 226
-- Data for Name: gscn_exam_sgpt; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_exam_sgpt (hosp_cd, pt_sbst_no, srgc_ptem_ymd, srgc_ptem_seq, sgpt_read_ymd, sgpt_hvst_site_cd, sgpt_hvst_site_nm, srgc_ptem_rslt_tumr_cnt, htlg_diag_cd, htlg_diag_nm, htlg_dfgd_cd, htlg_dfgd_nm, afop_crmr_tumr_loca_cd, afop_crmr_tumr_loca_nm, afop_lngt_1_tumr_loca_cd, afop_lngt_1_tumr_loca_nm, afop_lngt_2_tumr_loca_cd, afop_lngt_2_tumr_loca_nm, gros_tpcd, gros_tpnm, gros_type_cont, tumr_wdth_lnth_vl, tumr_lgtd_lnth_vl, tumr_hght_vl, tumr_max_diam_vl, iflt_orgn_cd, iflt_orgn_nm, inva_dgre_cd, inva_dgre_nm, inva_dpth_vl, lymp_inva_ex_yn_spcd, lymp_inva_ex_yn_spnm, vasc_inva_ex_yn_spcd, vasc_inva_ex_yn_spnm, nerv_prex_ex_yn_spcd, nerv_prex_ex_yn_spnm, oprt_pmrg_rlcr_invl_yn_spcd, oprt_pmrg_rlcr_invl_yn_spnm, oprt_pmrg_size_vl, oprt_dmrg_rlcr_invl_yn_spcd, oprt_dmrg_rlcr_invl_yn_spnm, oprt_dmrg_size_vl, stes_bnst_cncr_clcd, stes_bnst_cncr_clnm, totl_ln_cnt, pstv_ln_cnt, ln_bylc_mtst_cont, ajcc_yr, afop_path_tnm_stag_vl, afop_path_t_stag_vl, afop_path_n_stag_vl, afop_path_m_stag_vl, esd_vmrg_rlcr_pstv_yn_spcd, esd_vmrg_rlcr_pstv_yn_spnm, esd_vmrg_vl, esd_hmrg_rlcr_pstv_yn_spcd, esd_hmrg_rlcr_pstv_yn_spnm, esd_hmrg_vl, esd_hmrg_rlcr_lnth_vl, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4079 (class 0 OID 24834)
-- Dependencies: 227
-- Data for Name: gscn_fuor_rlps; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_fuor_rlps (hosp_cd, pt_sbst_no, rldg_ymd, rldg_seq, rldg_mtcd, rldg_mtnm, rlps_site_cd, rlps_site_nm, rlps_kncd, rlps_knnm, rlps_trtm_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4080 (class 0 OID 24841)
-- Dependencies: 228
-- Data for Name: gscn_pt_fmht; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_pt_fmht (hosp_cd, pt_sbst_no, fmht_rcrd_ymd, fmht_rcrd_seq, fmht_yn_noans_spcd, fmht_yn_noans_spnm, pt_fm_rlcd, pt_fm_rlnm, pt_fmrl_etc_cont, fmhs_htn_yn_noans_spcd, fmhs_htn_yn_noans_spnm, fmhs_dbt_yn_noans_spcd, fmhs_dbt_yn_noans_spnm, fmht_tb_yn_noans_spcd, fmht_tb_yn_noans_spnm, fmhs_lvds_yn_noans_spcd, fmhs_lvds_yn_noans_spnm, fmhs_cncr_yn_noans_spcd, fmhs_cncr_yn_noans_spnm, fmht_cncr_kncd, fmht_cncr_knnm, fmht_cncr_kind_etc_cont, fmhs_etc_yn_noans_spcd, fmhs_etc_yn_noans_spnm, fmhs_etc_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4081 (class 0 OID 24848)
-- Dependencies: 229
-- Data for Name: gscn_pt_hlinf; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_pt_hlinf (hosp_cd, pt_sbst_no, adm_ymd, hlinf_seq, dsch_ymd, cur_drnk_yn_noans_spcd, cur_drnk_yn_noans_spnm, dhis_yn_noans_spcd, dhis_yn_noans_spnm, drnk_strt_age_vl, drnk_kncd, drnk_knnm, drnk_qty, drnk_nt, drnk_dtrn_ycnt, ndrk_strt_yr, cur_smok_yn_noans_spcd, cur_smok_yn_noans_spnm, shis_yn_noans_spcd, shis_yn_noans_spnm, smok_strt_age_vl, smok_dtrn_ycnt, smok_qty, nsmk_strt_yr, mhis_yn_noans_spcd, mhis_yn_noans_spnm, mhis_hl_yn_noans_spcd, mhis_hl_yn_noans_spnm, mhis_htn_yn_noans_spcd, mhis_htn_yn_noans_spnm, mhis_dbt_yn_noans_spcd, mhis_dbt_yn_noans_spnm, mhis_tb_yn_noans_spcd, mhis_tb_yn_noans_spnm, mhis_lvds_yn_noans_spcd, mhis_lvds_yn_noans_spnm, mhis_cncr_yn_noans_spcd, mhis_cncr_yn_noans_spnm, mhis_cncr_kncd, mhis_cncr_knnm, mhis_depr_yn_noans_spcd, mhis_depr_yn_noans_spnm, mhis_insm_yn_noans_spcd, mhis_insm_yn_noans_spnm, mhis_cads_yn_noans_spcd, mhis_cads_yn_noans_spnm, etc_mhis_yn_noans_spcd, etc_mhis_yn_noans_spnm, etc_mhis_diss_cont, main_sym_cont, main_sym_yn_noans_spcd, main_sym_yn_noans_spnm, ohad_hstr_yn_noans_spcd, ohad_hstr_yn_noans_spnm, dsch_stcd, dsch_stnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4082 (class 0 OID 24855)
-- Dependencies: 230
-- Data for Name: gscn_trtm_antp; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_trtm_antp (hosp_cd, pt_sbst_no, antp_strt_ymd, antp_seq, antp_end_ymd, antp_line_cnt, antp_totl_cycl_cnt, antp_trtm_prps_cd, antp_trtm_prps_nm, antp_nm, antp_temp_stop_yn_unid_spcd, antp_temp_stop_yn_unid_spnm, antp_end_resn_cd, antp_end_resn_nm, antp_asmt_ymd, antp_asmt_item_cd, antp_asmt_item_nm, antp_seff_cd, antp_seff_nm, antp_seff_grcd, antp_seff_grnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4083 (class 0 OID 24862)
-- Dependencies: 231
-- Data for Name: gscn_trtm_bltr; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_trtm_bltr (hosp_cd, pt_sbst_no, bltr_prsc_ymd, bltr_prsc_seq, blpt_kncd, blpt_knnm, blpt_cd, blpt_nm, bltr_pack_cnt, bltr_totl_qty, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4084 (class 0 OID 24867)
-- Dependencies: 232
-- Data for Name: gscn_trtm_drin; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_trtm_drin (hosp_cd, pt_sbst_no, drug_prsc_ymd, drug_prsc_seq, drug_clcd, drug_clnm, drug_spcd, drug_spnm, drin_kncd, drin_knnm, drin_cd, drin_nm, drin_smct_cd, drin_smct_nm, drug_cd, drug_nm, drug_edi_cd, drug_edi_nm, drug_atc_cd, drug_atc_nm, drug_rxnm_cd, drug_rxnm_nm, drug_prsc_capa, drug_prsc_dcnt, drug_injc_pth_cd, drug_injc_pth_nm, drug_prsc_capa_unit_cd, drug_prsc_capa_unit_nm, drug_mdct_dtrn_mcnt, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4085 (class 0 OID 24874)
-- Dependencies: 233
-- Data for Name: gscn_trtm_oprt; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_trtm_oprt (hosp_cd, pt_sbst_no, oprt_ymd, oprt_seq, oprt_kncd, oprt_knnm, oprt_cd, oprt_nm, oprt_edi_cd, oprt_edi_nm, oprt_smct_cd, oprt_smct_nm, oprt_icd9cm_cd, oprt_icd9cm_nm, oprt_ldtm, oprt_prps_cd, oprt_prps_nm, oprt_mtcd, oprt_mtnm, oprt_anst_site_cd, oprt_anst_site_nm, asa_scor_cd, asa_scor_nm, oprt_incs_mtcd, oprt_incs_mtnm, oprt_crmr_tumr_loca_cd, oprt_crmr_tumr_loca_nm, oprt_lngt_1_tumr_loca_cd, oprt_lngt_1_tumr_loca_nm, oprt_lngt_2_tumr_loca_cd, oprt_lngt_2_tumr_loca_nm, diag_lpex_yn_unid_spcd, diag_lpex_yn_unid_spnm, oprm_ensp_use_yn_unid_spcd, oprm_ensp_use_yn_unid_spnm, flrn_imag_use_yn_unid_spcd, flrn_imag_use_yn_unid_spnm, inop_antp_cd, inop_antp_nm, adh_ibtr_use_yn_unid_spcd, adh_ibtr_use_yn_unid_spnm, adh_ibtr_gods_nm, omnl_srmv_rang_cd, omnl_srmv_rang_nm, curdg_cd, curdg_nm, ln_srmv_dgre_cd, ln_srmv_dgre_nm, ln_srmv_dgre_detl_cont, mrge_srmv_site_cd, mrge_srmv_site_nm, repr_kncd, repr_knnm, repr_use_dvce_nm, repr_mtcd, repr_mtnm, repr_aprmthd_cd, repr_aprmthd_nm, oprt_ebl_qty, asct_yn_unid_spcd, asct_yn_unid_spnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4086 (class 0 OID 24881)
-- Dependencies: 234
-- Data for Name: gscn_trtm_rd; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_trtm_rd (hosp_cd, pt_sbst_no, rdt_prsc_ymd, rdt_prsc_seq, rdt_kncd, rdt_knnm, rdt_cd, rdt_nm, rdt_edi_cd, rdt_edi_nm, rdt_smct_cd, rdt_smct_nm, rdt_prps_cd, rdt_prps_nm, rdt_site_cd, rdt_site_nm, byst_rd_impl_nt, rd_gy, byst_rd_totl_gy, rdt_asmt_ymd, rdt_asmt_item_cd, rdt_asmt_item_nm, rdt_seff_perd_spcd, rdt_seff_perd_spnm, rdt_seff_kncd, rdt_seff_knnm, rdt_seff_grcd, rdt_seff_grnm, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4087 (class 0 OID 24888)
-- Dependencies: 235
-- Data for Name: gscn_trtm_srpr; Type: TABLE DATA; Schema: cancle_stomach; Owner: gony
--

COPY cancle_stomach.gscn_trtm_srpr (hosp_cd, pt_sbst_no, esd_srpr_ymd, esd_srpr_seq, esd_srpr_strt_dt, esd_srpr_end_dt, esd_lesn_size_vl, esd_lesn_shap_cd, esd_lesn_shap_nm, esd_lesn_loca_wdth_cd, esd_lesn_loca_wdth_nm, esd_lesn_loca_lgtd_cd, esd_lesn_loca_lgtd_nm, esd_ulcr_yn_unid_spcd, esd_ulcr_yn_unid_spnm, esd_perf_yn_unid_spcd, esd_perf_yn_unid_spnm, esd_perf_msre_cd, esd_perf_msre_nm, esd_rslt_cd, esd_rslt_nm, esd_opn_cont, esd_rslt_cont, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4110 (class 0 OID 25050)
-- Dependencies: 258
-- Data for Name: cncr_code_meta; Type: TABLE DATA; Schema: public; Owner: gony
--

COPY public.cncr_code_meta (hosp_cd, cd_clcd, cd_id, cd_nm, cd_vl, cd_vl_nm, arry_ord_vl, cd_expl_cont, crtn_dt) FROM stdin;
99000	1	10020	결혼상세코드	1	미혼	1		2023-01-27 12:13:06.699204+09
99000	1	10020	결혼상세코드	2	기혼	2		2023-01-27 12:13:06.699204+09
99000	1	10020	결혼상세코드	3	이혼	3		2023-01-27 12:13:06.699204+09
99000	1	10020	결혼상세코드	4	사별	4		2023-01-27 12:13:06.699204+09
99000	1	10020	결혼상세코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	01	간	1		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	02	갑상선	2		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	03	골육종	3		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	04	구강	4		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	05	난소	5		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	06	뇌	6		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	07	담도	7		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	08	대장	8		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	09	신장	9		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	10	위	10		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	11	유방	11		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	12	자궁	12		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	13	전립선	13		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	14	췌장	14		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	15	폐	15		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	16	혈액	16		2023-01-27 12:13:06.699204+09
99000	1	10030	암종류코드	99	기타	17		2023-01-27 12:13:06.699204+09
99000	1	10040	여부무응답구분코드	Y	예	1		2023-01-27 12:13:06.699204+09
99000	1	10040	여부무응답구분코드	N	아니오	2		2023-01-27 12:13:06.699204+09
99000	1	10040	여부무응답구분코드	Z	무응답	3		2023-01-27 12:13:06.699204+09
99000	1	10050	음주종류코드	1	막걸리	1		2023-01-27 12:13:06.699204+09
99000	1	10050	음주종류코드	2	맥주	2		2023-01-27 12:13:06.699204+09
99000	1	10050	음주종류코드	3	소주	3		2023-01-27 12:13:06.699204+09
99000	1	10050	음주종류코드	4	양주	4		2023-01-27 12:13:06.699204+09
99000	1	10050	음주종류코드	8	무응답	5		2023-01-27 12:13:06.699204+09
99000	1	10050	음주종류코드	9	기타	6		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	01	48시간이내 사망	1		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	02	48시간이후 사망	2		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	03	가망없는퇴원	3		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	04	사망	4		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	05	악화	5		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	06	완쾌	6		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	07	자의퇴원	7		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	08	진단뿐	8		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	09	호전	9		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	10	호전안됨	10		2023-01-27 12:13:06.699204+09
99000	1	10060	퇴원상태코드	99	기타	11		2023-01-27 12:13:06.699204+09
99000	1	10070	환자가족관계코드	01	아버지	1		2023-01-27 12:13:06.699204+09
99000	1	10070	환자가족관계코드	02	어머니	2		2023-01-27 12:13:06.699204+09
99000	1	10070	환자가족관계코드	03	자녀	3		2023-01-27 12:13:06.699204+09
99000	1	10070	환자가족관계코드	04	형제자매	4		2023-01-27 12:13:06.699204+09
99000	1	10070	환자가족관계코드	05	친척	5		2023-01-27 12:13:06.699204+09
99000	1	10070	환자가족관계코드	98	무응답	6		2023-01-27 12:13:06.699204+09
99000	1	10070	환자가족관계코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	20010	ECOG코드	01	제한없이 정상적이다	1		2023-01-27 12:13:06.699204+09
99000	1	20010	ECOG코드	02	증상이 있으나 스스로 활동 가능하다	2		2023-01-27 12:13:06.699204+09
99000	1	20010	ECOG코드	03	증상이 있으나 누워 지내는 시간은 하루의 반보다 적다	3		2023-01-27 12:13:06.699204+09
99000	1	20010	ECOG코드	04	증상이 있으며 누워 지내는 시간이 하루의 절반이상이다	4		2023-01-27 12:13:06.699204+09
99000	1	20010	ECOG코드	05	계속 누워 있어야 한다	5		2023-01-27 12:13:06.699204+09
99000	1	20010	ECOG코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	20030	수술후합병증분류코드	1	Local complication	1		2023-01-27 12:13:06.699204+09
99000	1	20030	수술후합병증분류코드	2	Systemic complication	2		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	01	Anastomotic leakage	1		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	02	Anastomotic stricture	2		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	03	Cardiovascular complications	3		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	04	Central nervous system complications	4		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	05	Chylous ascites	5		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	06	Delayed gastric emptying (= gastric stasis)	6		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	07	Duodenal stump leakage	7		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	08	Endocrine system complications	8		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	09	Hepatic system complications	9		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	10	Intestinal obstruction (=ileus)	10		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	11	Intra-abdominal bleeding	11		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	12	Intra-abdominal fluid collection	12		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	13	Intraluminal bleeding	13		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	14	Pancreatic leakage	14		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	15	Respiratory complications	15		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	16	Urinary system complications	16		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	17	Wound complication	17		2023-01-27 12:13:06.699204+09
99000	1	20040	수술후합병증코드	99	기타	18		2023-01-27 12:13:06.699204+09
99000	1	20050	임상종양특성코드	1	Primary  	1		2023-01-27 12:13:06.699204+09
99000	1	20050	임상종양특성코드	2	Recurrence	2		2023-01-27 12:13:06.699204+09
99000	1	20050	임상종양특성코드	3	Remnant	3		2023-01-27 12:13:06.699204+09
99000	1	20050	임상종양특성코드	4	Meta	4		2023-01-27 12:13:06.699204+09
99000	1	20050	임상종양특성코드	9	기타  	5		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	01	Bone	1		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	02	Brain	2		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	03	Breast(non-OP site)	3		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	04	Breast(OP site)	4		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	05	Liver	5		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	06	LN	6		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	07	Lung	7		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	08	Ovary	8		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	09	Peritoneum	9		2023-01-27 12:13:06.699204+09
99000	1	20060	전이부위코드	99	기타	10		2023-01-27 12:13:06.699204+09
99000	1	20070	전이양상코드	1	Single lesion	1		2023-01-27 12:13:06.699204+09
99000	1	20070	전이양상코드	2	Multiple lesion - synchronous	2		2023-01-27 12:13:06.699204+09
99000	1	20070	전이양상코드	3	Multiple lesion - metachronous	3		2023-01-27 12:13:06.699204+09
99000	1	20070	전이양상코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	20080	전이진단방법코드	1	영상검사	1		2023-01-27 12:13:06.699204+09
99000	1	20080	전이진단방법코드	2	조직검사	2		2023-01-27 12:13:06.699204+09
99000	1	20080	전이진단방법코드	9	기타	3		2023-01-27 12:13:06.699204+09
99000	1	20090	위암진단종류코드	1	위암(C16)	1		2023-01-27 12:13:06.699204+09
99000	1	20090	위암진단종류코드	2	상피내암(D002)	2		2023-01-27 12:13:06.699204+09
99000	1	20090	위암진단종류코드	8	기타암	3		2023-01-27 12:13:06.699204+09
99000	1	20090	위암진단종류코드	9	기타질환	4		2023-01-27 12:13:06.699204+09
99000	1	20100	유방암진단종류코드	1	유방암(C50)	1		2023-01-27 12:13:06.699204+09
99000	1	20100	유방암진단종류코드	2	상피내암(D05)	2		2023-01-27 12:13:06.699204+09
99000	1	20100	유방암진단종류코드	8	기타암	3		2023-01-27 12:13:06.699204+09
99000	1	20100	유방암진단종류코드	9	기타질환	4		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	01	Grade 1	1		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	02	Grade 2	2		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	03	Grade 3	3		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	04	Grade 3a	4		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	05	Grade 3b	5		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	06	Grade 4	6		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	07	Grade 4a	7		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	08	Grade 4b	8		2023-01-27 12:13:06.699204+09
99000	1	20120	합병증등급코드	09	Grade 5	9		2023-01-27 12:13:06.699204+09
99000	1	30010	DNA변이정보B코드	1	A>	1		2023-01-27 12:13:06.699204+09
99000	1	30010	DNA변이정보B코드	2	G>	2		2023-01-27 12:13:06.699204+09
99000	1	30010	DNA변이정보B코드	3	C>	3		2023-01-27 12:13:06.699204+09
99000	1	30010	DNA변이정보B코드	4	T>	4		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	01	A	1		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	02	G	2		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	03	C	3		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	04	T	4		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	05	Ins	5		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	06	Del	6		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	07	Dup	7		2023-01-27 12:13:06.699204+09
99000	1	30020	DNA변이정보C코드	08	Unknown	8		2023-01-27 12:13:06.699204+09
99000	1	30030	EUS_M병기코드	1	M0	1		2023-01-27 12:13:06.699204+09
99000	1	30030	EUS_M병기코드	2	M1	2		2023-01-27 12:13:06.699204+09
99000	1	30030	EUS_M병기코드	3	MX	3		2023-01-27 12:13:06.699204+09
99000	1	30040	EUS_N병기코드	1	N(+)	1		2023-01-27 12:13:06.699204+09
99000	1	30040	EUS_N병기코드	2	N0	2		2023-01-27 12:13:06.699204+09
99000	1	30040	EUS_N병기코드	3	NX	3		2023-01-27 12:13:06.699204+09
99000	1	30050	EUS_T병기코드	01	T1a	1		2023-01-27 12:13:06.699204+09
99000	1	30050	EUS_T병기코드	02	T1b	2		2023-01-27 12:13:06.699204+09
99000	1	30050	EUS_T병기코드	03	T2	3		2023-01-27 12:13:06.699204+09
99000	1	30050	EUS_T병기코드	04	T3	4		2023-01-27 12:13:06.699204+09
99000	1	30050	EUS_T병기코드	05	T4a	5		2023-01-27 12:13:06.699204+09
99000	1	30050	EUS_T병기코드	06	T4b	6		2023-01-27 12:13:06.699204+09
99000	1	30050	EUS_T병기코드	07	TX	7		2023-01-27 12:13:06.699204+09
99000	1	30060	EUS합병증코드	1	None	1		2023-01-27 12:13:06.699204+09
99000	1	30060	EUS합병증코드	2	Bleeding	2		2023-01-27 12:13:06.699204+09
99000	1	30060	EUS합병증코드	3	Perforation	3		2023-01-27 12:13:06.699204+09
99000	1	30060	EUS합병증코드	4	Mallory-weiss tearing	4		2023-01-27 12:13:06.699204+09
99000	1	30060	EUS합병증코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	01	EGC-I	1		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	02	EGC-IIa	2		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	03	EGC-IIb	3		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	04	EGC-IIc	4		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	05	EGC-III	5		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	06	AGC-Bormann type 1	6		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	07	AGC-Bormann type 2	7		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	08	AGC-Bormann type 3	8		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	09	AGC-Bormann type 4	9		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	10	AGC-Bormann type 5	10		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	11	Combination	11		2023-01-27 12:13:06.699204+09
99000	1	30070	GROSS유형코드	99	기타/Unclassifiable	12		2023-01-27 12:13:06.699204+09
99000	1	30080	HPYLORI검사결과코드	1	Negative	1		2023-01-27 12:13:06.699204+09
99000	1	30080	HPYLORI검사결과코드	2	Positive	2		2023-01-27 12:13:06.699204+09
99000	1	30080	HPYLORI검사결과코드	3	Not evaluable	3		2023-01-27 12:13:06.699204+09
99000	1	30090	HPYLORI검사방법코드	1	H.pylori IgG Ab	1		2023-01-27 12:13:06.699204+09
99000	1	30090	HPYLORI검사방법코드	2	Histology(병리검사)	2		2023-01-27 12:13:06.699204+09
99000	1	30090	HPYLORI검사방법코드	3	Rapid urease test(CLO test)	3		2023-01-27 12:13:06.699204+09
99000	1	30090	HPYLORI검사방법코드	4	Urea Breath Test	4		2023-01-27 12:13:06.699204+09
99000	1	30090	HPYLORI검사방법코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	30120	감지여부구분코드	Y	Detected	1		2023-01-27 12:13:06.699204+09
99000	1	30120	감지여부구분코드	N	Not detected	2		2023-01-27 12:13:06.699204+09
99000	1	30120	감지여부구분코드	Z	Unknown	3		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	01	Apocrine differentiation	1		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	02	Apocrine metaplasia	2		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	03	Complex sclerosing lesion	3		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	04	Fibroadenoma 	4		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	05	Foamy histiocytic collection	5		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	06	Foreign body reaction	6		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	07	Intraductal papilloma	7		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	08	Medullary feature	8		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	09	Microcalcification	9		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	10	Mucinous component	10		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	11	Sclerosing adenosis	11		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	12	Stromal degeneration	12		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	13	Stromal fibrosis	13		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	14	Usual ductal hyperplasia	14		2023-01-27 12:13:06.699204+09
99000	1	30130	동반병변코드	99	기타	15		2023-01-27 12:13:06.699204+09
99000	1	30140	면역병리검사결과단위코드	1	Score	1		2023-01-27 12:13:06.699204+09
99000	1	30140	면역병리검사결과단위코드	2	%	2		2023-01-27 12:13:06.699204+09
99000	1	30160	면역병리검사소견코드	01	Positive	1		2023-01-27 12:13:06.699204+09
99000	1	30160	면역병리검사소견코드	02	Negative	2		2023-01-27 12:13:06.699204+09
99000	1	30160	면역병리검사소견코드	03	Focal positive	3		2023-01-27 12:13:06.699204+09
99000	1	30160	면역병리검사소견코드	04	Equivocal	4		2023-01-27 12:13:06.699204+09
99000	1	30160	면역병리검사소견코드	05	Not evaluable	5		2023-01-27 12:13:06.699204+09
99000	1	30160	면역병리검사소견코드	99	기타	11		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	01	AR	1		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	02	CK5/6	2		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	03	EBV	3		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	04	EGFR	4		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	05	ER	5		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	06	HER2	6		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	07	hMLH1	7		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	08	hMSH2	8		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	09	Ki67	9		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	10	MSH6	10		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	11	p53	11		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	12	PD-L1	12		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	13	PMS2	13		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	14	PR	14		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	15	TIL	15		2023-01-27 12:13:06.699204+09
99000	1	30170	면역병리검사종류코드	99	기타	16		2023-01-27 12:13:06.699204+09
99000	1	30190	분자병리검사결과종류코드	1	검사한 종양 세포의 핵 개수	1		2023-01-27 12:13:06.699204+09
99000	1	30190	분자병리검사결과종류코드	2	핵당 HER2 평균수	2		2023-01-27 12:13:06.699204+09
99000	1	30190	분자병리검사결과종류코드	3	핵당 CEP17 평균수	3		2023-01-27 12:13:06.699204+09
99000	1	30190	분자병리검사결과종류코드	4	HER2/CEP17 비율	4		2023-01-27 12:13:06.699204+09
99000	1	30190	분자병리검사결과종류코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	30200	분자병리검사결과코드	1	Positive	1		2023-01-27 12:13:06.699204+09
99000	1	30200	분자병리검사결과코드	2	Negative	2		2023-01-27 12:13:06.699204+09
99000	1	30200	분자병리검사결과코드	3	Equivocal	3		2023-01-27 12:13:06.699204+09
99000	1	30200	분자병리검사결과코드	4	Not evaluable 	4		2023-01-27 12:13:06.699204+09
99000	1	30210	분자병리검사방법코드	1	SISH	1		2023-01-27 12:13:06.699204+09
99000	1	30210	분자병리검사방법코드	2	FISH	2		2023-01-27 12:13:06.699204+09
99000	1	30220	분자병리검사소견코드	1	Positive	1		2023-01-27 12:13:06.699204+09
99000	1	30220	분자병리검사소견코드	2	Negative	2		2023-01-27 12:13:06.699204+09
99000	1	30220	분자병리검사소견코드	3	Microsatellite instability - high (MSI-H)	3		2023-01-27 12:13:06.699204+09
99000	1	30220	분자병리검사소견코드	4	Microsatellite instability - low (MSI-L)	4		2023-01-27 12:13:06.699204+09
99000	1	30220	분자병리검사소견코드	5	Microsatellite stable (MSS)	5		2023-01-27 12:13:06.699204+09
99000	1	30220	분자병리검사소견코드	6	Not evaluable	6		2023-01-27 12:13:06.699204+09
99000	1	30230	분자병리검사종류코드	1	EBV ISH	1		2023-01-27 12:13:06.699204+09
99000	1	30230	분자병리검사종류코드	2	HER-2	2		2023-01-27 12:13:06.699204+09
99000	1	30230	분자병리검사종류코드	3	Microsatellite instability(MSI)	3		2023-01-27 12:13:06.699204+09
99000	1	30230	분자병리검사종류코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	01	G1	1		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	02	G2	2		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	03	G3	3		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	04	Gx	4		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	05	High	5		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	06	Intermediate	6		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	07	Low	7		2023-01-27 12:13:06.699204+09
99000	1	30250	상피내암핵등급코드	99	기타	8		2023-01-27 12:13:06.699204+09
99000	1	30260	생식세포변이검사방법코드	1	Sanger sequencing	1		2023-01-27 12:13:06.699204+09
99000	1	30260	생식세포변이검사방법코드	2	NGS	2		2023-01-27 12:13:06.699204+09
99000	1	30260	생식세포변이검사방법코드	9	기타	3		2023-01-27 12:13:06.699204+09
99000	1	30270	생식세포변이검사유전자종류코드	1	BRCA1	1		2023-01-27 12:13:06.699204+09
99000	1	30270	생식세포변이검사유전자종류코드	2	BRCA2	2		2023-01-27 12:13:06.699204+09
99000	1	30270	생식세포변이검사유전자종류코드	9	기타	3		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	01	Biopsy	1		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	02	Computed tomography and biopsy	2		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	03	Endoscopic biopsy	3		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	04	Excision	4		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	05	Gun biopsy	5		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	06	Laparoscopic biopsy	6		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	07	Needle biopsy	7		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	08	Percutaneous liver biopsy	8		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	09	Surgical biopsy	9		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	10	Transjugular biopsy	10		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	11	Transjugular biopsy using fluoroscopic guidance	11		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	12	Ultrasound scan and biopsy	12		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	13	Vacuum Assisted Breast Biopsy(MMT)	13		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	14	Wedge biopsy	14		2023-01-27 12:13:06.699204+09
99000	1	30290	생체검사방법종류코드	99	기타	15		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	01	Brain	1		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	02	Breast	2		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	03	Chest	3		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	04	Liver	4		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	05	LN	5		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	06	Lung	6		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	07	Stomach	7		2023-01-27 12:13:06.699204+09
99000	1	30310	생체검사부위코드	99	기타	8		2023-01-27 12:13:06.699204+09
99000	1	30320	생체검사부위편측성코드	1	Left	1		2023-01-27 12:13:06.699204+09
99000	1	30320	생체검사부위편측성코드	2	Right	2		2023-01-27 12:13:06.699204+09
99000	1	30320	생체검사부위편측성코드	3	Bilateral	3		2023-01-27 12:13:06.699204+09
99000	1	30320	생체검사부위편측성코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	30330	수술절제면잔존코드	1	R0	1		2023-01-27 12:13:06.699204+09
99000	1	30330	수술절제면잔존코드	2	R1	2		2023-01-27 12:13:06.699204+09
99000	1	30330	수술절제면잔존코드	3	R2	3		2023-01-27 12:13:06.699204+09
99000	1	30330	수술절제면잔존코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	30340	수술둘레방향종양위치코드	01	Lesser curvature	1		2023-01-27 12:13:06.699204+09
99000	1	30340	수술둘레방향종양위치코드	02	Greater curvature	2		2023-01-27 12:13:06.699204+09
99000	1	30340	수술둘레방향종양위치코드	03	Anterior wall	3		2023-01-27 12:13:06.699204+09
99000	1	30340	수술둘레방향종양위치코드	04	Posterior wall	4		2023-01-27 12:13:06.699204+09
99000	1	30340	수술둘레방향종양위치코드	05	Encircling	5		2023-01-27 12:13:06.699204+09
99000	1	30340	수술둘레방향종양위치코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	30640	수술종방향종양위치A코드	01	Cardia	1		2023-01-27 12:13:06.699204+09
99000	1	30640	수술종방향종양위치A코드	02	Fundus	2		2023-01-27 12:13:06.699204+09
99000	1	30640	수술종방향종양위치A코드	03	Body	3		2023-01-27 12:13:06.699204+09
99000	1	30640	수술종방향종양위치A코드	04	Angle	4		2023-01-27 12:13:06.699204+09
99000	1	30640	수술종방향종양위치A코드	05	Antrum	5		2023-01-27 12:13:06.699204+09
99000	1	30640	수술종방향종양위치A코드	06	Pylorus	6		2023-01-27 12:13:06.699204+09
99000	1	30640	수술종방향종양위치A코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	30650	수술종방향종양위치B코드	01	Esophagus	1		2023-01-27 12:13:06.699204+09
99000	1	30650	수술종방향종양위치B코드	02	Upper (EGJ 포함)	2		2023-01-27 12:13:06.699204+09
99000	1	30650	수술종방향종양위치B코드	03	Middle	3		2023-01-27 12:13:06.699204+09
99000	1	30650	수술종방향종양위치B코드	04	Lower	4		2023-01-27 12:13:06.699204+09
99000	1	30650	수술종방향종양위치B코드	05	Duodenum	5		2023-01-27 12:13:06.699204+09
99000	1	30650	수술종방향종양위치B코드	06	Entire (Whole)	6		2023-01-27 12:13:06.699204+09
99000	1	30650	수술종방향종양위치B코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	01	Ala(A)	1		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	02	Arg(R)	2		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	03	Asn(N)	3		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	04	Asp(D)	4		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	05	Cys(C)	5		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	06	Gln(Q)	6		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	07	Glu(E)	7		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	08	Gly(G)	8		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	09	His(H)	9		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	10	Ile(I)	10		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	11	Leu(L)	11		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	12	Lys(K)	12		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	13	Met(M)	13		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	14	Phe(F)	14		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	15	Pro(P)	15		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	16	Ser(S)	16		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	17	Thr(T)	17		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	18	Trp(W)	18		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	19	Tyr(Y)	19		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	20	Val(V)	20		2023-01-27 12:13:06.699204+09
99000	1	30350	아미노산변이정보A코드	99	기타	21		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	01	Ala(A)	1		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	02	Arg(R)	2		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	03	Asn(N)	3		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	04	Asp(D)	4		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	05	Cys(C)	5		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	06	del	6		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	07	dup	7		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	08	fs(Frame shift)	8		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	09	Gln(Q)	9		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	10	Glu(E)	10		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	11	Gly(G)	11		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	12	His(H)	12		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	13	Ile(I)	13		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	14	ins	14		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	15	Leu(L)	15		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	16	Lys(K)	16		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	17	Met(M)	17		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	18	Phe(F)	18		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	19	Pro(P)	19		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	20	Ser(S)	20		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	21	Thr(T)	21		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	22	Trp(W)	22		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	23	Tyr(Y)	23		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	24	Val(V)	24		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	25	*(Ter/Stop)	25		2023-01-27 12:13:06.699204+09
99000	1	30360	아미노산변이정보C코드	99	기타	26		2023-01-27 12:13:06.699204+09
99000	1	30370	양성여부구분코드	Y	Positive	1		2023-01-27 12:13:06.699204+09
99000	1	30370	양성여부구분코드	N	Negative	2		2023-01-27 12:13:06.699204+09
99000	1	30370	양성여부구분코드	Z	Indeterminate	3		2023-01-27 12:13:06.699204+09
99000	1	30380	여부확인불가구분코드	Y	Yes	1		2023-01-27 12:13:06.699204+09
99000	1	30380	여부확인불가구분코드	N	No	2		2023-01-27 12:13:06.699204+09
99000	1	30380	여부확인불가구분코드	Z	Unknown	3		2023-01-27 12:13:06.699204+09
99000	1	30400	영상검사결과진단적분류코드	01	Negative	1		2023-01-27 12:13:06.699204+09
99000	1	30400	영상검사결과진단적분류코드	02	Benign	2		2023-01-27 12:13:06.699204+09
99000	1	30400	영상검사결과진단적분류코드	03	Probably benign	3		2023-01-27 12:13:06.699204+09
99000	1	30400	영상검사결과진단적분류코드	04	Suspicous	4		2023-01-27 12:13:06.699204+09
99000	1	30400	영상검사결과진단적분류코드	05	Highly suggestive	5		2023-01-27 12:13:06.699204+09
99000	1	30400	영상검사결과진단적분류코드	06	Proven malignancy	6		2023-01-27 12:13:06.699204+09
99000	1	30400	영상검사결과진단적분류코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	01	Bone scan	1		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	02	CT	2		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	03	DBT	3		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	04	Dexa	4		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	05	MMG	5		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	06	MRI	6		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	07	PET	7		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	08	PET-CT	8		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	09	SONO	9		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	10	X-ray	10		2023-01-27 12:13:06.699204+09
99000	1	30410	영상검사종류코드	99	기타	11		2023-01-27 12:13:06.699204+09
99000	1	30430	외과병리채취부위코드	1	Breast	1		2023-01-27 12:13:06.699204+09
99000	1	30430	외과병리채취부위코드	2	Stomach	2		2023-01-27 12:13:06.699204+09
99000	1	30430	외과병리채취부위코드	3	LN	3		2023-01-27 12:13:06.699204+09
99000	1	30430	외과병리채취부위코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	01	EGC-I	1		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	02	EGC-IIa	2		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	03	EGC-IIb	3		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	04	EGC-IIc	4		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	05	EGC-III	5		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	06	AGC-Bormann type 1	6		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	07	AGC-Bormann type 2	7		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	08	AGC-Bormann type 3	8		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	09	AGC-Bormann type 4	9		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	10	AGC-Bormann type 5	10		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	11	Combination	11		2023-01-27 12:13:06.699204+09
99000	1	30440	위내시경검사결과유형코드	99	기타/Unclassifiable	12		2023-01-27 12:13:06.699204+09
99000	1	30450	위내시경검사목적코드	01	공단검진	1		2023-01-27 12:13:06.699204+09
99000	1	30450	위내시경검사목적코드	02	내시경 시술 및 추적검사	2		2023-01-27 12:13:06.699204+09
99000	1	30450	위내시경검사목적코드	03	수술후 추적검사	3		2023-01-27 12:13:06.699204+09
99000	1	30450	위내시경검사목적코드	04	암예방검진센터 수검자	4		2023-01-27 12:13:06.699204+09
99000	1	30450	위내시경검사목적코드	05	진단	5		2023-01-27 12:13:06.699204+09
99000	1	30450	위내시경검사목적코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	30460	위내시경합병증등급코드	01	0	1		2023-01-27 12:13:06.699204+09
99000	1	30460	위내시경합병증등급코드	02	I	2		2023-01-27 12:13:06.699204+09
99000	1	30460	위내시경합병증등급코드	03	II	3		2023-01-27 12:13:06.699204+09
99000	1	30460	위내시경합병증등급코드	04	IIIa	4		2023-01-27 12:13:06.699204+09
99000	1	30460	위내시경합병증등급코드	05	IV	5		2023-01-27 12:13:06.699204+09
99000	1	30460	위내시경합병증등급코드	06	V	6		2023-01-27 12:13:06.699204+09
99000	1	30460	위내시경합병증등급코드	07	Not available	7		2023-01-27 12:13:06.699204+09
99000	1	30470	위내시경합병증코드	1	None	1		2023-01-27 12:13:06.699204+09
99000	1	30470	위내시경합병증코드	2	Bleeding	2		2023-01-27 12:13:06.699204+09
99000	1	30470	위내시경합병증코드	3	Perforation	3		2023-01-27 12:13:06.699204+09
99000	1	30470	위내시경합병증코드	4	Mallory-weiss tearing	4		2023-01-27 12:13:06.699204+09
99000	1	30470	위내시경합병증코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	30480	위식도경계부위암분류코드	1	Type I	1		2023-01-27 12:13:06.699204+09
99000	1	30480	위식도경계부위암분류코드	2	Type II	2		2023-01-27 12:13:06.699204+09
99000	1	30480	위식도경계부위암분류코드	3	Type III	3		2023-01-27 12:13:06.699204+09
99000	1	30480	위식도경계부위암분류코드	4	해당없음	4		2023-01-27 12:13:06.699204+09
99000	1	30480	위식도경계부위암분류코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	30490	유방밀도분류코드	1	Extremely dense 	1		2023-01-27 12:13:06.699204+09
99000	1	30490	유방밀도분류코드	2	Fatty breast	2		2023-01-27 12:13:06.699204+09
99000	1	30490	유방밀도분류코드	3	Heterogeneously dense	3		2023-01-27 12:13:06.699204+09
99000	1	30490	유방밀도분류코드	4	Scattered fibroglandular	4		2023-01-27 12:13:06.699204+09
99000	1	30490	유방밀도분류코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	30500	유전자발현검사결과종류코드	01	EPclin score	1		2023-01-27 12:13:06.699204+09
99000	1	30500	유전자발현검사결과종류코드	02	Mammaprint Index	2		2023-01-27 12:13:06.699204+09
99000	1	30500	유전자발현검사결과종류코드	03	Oncotype Recurrence Score (RS)	3		2023-01-27 12:13:06.699204+09
99000	1	30500	유전자발현검사결과종류코드	04	Risk Assessment	4		2023-01-27 12:13:06.699204+09
99000	1	30500	유전자발현검사결과종류코드	05	Risk-of-Recurrence Result	5		2023-01-27 12:13:06.699204+09
99000	1	30510	유전자발현검사종류코드	01	BCI	1		2023-01-27 12:13:06.699204+09
99000	1	30510	유전자발현검사종류코드	02	Endopredict	2		2023-01-27 12:13:06.699204+09
99000	1	30510	유전자발현검사종류코드	03	GenesWell BCT	3		2023-01-27 12:13:06.699204+09
99000	1	30510	유전자발현검사종류코드	04	Mammaprint	4		2023-01-27 12:13:06.699204+09
99000	1	30510	유전자발현검사종류코드	05	Oncofree	5		2023-01-27 12:13:06.699204+09
99000	1	30510	유전자발현검사종류코드	06	Oncotype Dx	6		2023-01-27 12:13:06.699204+09
99000	1	30510	유전자발현검사종류코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	30520	조직학적등급코드	1	Gx	1		2023-01-27 12:13:06.699204+09
99000	1	30520	조직학적등급코드	2	G1	2		2023-01-27 12:13:06.699204+09
99000	1	30520	조직학적등급코드	3	G2	3		2023-01-27 12:13:06.699204+09
99000	1	30520	조직학적등급코드	4	G3 	4		2023-01-27 12:13:06.699204+09
99000	1	30530	조직학적분화도코드	1	Well differentiated	1		2023-01-27 12:13:06.699204+09
99000	1	30530	조직학적분화도코드	2	Moderately differentiated	2		2023-01-27 12:13:06.699204+09
99000	1	30530	조직학적분화도코드	3	Poorly differentiated	3		2023-01-27 12:13:06.699204+09
99000	1	30530	조직학적분화도코드	4	Combined	4		2023-01-27 12:13:06.699204+09
99000	1	30530	조직학적분화도코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	01	Adenosquamous carcinoma	1		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	02	Carcinoma with lymphoid stroma	2		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	03	DCIS ; Ductal carcinoma in situ	3		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	04	Gastrointestinal stromal tumor	4		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	05	Hepatoid adenocarcinoma	5		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	06	ILC ;Invasive lobular carcinoma	6		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	07	Invasive ductal carcinoma ;IDC, micro IDC	7		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	08	LCIS ; Lobular carcinoma in situ	8		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	09	Lymphoma	9		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	10	Malignant Phyllodes tumor	10		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	11	Medullary carcinoma	11		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	12	Metaplastic carcinoma	12		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	13	Mixed adenocarcinoma	13		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	14	Mucinous adenocarcinoma	14		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	15	Mucinous carcinoma	15		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	16	Neuroendocrine tumor	16		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	17	Paget's disease	17		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	18	Papillary adenocarcinoma	18		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	19	Papillary carcinoma	19		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	20	Poorly cohesive carcinoma(signet ring cell carcinoma 포함)	20		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	21	Sarcoma	21		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	22	Squamous cell carcinoma	22		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	23	Tubular adenocarcinoma	23		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	24	Tubular carcinoma	24		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	25	Undifferentiated carcinoma	25		2023-01-27 12:13:06.699204+09
99000	1	30540	조직학적진단코드	99	기타	26		2023-01-27 12:13:06.699204+09
99000	1	30550	존재여부구분코드	Y	Present	1		2023-01-27 12:13:06.699204+09
99000	1	30550	존재여부구분코드	N	Absent	2		2023-01-27 12:13:06.699204+09
99000	1	30550	존재여부구분코드	Z	Not evaluable	3		2023-01-27 12:13:06.699204+09
99000	1	30560	잔여종양코드	01	No residual	1		2023-01-27 12:13:06.699204+09
99000	1	30560	잔여종양코드	02	CIS only	2		2023-01-27 12:13:06.699204+09
99000	1	30560	잔여종양코드	03	Residual breast tumor	3		2023-01-27 12:13:06.699204+09
99000	1	30560	잔여종양코드	04	Residual LN meta	4		2023-01-27 12:13:06.699204+09
99000	1	30560	잔여종양코드	05	Residual breast tumor and LN meta	5		2023-01-27 12:13:06.699204+09
99000	1	30560	잔여종양코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	01	Albumin	1		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	02	Alkaline Phosphatase	2		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	03	ALT 	3		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	04	ANC	4		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	05	Basophil	5		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	06	CA 15-3	6		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	07	CA-125	7		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	08	CA19-9	8		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	09	CA72-4	9		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	10	Calcium	10		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	11	CEA	11		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	12	Creatinine	12		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	13	CRP	13		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	14	E2	14		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	15	Eosinophil	15		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	16	Ferritin	16		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	17	FSH	17		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	18	Glucose	18		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	19	Hematocrit	19		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	20	Hemoglobin	20		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	21	Iron	21		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	22	Lymphocyte	22		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	23	Monocyte	23		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	24	Neutrophil	24		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	25	Platelets	25		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	26	Protein	26		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	27	RBC 	27		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	28	TIBC	28		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	29	Total Cholesterol	29		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	30	Vitamin B12	30		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	31	WBC	31		2023-01-27 12:13:06.699204+09
99000	1	30580	진단검사종류코드	99	기타	32		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	01	Abdominal wall	1		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	02	Adrenal gland	2		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	03	Colon	3		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	04	Diaphragm	4		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	05	Gallbladder	5		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	06	Liver	6		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	07	Mesocolon	7		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	08	Pancreas	8		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	09	Retroperitoneum	9		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	10	Spleen	10		2023-01-27 12:13:06.699204+09
99000	1	30600	침습장기코드	99	기타	11		2023-01-27 12:13:06.699204+09
99000	1	30610	침윤정도코드	01	Mucosa	1		2023-01-27 12:13:06.699204+09
99000	1	30610	침윤정도코드	02	Submucosa	2		2023-01-27 12:13:06.699204+09
99000	1	30610	침윤정도코드	03	Proper muscle	3		2023-01-27 12:13:06.699204+09
99000	1	30610	침윤정도코드	04	Subseroca	4		2023-01-27 12:13:06.699204+09
99000	1	30610	침윤정도코드	05	Serosa	5		2023-01-27 12:13:06.699204+09
99000	1	30610	침윤정도코드	06	Adjacent organ	6		2023-01-27 12:13:06.699204+09
99000	1	30610	침윤정도코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	30630	포함여부구분코드	Y	Involved	1		2023-01-27 12:13:06.699204+09
99000	1	30630	포함여부구분코드	N	Not involved	2		2023-01-27 12:13:06.699204+09
99000	1	30630	포함여부구분코드	Z	No data	3		2023-01-27 12:13:06.699204+09
99000	1	40010	ASA점수코드	01	정상의 건강한 환자	1		2023-01-27 12:13:06.699204+09
99000	1	40010	ASA점수코드	02	경도의 전신 질환을 가진 환자	2		2023-01-27 12:13:06.699204+09
99000	1	40010	ASA점수코드	03	중등도의 중증 전신질환을 가진 환자	3		2023-01-27 12:13:06.699204+09
99000	1	40010	ASA점수코드	04	지속적으로 생명을 위협하는 중증의 전신질환을 가진 환자	4		2023-01-27 12:13:06.699204+09
99000	1	40010	ASA점수코드	05	수술하지 않으면 생명을 유지할 수 없는 정도의 중증질환을 가진 환자	5		2023-01-27 12:13:06.699204+09
99000	1	40010	ASA점수코드	99	장기 공여를 위한 수술 예정인 뇌사자	6		2023-01-27 12:13:06.699204+09
99000	1	40020	ESD결과코드	1	En bloc resection	1		2023-01-27 12:13:06.699204+09
99000	1	40020	ESD결과코드	2	Piecemeal resection	2		2023-01-27 12:13:06.699204+09
99000	1	40020	ESD결과코드	3	Failure	3		2023-01-27 12:13:06.699204+09
99000	1	40030	ESD병변모양코드	1	Elevated (I, IIa, IIa+IIc)	1		2023-01-27 12:13:06.699204+09
99000	1	40030	ESD병변모양코드	2	Flat (IIb)	2		2023-01-27 12:13:06.699204+09
99000	1	40030	ESD병변모양코드	3	Depressed  (IIc)	3		2023-01-27 12:13:06.699204+09
99000	1	40040	ESD병변위치가로코드	1	Lessor curvature	1		2023-01-27 12:13:06.699204+09
99000	1	40040	ESD병변위치가로코드	2	Greater curvature	2		2023-01-27 12:13:06.699204+09
99000	1	40040	ESD병변위치가로코드	3	Posterior wall	3		2023-01-27 12:13:06.699204+09
99000	1	40040	ESD병변위치가로코드	4	Anterior wall	4		2023-01-27 12:13:06.699204+09
99000	1	40050	ESD병변위치세로코드	01	Antrum	1		2023-01-27 12:13:06.699204+09
99000	1	40050	ESD병변위치세로코드	02	Angle	2		2023-01-27 12:13:06.699204+09
99000	1	40050	ESD병변위치세로코드	03	Lowerbody	3		2023-01-27 12:13:06.699204+09
99000	1	40050	ESD병변위치세로코드	04	Midbody	4		2023-01-27 12:13:06.699204+09
99000	1	40050	ESD병변위치세로코드	05	Upperbody or cardia	5		2023-01-27 12:13:06.699204+09
99000	1	40060	ESD천공조치코드	1	수술	1		2023-01-27 12:13:06.699204+09
99000	1	40060	ESD천공조치코드	2	내시경적치료 (clipping)	2		2023-01-27 12:13:06.699204+09
99000	1	40060	ESD천공조치코드	3	내시경치료 없이 보존치료 (산소투여 등)	3		2023-01-27 12:13:06.699204+09
99000	1	40080	감시림프절검출방법코드	1	Dye	1		2023-01-27 12:13:06.699204+09
99000	1	40080	감시림프절검출방법코드	2	ICG	2		2023-01-27 12:13:06.699204+09
99000	1	40080	감시림프절검출방법코드	3	Indigocarmine	3		2023-01-27 12:13:06.699204+09
99000	1	40080	감시림프절검출방법코드	4	Radioisotope	4		2023-01-27 12:13:06.699204+09
99000	1	40080	감시림프절검출방법코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	40090	그물막절제범위코드	1	Total	1		2023-01-27 12:13:06.699204+09
99000	1	40090	그물막절제범위코드	2	Partial	2		2023-01-27 12:13:06.699204+09
99000	1	40090	그물막절제범위코드	3	Not done	3		2023-01-27 12:13:06.699204+09
99000	1	40090	그물막절제범위코드	4	Not applicable	4		2023-01-27 12:13:06.699204+09
99000	1	40100	근치도코드	1	R0 resection	1		2023-01-27 12:13:06.699204+09
99000	1	40100	근치도코드	2	R1 resection	2		2023-01-27 12:13:06.699204+09
99000	1	40100	근치도코드	3	R2 resection	3		2023-01-27 12:13:06.699204+09
99000	1	40100	근치도코드	4	Not applicable	4		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	01	<D1	1		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	02	D1	2		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	03	D1+	3		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	04	D2	4		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	05	D2+	5		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	06	Sentinel basin dissection	6		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	07	None	7		2023-01-27 12:13:06.699204+09
99000	1	40110	림프절절제정도코드	99	기타	8		2023-01-27 12:13:06.699204+09
99000	1	40130	방사선치료목적코드	1	Curative	1		2023-01-27 12:13:06.699204+09
99000	1	40130	방사선치료목적코드	2	Palliative	2		2023-01-27 12:13:06.699204+09
99000	1	40130	방사선치료목적코드	3	Adjuvant	3		2023-01-27 12:13:06.699204+09
99000	1	40130	방사선치료목적코드	4	Neoadjuvant	4		2023-01-27 12:13:06.699204+09
99000	1	40130	방사선치료목적코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	01	Abdomen wall	1		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	02	Bone	2		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	03	Boost	3		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	04	Brain	4		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	05	Breast	5		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	06	Distant lymph node	6		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	07	Liver	7		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	08	LN	8		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	09	Lung	9		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	10	Stomach	10		2023-01-27 12:13:06.699204+09
99000	1	40140	방사선치료부위코드	99	기타	11		2023-01-27 12:13:06.699204+09
99000	1	40150	방사선치료부작용등급코드	01	Grade 1	1		2023-01-27 12:13:06.699204+09
99000	1	40150	방사선치료부작용등급코드	02	Grade 2	2		2023-01-27 12:13:06.699204+09
99000	1	40150	방사선치료부작용등급코드	03	Grade 3	3		2023-01-27 12:13:06.699204+09
99000	1	40150	방사선치료부작용등급코드	04	Grade 4	4		2023-01-27 12:13:06.699204+09
99000	1	40150	방사선치료부작용등급코드	05	Grade 5	5		2023-01-27 12:13:06.699204+09
99000	1	40160	방사선치료부작용시기구분코드	1	급성(3개월 이내)	1		2023-01-27 12:13:06.699204+09
99000	1	40160	방사선치료부작용시기구분코드	2	만성(3개월 초과)	2		2023-01-27 12:13:06.699204+09
99000	1	40170	방사선치료부작용종류코드	01	Aches	1		2023-01-27 12:13:06.699204+09
99000	1	40170	방사선치료부작용종류코드	02	Fatigue	2		2023-01-27 12:13:06.699204+09
99000	1	40170	방사선치료부작용종류코드	03	Heart damage	3		2023-01-27 12:13:06.699204+09
99000	1	40170	방사선치료부작용종류코드	04	Radiation pneumonitis	4		2023-01-27 12:13:06.699204+09
99000	1	40170	방사선치료부작용종류코드	05	Skin irritation	5		2023-01-27 12:13:06.699204+09
99000	1	40170	방사선치료부작용종류코드	06	Swelling of  breast	6		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	01	뇌 정위적 방사선수술	1		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	02	밀봉소선원치료	2		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	03	세기변조 방사선치료	3		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	04	양성자 치료	4		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	05	입체조형치료	5		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	06	전신조사	6		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	07	정위적 방사선 분할치료	7		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	08	체부 정위적 방사선수술	8		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	09	체외조사	9		2023-01-27 12:13:06.699204+09
99000	1	40180	방사선치료종류코드	99	기타	10		2023-01-27 12:13:06.699204+09
99000	1	40200	방사선치료평가항목코드	01	CR	1		2023-01-27 12:13:06.699204+09
99000	1	40200	방사선치료평가항목코드	02	PD	2		2023-01-27 12:13:06.699204+09
99000	1	40200	방사선치료평가항목코드	03	PR	3		2023-01-27 12:13:06.699204+09
99000	1	40200	방사선치료평가항목코드	04	SD	4		2023-01-27 12:13:06.699204+09
99000	1	40200	방사선치료평가항목코드	05	NE	5		2023-01-27 12:13:06.699204+09
99000	1	40200	방사선치료평가항목코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	01	MAC	1		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	02	경막외	2		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	03	국소	3		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	04	신경차단	4		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	05	전신	5		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	06	정맥	6		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	07	척추	7		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	08	척추+경막외	8		2023-01-27 12:13:06.699204+09
99000	1	40240	수술마취부위코드	99	기타	9		2023-01-27 12:13:06.699204+09
99000	1	40250	수술목적코드	1	Curative	1		2023-01-27 12:13:06.699204+09
99000	1	40250	수술목적코드	2	Palliative	2		2023-01-27 12:13:06.699204+09
99000	1	40250	수술목적코드	9	기타	3		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	01	개복	1		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	02	내시경 복강경 협력 수술	2		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	03	로봇 보조	3		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	04	로봇-다공	4		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	05	로봇-단일공	5		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	06	복강경보조	6		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	07	전복강경 (다공, multi-port)	7		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	08	전복강경 (단일공, single port)	8		2023-01-27 12:13:06.699204+09
99000	1	40260	수술방법코드	99	기타	9		2023-01-27 12:13:06.699204+09
99000	1	40270	수술부위코드	1	Breast	1		2023-01-27 12:13:06.699204+09
99000	1	40270	수술부위코드	2	LN	2		2023-01-27 12:13:06.699204+09
99000	1	40270	수술부위코드	9	기타	3		2023-01-27 12:13:06.699204+09
99000	1	40280	수술시항암요법코드	01	No	1		2023-01-27 12:13:06.699204+09
99000	1	40280	수술시항암요법코드	02	IP chemo	2		2023-01-27 12:13:06.699204+09
99000	1	40280	수술시항암요법코드	03	HIPEC	3		2023-01-27 12:13:06.699204+09
99000	1	40280	수술시항암요법코드	04	LHIPEC	4		2023-01-27 12:13:06.699204+09
99000	1	40280	수술시항암요법코드	05	PIPAC	5		2023-01-27 12:13:06.699204+09
99000	1	40280	수술시항암요법코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40290	수술절개방법코드	01	Rt upper transverse incision & multi-ports	1		2023-01-27 12:13:06.699204+09
99000	1	40290	수술절개방법코드	02	Short upper midline & multi-ports	2		2023-01-27 12:13:06.699204+09
99000	1	40290	수술절개방법코드	03	Single port/ single incision	3		2023-01-27 12:13:06.699204+09
99000	1	40290	수술절개방법코드	04	Umbilical incision & multi-ports	4		2023-01-27 12:13:06.699204+09
99000	1	40290	수술절개방법코드	05	Upper midline	5		2023-01-27 12:13:06.699204+09
99000	1	40290	수술절개방법코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40300	수술절개선유형코드	01	Curved linear	1		2023-01-27 12:13:06.699204+09
99000	1	40300	수술절개선유형코드	02	Elliptical	2		2023-01-27 12:13:06.699204+09
99000	1	40300	수술절개선유형코드	03	Inframammary	3		2023-01-27 12:13:06.699204+09
99000	1	40300	수술절개선유형코드	04	Periareolar	4		2023-01-27 12:13:06.699204+09
99000	1	40300	수술절개선유형코드	05	Radial	5		2023-01-27 12:13:06.699204+09
99000	1	40300	수술절개선유형코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	01	Augmentation Mammoplasty	1		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	02	Axillary Sentinel Lymph Node Excision	2		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	03	Breast conserving surgery	3		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	04	Breast Reconstruction	4		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	05	Dissection of  Axillary Lymph Node	5		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	06	Distal gastrectomy	6		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	07	Excision or destruction of breast tissue	7		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	08	Immediate Implant Insertion Following Mastectomy	8		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	09	Local excision of lesion of breast	9		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	10	Lumpectomy	10		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	11	Mastectomy With Axillary L/N Dissection	11		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	12	Mastectomy Without Axillary L/N Dissection	12		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	13	Modified radical mastectomy	13		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	14	Musculocutaneous Flap	14		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	15	Open and closure with biopsy	15		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	16	Other Mammoplasty	16		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	17	Partial Mastectomy	17		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	18	Proximal gastrectomy	18		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	19	Pylorus preserving gastrectomy	19		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	20	Reduction Mammoplasty	20		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	21	Resection of quadrant of breast	21		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	22	Revision of implant of breast	22		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	23	Segmental resection	23		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	24	Simple Mastectomy	24		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	25	Skin sparing mastectomy	25		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	26	Subcutaneous Mastectomy	26		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	27	Total gastrectomy	27		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	28	Wedge resection	28		2023-01-27 12:13:06.699204+09
99000	1	40310	수술종류코드	99	기타	29		2023-01-27 12:13:06.699204+09
99000	1	40320	수술종양상세위치코드	01	Central	1		2023-01-27 12:13:06.699204+09
99000	1	40320	수술종양상세위치코드	02	Lower inner	2		2023-01-27 12:13:06.699204+09
99000	1	40320	수술종양상세위치코드	03	Lower outer	3		2023-01-27 12:13:06.699204+09
99000	1	40320	수술종양상세위치코드	04	Upper inner	4		2023-01-27 12:13:06.699204+09
99000	1	40320	수술종양상세위치코드	05	Upper outer	5		2023-01-27 12:13:06.699204+09
99000	1	40320	수술종양상세위치코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40350	수술후평가항목코드	01	CR	1		2023-01-27 12:13:06.699204+09
99000	1	40350	수술후평가항목코드	02	PD	2		2023-01-27 12:13:06.699204+09
99000	1	40350	수술후평가항목코드	03	PR	3		2023-01-27 12:13:06.699204+09
99000	1	40350	수술후평가항목코드	04	SD	4		2023-01-27 12:13:06.699204+09
99000	1	40350	수술후평가항목코드	05	NE	5		2023-01-27 12:13:06.699204+09
99000	1	40350	수술후평가항목코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40380	약제구분코드	01	세포독성약제	1		2023-01-27 12:13:06.699204+09
99000	1	40380	약제구분코드	02	항암표적약제	2		2023-01-27 12:13:06.699204+09
99000	1	40380	약제구분코드	03	항암내분비약제	3		2023-01-27 12:13:06.699204+09
99000	1	40380	약제구분코드	04	항암면역약제	4		2023-01-27 12:13:06.699204+09
99000	1	40380	약제구분코드	05	기타항암약제	5		2023-01-27 12:13:06.699204+09
99000	1	40380	약제구분코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40390	약제분류코드	1	항암약제	1		2023-01-27 12:13:06.699204+09
99000	1	40390	약제분류코드	9	기타약제	2		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	01	Abemaciclib	1		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	02	Albumin-bound paclitaxel	2		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	03	Anastrozole	3		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	04	Bevacizumab	4		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	05	Capecitabine	5		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	06	Carboplatin	6		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	07	Cetuximab	7		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	08	Cisplatin	8		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	09	Cyclophosphamide	9		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	10	Docetaxel	10		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	11	Doxorubicin	11		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	12	Epirubicin	12		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	13	Eribulin	13		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	14	Etoposide	14		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	15	Everolimus	15		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	16	Exemestane	16		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	17	Fluorouracil	17		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	18	Fulvestrant	18		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	19	Gemcitabine	19		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	20	Goserelin	20		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	21	Ifosfamide	21		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	22	Irinotecan	22		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	23	Irinotecan hydrochloride	23		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	24	lapatinib	24		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	25	Letrozole	25		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	26	Leucovorin	26		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	27	Leuprolide	27		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	28	Megestrol acetate	28		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	29	Methotrexate	29		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	30	Mitomycin C	30		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	31	Nivolumab	31		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	32	Oxaliplatin	32		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	33	Paclitaxel	33		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	34	Palbociclib	34		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	35	Pembrolizumab	35		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	36	Pertuzumab	36		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	37	Ramucirumab	37		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	38	Ribociclib	38		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	39	Tamoxifen	39		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	40	Tegafur/gimeracil/oteracil(S-1)	40		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	41	Toremifene 	41		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	42	Trastuzumab	42		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	43	Trastuzumab emtansine 	43		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	44	Trifluridine-tipiracil	44		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	45	Vinorelbine	45		2023-01-27 12:13:06.699204+09
99000	1	40400	약제성분종류코드	99	기타	46		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	01	amp	1		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	02	cap	2		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	03	dos	3		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	04	ea	4		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	05	g	5		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	06	g/kg	6		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	07	g/m2	7		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	08	ke	8		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	09	kit	9		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	10	mcg	10		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	11	mcg/kg	11		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	12	mcg/m2	12		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	13	mg	13		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	14	mg/kg	14		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	15	mg/m2	15		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	16	ml	16		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	17	pfu	17		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	18	pkg	18		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	19	set	19		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	20	tab	20		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	21	unit	21		2023-01-27 12:13:06.699204+09
99000	1	40420	약제처방용량단위코드	99	기타	22		2023-01-27 12:13:06.699204+09
99000	1	40440	약제투여경로코드	01	경구	1		2023-01-27 12:13:06.699204+09
99000	1	40440	약제투여경로코드	02	근육주사	2		2023-01-27 12:13:06.699204+09
99000	1	40440	약제투여경로코드	03	정맥내주사	3		2023-01-27 12:13:06.699204+09
99000	1	40440	약제투여경로코드	04	척수강내주사	4		2023-01-27 12:13:06.699204+09
99000	1	40440	약제투여경로코드	05	피내주사	5		2023-01-27 12:13:06.699204+09
99000	1	40440	약제투여경로코드	06	피하주사	6		2023-01-27 12:13:06.699204+09
99000	1	40440	약제투여경로코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	40450	유방암수술방법코드	1	Open	1		2023-01-27 12:13:06.699204+09
99000	1	40450	유방암수술방법코드	2	Endoscopic	2		2023-01-27 12:13:06.699204+09
99000	1	40450	유방암수술방법코드	3	Robotic	3		2023-01-27 12:13:06.699204+09
99000	1	40450	유방암수술방법코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	01	Advanced glandular	1		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	02	Direct to implant	2		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	03	Hand-sewing	3		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	04	LD flap	4		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	05	Not applicable	5		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	06	Stapler	6		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	07	Tissue expander	7		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	08	TRAM/DIEP	8		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	09	Vicryl mesh	9		2023-01-27 12:13:06.699204+09
99000	1	40460	재건술방법코드	99	기타	10		2023-01-27 12:13:06.699204+09
99000	1	40470	재건성형술분류코드	1	Immediate reconstruction	1		2023-01-27 12:13:06.699204+09
99000	1	40470	재건성형술분류코드	2	Delayed reconstruction	2		2023-01-27 12:13:06.699204+09
99000	1	40470	재건성형술분류코드	3	Oncoplastic	3		2023-01-27 12:13:06.699204+09
99000	1	40470	재건성형술분류코드	4	Not applicable	4		2023-01-27 12:13:06.699204+09
99000	1	40470	재건성형술분류코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	40480	재건술접근법코드	1	Intracorporeal	1		2023-01-27 12:13:06.699204+09
99000	1	40480	재건술접근법코드	2	Extracorporeal	2		2023-01-27 12:13:06.699204+09
99000	1	40480	재건술접근법코드	3	Not applicable	3		2023-01-27 12:13:06.699204+09
99000	1	40480	재건술접근법코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	01	Billroth I	1		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	02	Billroth II	2		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	03	Double tract method	3		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	04	Esophagogastrostomy	4		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	05	Gastrogastrostomy	5		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	06	Primary repair	6		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	07	Roux-en-Y	7		2023-01-27 12:13:06.699204+09
99000	1	40490	재건술종류코드	99	기타	8		2023-01-27 12:13:06.699204+09
99000	1	40500	합병절제부위코드	01	None	1		2023-01-27 12:13:06.699204+09
99000	1	40500	합병절제부위코드	02	Colon	2		2023-01-27 12:13:06.699204+09
99000	1	40500	합병절제부위코드	03	Gall Baldder	3		2023-01-27 12:13:06.699204+09
99000	1	40500	합병절제부위코드	04	Liver	4		2023-01-27 12:13:06.699204+09
99000	1	40500	합병절제부위코드	05	Pancreas	5		2023-01-27 12:13:06.699204+09
99000	1	40500	합병절제부위코드	06	Spleen	6		2023-01-27 12:13:06.699204+09
99000	1	40500	합병절제부위코드	99	기타	7		2023-01-27 12:13:06.699204+09
99000	1	40520	항암요법부작용등급코드	01	I	1		2023-01-27 12:13:06.699204+09
99000	1	40520	항암요법부작용등급코드	02	II	2		2023-01-27 12:13:06.699204+09
99000	1	40520	항암요법부작용등급코드	03	III	3		2023-01-27 12:13:06.699204+09
99000	1	40520	항암요법부작용등급코드	04	IV	4		2023-01-27 12:13:06.699204+09
99000	1	40520	항암요법부작용등급코드	05	V	5		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	01	Alopecia	1		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	02	Anorexia	2		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	03	Constipation	3		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	04	Diarrhea	4		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	05	Dry skin	5		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	06	Fatigue	6		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	07	Hand-foot syndrome	7		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	08	Leukopenia	8		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	09	Mucositis	9		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	10	Nausea/vomiting	10		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	11	Neuropathy	11		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	12	Skin rash	12		2023-01-27 12:13:06.699204+09
99000	1	40530	항암요법부작용코드	99	기타	13		2023-01-27 12:13:06.699204+09
99000	1	40550	항암요법종료이유코드	1	Tumor progression	1		2023-01-27 12:13:06.699204+09
99000	1	40550	항암요법종료이유코드	2	사망	2		2023-01-27 12:13:06.699204+09
99000	1	40550	항암요법종료이유코드	3	추적관찰 소실	3		2023-01-27 12:13:06.699204+09
99000	1	40550	항암요법종료이유코드	4	항암제 부작용	4		2023-01-27 12:13:06.699204+09
99000	1	40550	항암요법종료이유코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	01	Adjuvant	1		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	02	Concurrent	2		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	03	Consolidation	3		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	04	Induction	4		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	05	Maintenance	5		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	06	Neoadjuvant	6		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	07	Palliative	7		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	08	Salvage	8		2023-01-27 12:13:06.699204+09
99000	1	40560	항암요법치료목적코드	99	기타	9		2023-01-27 12:13:06.699204+09
99000	1	40570	항암요법평가항목코드	01	CR	1		2023-01-27 12:13:06.699204+09
99000	1	40570	항암요법평가항목코드	02	PD	2		2023-01-27 12:13:06.699204+09
99000	1	40570	항암요법평가항목코드	03	PR	3		2023-01-27 12:13:06.699204+09
99000	1	40570	항암요법평가항목코드	04	SD	4		2023-01-27 12:13:06.699204+09
99000	1	40570	항암요법평가항목코드	05	NE	5		2023-01-27 12:13:06.699204+09
99000	1	40570	항암요법평가항목코드	99	기타	6		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	01	Apheresis platelet	1		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	03	Autotransfusion	3		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	04	Cryoprecipitate	4		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	05	Fresh frozen plasma	5		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	06	Platelet	6		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	07	Plateletpheresis (혈액원)	7		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	08	Pre-storage Leukocyte Filtered Red Blood Cells	8		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	09	Red blood cell	9		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	10	Washed red blood cell	10		2023-01-27 12:13:06.699204+09
99000	1	40580	혈액제제종류코드	99	기타	11		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	01	Bone	1		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	02	Brain	2		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	03	Breast(non-OP site)	3		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	04	Breast(OP site)	4		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	05	Distans LN	5		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	06	Liver	6		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	07	LN	7		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	08	Lung	8		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	09	Peritoneum	9		2023-01-27 12:13:06.699204+09
99000	1	50010	재발부위코드	99	기타	10		2023-01-27 12:13:06.699204+09
99000	1	50020	재발종류코드	1	Both Local & Distant	1		2023-01-27 12:13:06.699204+09
99000	1	50020	재발종류코드	2	Distant(Systemic)	2		2023-01-27 12:13:06.699204+09
99000	1	50020	재발종류코드	3	Locoregional	3		2023-01-27 12:13:06.699204+09
99000	1	50020	재발종류코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	50030	재발증상코드	1	Palpable mass	1		2023-01-27 12:13:06.699204+09
99000	1	50030	재발증상코드	2	Skin change	2		2023-01-27 12:13:06.699204+09
99000	1	50030	재발증상코드	3	Palpable Lymph node	3		2023-01-27 12:13:06.699204+09
99000	1	50030	재발증상코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	50040	재발진단방법코드	1	영상검사	1		2023-01-27 12:13:06.699204+09
99000	1	50040	재발진단방법코드	2	조직검사	2		2023-01-27 12:13:06.699204+09
99000	1	50040	재발진단방법코드	9	기타	3		2023-01-27 12:13:06.699204+09
99000	1	60010	성별코드	1	남	1		2023-01-27 12:13:06.699204+09
99000	1	60010	성별코드	2	여	2		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	01	간암	1		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	02	대장암	2		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	03	신장암	3		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	04	위암	4		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	05	유방암	5		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	06	자궁경부암	6		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	07	전립선	7		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	08	췌장암	8		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	09	폐암	9		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	10	혈액암	10		2023-01-27 12:13:06.699204+09
99000	1	60020	모집단구분코드	99	기타암	11		2023-01-27 12:13:06.699204+09
99000	1	60030	외국인코드	1	외국인	1		2023-01-27 12:13:06.699204+09
99000	1	60030	외국인코드	2	내국인	2		2023-01-27 12:13:06.699204+09
99000	1	60030	외국인코드	9	모름	3		2023-01-27 12:13:06.699204+09
99000	1	60040	환자구분코드	1	행려환자	1		2023-01-27 12:13:06.699204+09
99000	1	60040	환자구분코드	2	일반환자	2		2023-01-27 12:13:06.699204+09
99000	1	60040	환자구분코드	9	모름	3		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	01	전문·기술직	1		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	02	행정 및 관리직	2		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	03	사무직	3		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	04	판매종사직	4		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	05	서비스직	5		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	06	농업, 어업, 축산업, 임업	6		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	07	생산직	7		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	08	운수업	8		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	09	단순노무직	9		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	10	분류불능	10		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	11	학생	11		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	12	군인	12		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	13	주부	13		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	14	무직	14		2023-01-27 12:13:06.699204+09
99000	1	60050	직업분류코드	99	직업 모름	15		2023-01-27 12:13:06.699204+09
99000	1	60060	진단경로코드	1	검진	1		2023-01-27 12:13:06.699204+09
99000	1	60060	진단경로코드	2	우연한 발견(수술 시 검사하면서)	2		2023-01-27 12:13:06.699204+09
99000	1	60060	진단경로코드	3	증상발현(임상적 발현)	3		2023-01-27 12:13:06.699204+09
99000	1	60060	진단경로코드	4	미상	4		2023-01-27 12:13:06.699204+09
99000	1	60060	진단경로코드	9	기타	5		2023-01-27 12:13:06.699204+09
99000	1	60070	편측성코드	01	Not a paired site	1		2023-01-27 12:13:06.699204+09
99000	1	60070	편측성코드	02	Right: origin of primary	2		2023-01-27 12:13:06.699204+09
99000	1	60070	편측성코드	03	Left: origin of primary	3		2023-01-27 12:13:06.699204+09
99000	1	60070	편측성코드	04	Only one side involved, right or left origin unspecified	4		2023-01-27 12:13:06.699204+09
99000	1	60070	편측성코드	05	Bilateral involvement at time of diagnosis, lateral origin unknown for a single primary	5		2023-01-27 12:13:06.699204+09
99000	1	60070	편측성코드	06	Paired site: midline tumor	6		2023-01-27 12:13:06.699204+09
99000	1	60070	편측성코드	99	Paired site, but no information concerning laterality	7		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	01	Grade I	1		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	02	Grade II	2		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	03	Grade III	3		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	04	Grade IV	4		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	05	T-cell	5		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	06	B-Cell	6		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	07	Null cell	7		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	08	NK cell	8		2023-01-27 12:13:06.699204+09
99000	1	60080	분화도코드	99	Not applicable	9		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	01	임상진단	1		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	02	임상검사	2		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	03	조직검사없는 진단적 수술/부검	3		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	04	특수 생화학적 또는 면역학적 검사	4		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	05	세포학적 또는 혈액학적 검사	5		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	06	전이부위 조직검사	6		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	07	원발부위 조직점사	7		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	08	부검	8		2023-01-27 12:13:06.699204+09
99000	1	60090	진단방법코드	99	기타	9		2023-01-27 12:13:06.699204+09
99000	1	60100	치료시행여부코드	1	시행	1		2023-01-27 12:13:06.699204+09
99000	1	60100	치료시행여부코드	2	시행하지 않음	2		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	01	In situ	1		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	02	Localized only	2		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	03	Regional by direct extension only	3		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	04	Regional lymph nodes involved only	4		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	05	Regional by BOTH direct extension AND lymph node involvement	5		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	06	Regional, NOS (Not Otherwise Specified)	6		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	07	Distant site(s)/node(s) involved	7		2023-01-27 12:13:06.699204+09
99000	1	60110	SEER코드	99	Unknown if extension or metastasis (unstaged, unknown, or unspecified) Death certification only case	8		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00010	가천대길병원	1		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00020	건양대병원	2		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00030	고려대의료원	3		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00040	국립암센터	4		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00050	대구카톨릭대병원	5		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00060	부산대병원	6		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00070	분당서울대병원	7		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00080	삼성서울병원	8		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00090	서울대병원	9		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00100	서울아산병원	10		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00110	세브란스병원	11		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00120	아주대병원	12		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00130	전북대병원	13		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00140	한림대병원	14		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	00150	화순전남대병원	15		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10010	강남세스란스병원	16		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10020	강동경희대학교병원	17		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10030	강릉아산병원	18		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10040	강북삼성병원	19		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10050	강원대학교병원	20		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10060	경북대병원	21		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10070	계명대동산병원	22		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10080	고려대부속안산병원	23		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10090	고려대학교구로병원	24		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10100	김안과병원	25		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10110	동국대일산병원	26		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10120	보라매병원	27		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10130	삼성창원병원	28		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10140	서울성모병원	29		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10150	양산부산대병원	30		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10160	용인세브란스병원	31		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10170	울산대학교병원	32		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10180	원주세브란스기독병원	33		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10190	이화의대서울병원	34		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10200	전남대병원	35		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10210	중앙대학교병원	36		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10220	충남대병원	37		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10230	충북대병원	38		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10240	칠곡경북대병원	39		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10250	한길안과병원	40		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10260	한림대학교춘천성심병원	41		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	10270	한양대병원	42		2023-01-27 12:13:06.699204+09
99000	1	10010	병원코드	99000	한국보건의료정보원	43		2023-01-27 12:13:06.699204+09
99000	1	90010	코드분류코드	1	공통코드	1		2023-01-27 12:13:06.699204+09
99000	1	90010	코드분류코드	2	원내코드	2		2023-01-27 12:13:06.699204+09
99000	1	90010	코드분류코드	3	표준코드(EDI코드, SNOMEDCT코드, LOINC코드)	3		2023-01-27 12:13:06.699204+09
99000	1	90010	코드분류코드	9	기타	4		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	01	암등록	1		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	02	환자	2		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	03	진단	3		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	04	검사	4		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	05	치료	5		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	06	추적관찰	6		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	07	Clinical Data	7		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	08	Health Syatem Data	8		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	09	Health Economics data	9		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	10	Standardized Derived Elements	10		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	11	Metadata 	11		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	12	Vocabulary	12		2023-01-27 12:13:06.699204+09
99000	1	90020	테이블대분류코드	99	기타	13		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	01	암등록	1		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	02	건강정보	2		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	03	가족력	3		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	04	신체계측정보	4		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	05	진단정보	5		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	06	병기	6		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	07	전이정보	7		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	08	진단	8		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	09	영상	9		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	10	면역병리	10		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	11	분자병리	11		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	12	생체검사	12		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	13	H.pylori 감염여부	13		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	14	위내시경	14		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	15	내시경초음파(EUS)	15		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	16	수술	16		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	17	시술	17		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	18	수술 후 외과병리	18		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	19	수술 후 합병증	19		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	20	수혈	20		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	21	약제	21		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	22	항암요법	22		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	23	방사선	23		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	24	재발정보	24		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	25	산과정보	25		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	26	생식세포 변이검사	26		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	27	예후예측 유전자 발현검사	27		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	28	Clinical Data	28		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	29	Health Syatem Data	29		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	30	Health Economics data	30		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	31	Standardized Derived Elements	31		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	32	Metadata 	32		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	33	Vocabulary	33		2023-01-27 12:13:06.699204+09
99000	1	90030	테이블중분류코드	99	기타	34		2023-01-27 12:13:06.699204+09
\.


--
-- TOC entry 4111 (class 0 OID 25060)
-- Dependencies: 259
-- Data for Name: cncr_rgst; Type: TABLE DATA; Schema: public; Owner: gony
--

COPY public.cncr_rgst (hcode, ptno, fdx, cncr_rgst_seq, brth, age, sex, popcode, popname, frgcode, frgname, hmlscode, hmlsname, jobcode, jobname, job1, unknownjob, visitpathcode, visitpathname, visitpath_desc, tcode, tcode1, tcode2, latercode, latername, mcode, mcode1, mcode2, bunhwadocode, bunhwadoname, expire, sain, methodcode, methodname, method2, methodetc, txcheckcode, txcheckname, tx, txetc, recoyear, admisdate, disdate, dbyear, inputday, seeryear, seercode, seername, stagecode, stageyear, stagedesc, metacode1, metacode2, metacode3, crtn_dt) FROM stdin;
\.


--
-- TOC entry 4153 (class 0 OID 33256)
-- Dependencies: 301
-- Data for Name: ecrf_col_info; Type: TABLE DATA; Schema: public; Owner: gony
--

COPY public.ecrf_col_info (tbl_enm, col_enm, col_knm, col_ord, data_tp_cont, pk_ord, domn_nm, col_expl_cont, col_vl_cont, fltr_use_yn, fltr_expl_cont, fltr_vl_expl_cont, cd_id, com_cd_ref_yn, frst_regp_id, frst_rgst_dt, last_modp_id, last_modf_dt) FROM stdin;
GSCN_PT_HLINF	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	ADM_YMD	입원일자	3	VARCHAR(8)	PK_3	일자VC8	입원연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	HLINF_SEQ	건강정보순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DSCH_YMD	퇴원일자	5	VARCHAR(8)		일자VC8	퇴원연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	CUR_DRNK_YN_NOANS_SPCD	현재음주여부무응답구분코드	6	VARCHAR(20)		여부무응답구분코드	현재 음주 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	CUR_DRNK_YN_NOANS_SPNM	현재음주여부무응답구분명	7	VARCHAR(50)		명VC50	현재 음주 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DHIS_YN_NOANS_SPCD	음주력여부무응답구분코드	8	VARCHAR(20)		여부무응답구분코드	음주력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DHIS_YN_NOANS_SPNM	음주력여부무응답구분명	9	VARCHAR(50)		명VC50	음주력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DRNK_STRT_AGE_VL	음주시작연령값	10	NUMERIC(4)		값N4	음주 시작연령 (단위  세)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DRNK_KNCD	음주종류코드	11	VARCHAR(20)		음주종류코드	음주 종류 코드	코드정의서 참고	N	\N	\N	10050	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DRNK_KNNM	음주종류명	12	VARCHAR(200)		명VC200	음주 종류 명	막걸리  맥주  소주  양주  무응답  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DRNK_QTY	음주량	13	VARCHAR(100)		수VC100	평균 음주량 (단위  병회)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DRNK_NT	음주횟수	14	NUMERIC(3)		수N3	월평균 음주횟수 (단위  회월)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DRNK_DTRN_YCNT	음주기간년수	15	NUMERIC(3)		년수N3	총 음주기간 (단위  년)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	NDRK_STRT_YR	금주시작년도	16	VARCHAR(4)		년도VC4	환자의 금주시작시기 (단위 년)	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	CUR_SMOK_YN_NOANS_SPCD	현재흡연여부무응답구분코드	17	VARCHAR(20)		여부무응답구분코드	현재 흡연 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	CUR_SMOK_YN_NOANS_SPNM	현재흡연여부무응답구분명	18	VARCHAR(50)		명VC50	현재 흡연 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	SHIS_YN_NOANS_SPCD	흡연력여부무응답구분코드	19	VARCHAR(20)		여부무응답구분코드	흡연력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	SHIS_YN_NOANS_SPNM	흡연력여부무응답구분명	20	VARCHAR(50)		명VC50	흡연력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	SMOK_STRT_AGE_VL	흡연시작연령값	21	NUMERIC(4)		값N4	흡연 시작연령 (단위  세)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	SMOK_DTRN_YCNT	흡연기간년수	22	NUMERIC(3)		년수N3	흡연기간 (단위  년)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	SMOK_QTY	흡연량	23	NUMERIC(3)		수N3	흡연량 (단위  갑일)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	NSMK_STRT_YR	금연시작년도	24	VARCHAR(4)		년도VC4	금연시작시기	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_YN_NOANS_SPCD	병력여부무응답구분코드	25	VARCHAR(20)		여부무응답구분코드	과거 병력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_YN_NOANS_SPNM	병력여부무응답구분명	26	VARCHAR(50)		명VC50	과거 병력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_HL_YN_NOANS_SPCD	병력고지혈증여부무응답구분코드	27	VARCHAR(20)		여부무응답구분코드	과거 고지혈증 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_HL_YN_NOANS_SPNM	병력고지혈증여부무응답구분명	28	VARCHAR(50)		명VC50	과거 고지혈증 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_HTN_YN_NOANS_SPCD	병력고혈압여부무응답구분코드	29	VARCHAR(20)		여부무응답구분코드	과거 고혈압 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_HTN_YN_NOANS_SPNM	병력고혈압여부무응답구분명	30	VARCHAR(50)		명VC50	과거 고혈압 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_DBT_YN_NOANS_SPCD	병력당뇨여부무응답구분코드	31	VARCHAR(20)		여부무응답구분코드	과거 당뇨 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_DBT_YN_NOANS_SPNM	병력당뇨여부무응답구분명	32	VARCHAR(50)		명VC50	과거 당뇨 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_TB_YN_NOANS_SPCD	병력결핵여부무응답구분코드	33	VARCHAR(20)		여부무응답구분코드	과거 결핵 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_TB_YN_NOANS_SPNM	병력결핵여부무응답구분명	34	VARCHAR(50)		명VC50	과거 결핵 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_LVDS_YN_NOANS_SPCD	병력간질환여부무응답구분코드	35	VARCHAR(20)		여부무응답구분코드	과거 간질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_LVDS_YN_NOANS_SPNM	병력간질환여부무응답구분명	36	VARCHAR(50)		명VC50	과거 간질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_CNCR_YN_NOANS_SPCD	병력암여부무응답구분코드	37	VARCHAR(20)		여부무응답구분코드	과거 암 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_CNCR_YN_NOANS_SPNM	병력암여부무응답구분명	38	VARCHAR(50)		명VC50	과거 암 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_CNCR_KNCD	병력암종류코드	39	VARCHAR(20)		암종류코드	과거 암 존재 시 암종 코드	코드정의서 참고	N	\N	\N	10030	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_CNCR_KNNM	병력암종류명	40	VARCHAR(200)		명VC200	과거 암 존재 시 암종 명	간  갑상선  골육종  구강  난소  뇌  담도  대장  신장  위  유방  자궁  전립선  췌장  폐  혈액  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_DEPR_YN_NOANS_SPCD	병력우울증여부무응답구분코드	41	VARCHAR(20)		여부무응답구분코드	과거 우울증 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_DEPR_YN_NOANS_SPNM	병력우울증여부무응답구분명	42	VARCHAR(50)		명VC50	과거 우울증 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_INSM_YN_NOANS_SPCD	병력불면증여부무응답구분코드	43	VARCHAR(20)		여부무응답구분코드	과거 불면증 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_INSM_YN_NOANS_SPNM	병력불면증여부무응답구분명	44	VARCHAR(50)		명VC50	과거 불면증 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_CADS_YN_NOANS_SPCD	병력심장질환여부무응답구분코드	45	VARCHAR(20)		여부무응답구분코드	과거 심장질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MHIS_CADS_YN_NOANS_SPNM	병력심장질환여부무응답구분명	46	VARCHAR(50)		명VC50	과거 심장질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	ETC_MHIS_YN_NOANS_SPCD	기타병력여부무응답구분코드	47	VARCHAR(20)		여부무응답구분코드	과거 기타질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	ETC_MHIS_YN_NOANS_SPNM	기타병력여부무응답구분명	48	VARCHAR(50)		명VC50	과거 기타질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	ETC_MHIS_DISS_CONT	기타병력질환내용	49	VARCHAR(200)		내용VC200	과거 기타질환이 있을 경우 기타질환 내용	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MAIN_SYM_CONT	주증상내용	50	VARCHAR(200)		내용VC200	입원 시 주증상 상세내용	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MAIN_SYM_YN_NOANS_SPCD	주증상여부무응답구분코드	51	VARCHAR(20)		여부무응답구분코드	주증상 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	MAIN_SYM_YN_NOANS_SPNM	주증상여부무응답구분명	52	VARCHAR(50)		명VC50	주증상 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	OHAD_HSTR_YN_NOANS_SPCD	타병원진단후전원여부무응답구분코드	53	VARCHAR(20)		여부무응답구분코드	타병원 진단 후 전원 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	OHAD_HSTR_YN_NOANS_SPNM	타병원진단후전원여부무응답구분명	54	VARCHAR(50)		명VC50	타병원 진단 후 전원 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DSCH_STCD	퇴원상태코드	55	VARCHAR(20)		퇴원상태코드	퇴원 시 환자의 상태 코드	코드정의서 참고	N	\N	\N	10060	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	DSCH_STNM	퇴원상태명	56	VARCHAR(200)		명VC200	퇴원 시 환자의 상태 명	가망없는퇴원  사망  악화  진단뿐  호전  호전안됨  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF	CRTN_DT	생성일시	57	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	코드정의서 참고	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_RCRD_YMD	가족력기록일자	3	VARCHAR(8)	PK_3	일자VC8	가족력 기록연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_RCRD_SEQ	가족력기록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_YN_NOANS_SPCD	가족력여부무응답구분코드	5	VARCHAR(20)		여부무응답구분코드	가족의 병력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_YN_NOANS_SPNM	가족력여부무응답구분명	6	VARCHAR(50)		명VC50	가족의 병력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	PT_FM_RLCD	환자가족관계코드	7	VARCHAR(20)		환자가족관계코드	가족의 병력 존재 시 관계 코드	코드정의서 참고	N	\N	\N	10070	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	PT_FM_RLNM	환자가족관계명	8	VARCHAR(200)		명VC200	가족의 병력 존재 시 관계 명	아버지  어머니  자녀  형제자매  친척  무응답  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	PT_FMRL_ETC_CONT	환자가족관계기타내용	9	VARCHAR(200)		내용VC200	가족관계 기타일 경우 상세내용	예) 조카	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_HTN_YN_NOANS_SPCD	가족병력고혈압여부무응답구분코드	10	VARCHAR(20)		여부무응답구분코드	가족의 고혈압 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_HTN_YN_NOANS_SPNM	가족병력고혈압여부무응답구분명	11	VARCHAR(50)		명VC50	가족의 고혈압 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_DBT_YN_NOANS_SPCD	가족병력당뇨여부무응답구분코드	12	VARCHAR(20)		여부무응답구분코드	가족의 당뇨 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_DBT_YN_NOANS_SPNM	가족병력당뇨여부무응답구분명	13	VARCHAR(50)		명VC50	가족의 당뇨 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_TB_YN_NOANS_SPCD	가족력결핵여부무응답구분코드	14	VARCHAR(20)		여부무응답구분코드	가족의 결핵 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_TB_YN_NOANS_SPNM	가족력결핵여부무응답구분명	15	VARCHAR(50)		명VC50	가족의 결핵 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_LVDS_YN_NOANS_SPCD	가족병력간질환여부무응답구분코드	16	VARCHAR(20)		여부무응답구분코드	가족의 간질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_LVDS_YN_NOANS_SPNM	가족병력간질환여부무응답구분명	17	VARCHAR(50)		명VC50	가족의 간질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_CNCR_YN_NOANS_SPCD	가족병력암여부무응답구분코드	18	VARCHAR(20)		여부무응답구분코드	가족의 암 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_CNCR_YN_NOANS_SPNM	가족병력암여부무응답구분명	19	VARCHAR(50)		명VC50	가족의 암 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_CNCR_KNCD	가족력암종류코드	20	VARCHAR(20)		암종류코드	가족의 암 존재 시 암종 코드	코드정의서 참고	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_CNCR_KNNM	가족력암종류명	21	VARCHAR(200)		명VC200	가족의 암 존재 시 암종 명	뇌  위  폐  간  대장  유방  자궁  전립선  갑상선  난소  췌장  담도  혈액  골육종  구강  신장  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHT_CNCR_KIND_ETC_CONT	가족력암종류기타내용	22	VARCHAR(200)		내용VC200	가족의 암종이 기타일 경우 기타내용	예) 구강암  후두암	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_ETC_YN_NOANS_SPCD	가족병력기타여부무응답구분코드	23	VARCHAR(20)		여부무응답구분코드	가족의 기타병력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_ETC_YN_NOANS_SPNM	가족병력기타여부무응답구분명	24	VARCHAR(50)		명VC50	가족의 기타병력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	FMHS_ETC_CONT	가족병력기타내용	25	VARCHAR(200)		내용VC200	가족의 기타병력 내용	예) COPD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_FMHT	CRTN_DT	생성일시	26	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	ANTH_RCRD_YMD	신체계측기록일자	3	VARCHAR(8)	PK_3	일자VC8	신체계측정보 기록연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	ANTH_RCRD_SEQ	신체계측기록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	HT_MSRM_VL	신장측정값	5	NUMERIC(5,1)		값N5,1	신장값 소수점 1자리까지 표기 (단위  cm)	999.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	WT_MSRM_VL	체중측정값	6	NUMERIC(5,1)		값N5,1	체중값 소수점 1자리까지 표기 (단위  kg)	999.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	BMI_VL	BMI값	7	NUMERIC(5,2)		값N5,2	신체질량지수로 환자의 신장과 체중의 비율을 사용해 계산한 지수 \r\r\n 소수점 1자리까지 표기 (체중(신장)²)	99.99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	RLXT_BLPR_VL	이완혈압값	8	VARCHAR(5)		값VC5	이완기 혈압값 (단위 mmHg)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	CTRT_BLPR_VL	수축혈압값	9	VARCHAR(5)		값VC5	수축기 혈압값 (단위 mmHg)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	ECOG_CD	ECOG코드	10	VARCHAR(20)		ECOG코드	암 환자의 기능 상태 지수 코드\n(5가지의 점수로 환자의 기능 상태 표현)	코드정의서 참고	N	\N	\N	20010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	ECOG_NM	ECOG명	11	VARCHAR(200)		명VC200	암 환자의 기능 상태 지수 명 \n(5가지의 점수로 환자의 기능 상태 표현)	제한없이 정상적이다  증상이 있으나 스스로 활동 가능하다  증상이 있으나 누워 지내는 시간은 하루의 반보다 적다  증상이 있으며 누워 지내는 시간이 하루의 절반이상이다  계속 누워 있어야 한다	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_ANINF	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_RGST_YMD	진단등록일자	3	VARCHAR(8)	PK_3	일자VC8	진단정보 등록연월일(EMR 진단등록화면)	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_RGST_SEQ	진단등록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	GSCN_DIAG_KNCD	위암진단종류코드	5	VARCHAR(20)		위암진단종류코드	진단명의 구분 코드\n위암 모집단관련 KCD 코드 분류 (C16 D002 기타암 및 기타질환)	코드정의서 참고	N	\N	\N	20090	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	GSCN_DIAG_KNNM	위암진단종류명	6	VARCHAR(200)		명VC200	진단명의 구분 명\n위암 모집단관련 KCD 코드 분류 (C16 D002 기타암 및 기타질환)	위암(C16)  상피내암(D002)  기타암 기타질환	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_CD	진단코드	7	VARCHAR(20)		진단코드	원내에서 사용하는 진단코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_NM	진단명	8	VARCHAR(200)		명VC200	원내에서 사용하는 진단용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_KCD_CD	진단KCD코드	9	VARCHAR(20)		KCD코드	환자가 진단받은 KCD 코드	예) C162	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_KCD_NM	진단KCD명	10	VARCHAR(200)		명VC200	환자가 진단받은 KCD 명 (영문)	예) Malignant neoplasm of body of stomach advanced	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_RSLT_CONT	면역병리검사결과내용	12	VARCHAR(200)		내용VC200	면역병리 검사결과 값	99.99	N	\N	\N	\N	N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_SMCT_CD	진단SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	환자가 진단받은 용어에 대한 국제 표준용어코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 276809004\n예2) 276809004_363698007_68560004	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	DIAG_SMCT_NM	진단SNOMEDCT명	12	VARCHAR(1000)		명VC1000	환자가 진단받은 용어에 대한 국제 표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Early gastric cancer\n예2) Early gastric cancer_Finding site_Gastric corpus structure	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_INF	CRTN_DT	생성일시	13	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	DIAG_STAG_RCRD_YMD	진단병기기록일자	3	VARCHAR(8)	PK_3	일자VC8	진단 병기 정보 기록연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	DIAG_STAG_RCRD_SEQ	진단병기기록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	CLNC_TUMR_PRTY_CD	임상종양특성코드	5	VARCHAR(20)		임상종양특성코드	종양특성 코드	코드정의서 참고	N	\N	\N	20050	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	CLNC_TUMR_PRTY_NM	임상종양특성명	6	VARCHAR(200)		명VC200	종양특성 코드	Primary  Remnant  Meta  기타  	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	AJCC_YR	AJCC년도	7	VARCHAR(4)		년도VC4	AJCC 기준년도	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	CLNC_TNM_STAG_VL	임상TNM병기값	8	VARCHAR(20)		값VC20	임상 TNM 병기값	예) T1N0M0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	CLNC_T_STAG_VL	임상T병기값	9	VARCHAR(20)		값VC20	임상 T 병기값	예) T1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	CLNC_N_STAG_VL	임상N병기값	10	VARCHAR(20)		값VC20	임상 N 병기값	예) N1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	CLNC_M_STAG_VL	임상M병기값	11	VARCHAR(20)		값VC20	임상 M 병기값	예) M0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_STAG	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTDG_YMD	전이진단일자	3	VARCHAR(8)	PK_3	일자VC8	암 전이 진단연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTDG_SEQ	전이진단순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTDG_MTCD	전이진단방법코드	5	VARCHAR(20)		전이진단방법코드	암 전이 시 진단 방법 코드	코드정의서 참고	N	\N	\N	20080	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTDG_MTNM	전이진단방법명	6	VARCHAR(200)		명VC200	암 전이 시 진단 방법 명	영상검사  조직검사  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTST_SITE_CD	전이부위코드	7	VARCHAR(20)		전이부위코드	전이암 부위 코드	코드정의서 참고	N	\N	\N	20060	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTST_SITE_NM	전이부위명	8	VARCHAR(200)		명VC200	전이암 부위 명	Bone  Liver  LN  Lung  Ovary  Peritoneum  기타 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTST_ASPT_CD	전이양상코드	9	VARCHAR(20)		전이양상코드	전이암 양상 코드	코드정의서 참고	N	\N	\N	20070	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTST_ASPT_NM	전이양상명	10	VARCHAR(200)		명VC200	전이암 양상 명	Single lesion  Multiple lesion - synchronous  Multiple lesion - metachronous	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	MTST_TRTM_CONT	전이치료내용	11	VARCHAR(5)		내용VC5	전이암 치료 요법  동시항암화학방사선요법 수술 화학요법 방사선요법 기타  순으로 시행한 치료는 00000에 1로 표시	예1) 동시항암화학방사선요법 수술 시행  11000\r\r\n예2) 수술 시행  01000	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_MTST	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_YMD	진단검사일자	3	VARCHAR(8)	PK_3	일자VC8	진단검사 검사연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_SEQ	진단검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_KNCD	진단검사종류코드	5	VARCHAR(20)		진단검사종류코드	진단검사 종류 코드	코드정의서 참고	N	\N	\N	30580	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_KNNM	진단검사종류명	6	VARCHAR(200)		명VC200	진단검사 종류 명	Albumin  CA19-9  CA72-4  CEA  Ferritin  Hb  Iron  Protein  \nTIBC  Total Cholesterol  Vitamin B12  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_CD	진단검사코드	7	VARCHAR(20)		진단검사코드	진단검사 정보 수집 시 병원에서 사용하는 진단검사 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_NM	진단검사명	8	VARCHAR(200)		명VC200	진단검사 정보 수집 시 병원에서 사용하는 진단검사 LOCAL 용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_EDI_CD	진단검사EDI코드	9	VARCHAR(20)		진단검사EDI코드	원내 진단검사 코드에 매핑되는 EDI 코드	예) D0002	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_EDI_NM	진단검사EDI명	10	VARCHAR(200)		명VC200	원내 진단검사 코드에 매핑되는 EDI 명	예) 백혈구수장비측정	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_SMCT_CD	진단검사SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	원내 진단검사 용어에 매핑되는 국제표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 767002\n예2) 121912002_370132008_30766002	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_SMCT_NM	진단검사SNOMEDCT명	12	VARCHAR(1000)		명VC1000	원내 진단검사 용어에 매핑되는 국제표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) White blood cell count\n예2) Hepatitis B virus deoxyribonucleic acid assay_Scale type_Quantitative	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_LOINC_CD	진단검사LOINC코드	13	VARCHAR(20)		LOINC코드	원내 진단검사 코드에 매핑되는 LOINC 코드	예) 6690-2	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_LOINC_NM	진단검사LOINC명	14	VARCHAR(1000)		명VC1000	원내 진단검사 코드에 매핑되는 LOINC 명	예) Leukocytes volume in Blood by Automated count	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_RSLT_CONT	진단검사결과내용	15	VARCHAR(4000)		내용VC4000	진단검사 결과 내용	예) 진단검사 결과 표현에 따라 정수값 positivenegative ()(-) 등을 포함	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_RSLT_UNIT_CONT	진단검사결과단위내용	16	VARCHAR(200)		내용VC200	검사결과 수치에서 사용하는 단위	예) gdL	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CEXM_NLRG_REF_VL	진단검사정상범위참고값	17	VARCHAR(200)		값VC200	진단검사결과내용의 유효범위 참고치	예) 3.85.3	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_DIAG	CRTN_DT	생성일시	18	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_YMD	영상검사일자	3	VARCHAR(8)	PK_3	일자VC8	영상검사 검사연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_SEQ	영상검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_KNCD	영상검사종류코드	5	VARCHAR(20)		영상검사종류코드	영상검사 종류 코드	코드정의서 참고	N	\N	\N	30410	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_KNNM	영상검사종류명	6	VARCHAR(200)		명VC200	영상검사 종류 명	Bone scan  CT  MRI  PET-CT  SONO  X-ray  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_CD	영상검사코드	7	VARCHAR(20)		영상검사코드	영상검사 정보 수집 시 병원에서 사용하는 영상검사 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_NM	영상검사명	8	VARCHAR(200)		명VC200	영상검사 정보 수집 시 병원에서 사용하는 영상검사 LOCAL 용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_EDI_CD	영상검사EDI코드	9	VARCHAR(20)		영상검사EDI코드	영상검사 정보 수집 시 병원에서 사용하는 영상검사 EDI 코드	예) HA464	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_EDI_NM	영상검사EDI명	10	VARCHAR(200)		명VC200	영상검사 정보 수집 시 병원에서 사용하는 영상검사 EDI 명	예) 일반전산화단층영상진단-흉부-조영제를사용하는경우	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_SMCT_CD	영상검사SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	원내 영상검사 용어에 매핑되는 국제표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 75385009\n예2) 169069000_260686004_262459003	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_SMCT_NM	영상검사SNOMEDCT명	12	VARCHAR(1000)		명VC1000	원내 영상검사 용어에 매핑되는 국제표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Computed tomography of thorax with contrast\n예2) Computed tomography of chest_Method_Low dose	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	IMEX_RSLT_CONT	영상검사결과내용	13	VARCHAR(4000)		내용VC4000	영상검사 결과 내용(Conclusion)	Free Text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMAG	CRTN_DT	생성일시	14	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_YMD	면역병리검사일자	3	VARCHAR(8)	PK_3	일자VC8	면역병리 검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_SEQ	면역병리검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMPT_READ_YMD	면역병리판독일자	5	VARCHAR(8)		일자VC8	면역병리 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_CD	면역병리검사코드	6	VARCHAR(20)		면역병리검사코드	원내에서 사용하는 면역병리 검사 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_NM	면역병리검사명	7	VARCHAR(200)		명VC200	원내에서 사용하는 면역병리 검사 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_KNCD	면역병리검사종류코드	8	VARCHAR(20)		면역병리검사종류코드	면역병리 검사 종류코드	코드정의서 참고	N	\N	\N	30170	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_KNNM	면역병리검사종류명	9	VARCHAR(200)		명VC200	면역병리 검사 종류명	EBV  EGFR  HER2  hMLH1  hMSH2  MSH6  p53  PD-L1  \nPMS2  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_OPN_CD	면역병리검사소견코드	10	VARCHAR(20)		면역병리검사소견코드	면역병리 검사소견 코드	코드정의서 참고	N	\N	\N	30160	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_OPN_NM	면역병리검사소견명	11	VARCHAR(200)		명VC200	면역병리 검사소견 명	Positive  Negative  Focal positive  Equivocal  Not evaluable  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_RSLT_UNIT_CD	면역병리검사결과단위코드	13	VARCHAR(20)		면역병리검사결과단위코드	면역병리 검사결과 값 단위	코드정의서 참고	N	\N	\N	30140	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	IMEM_RSLT_UNIT_NM	면역병리검사결과단위명	14	VARCHAR(200)		명VC200	면역병리 검사결과 값 단위	Score  	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_IMPT	CRTN_DT	생성일시	15	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_YMD	분자병리검사일자	3	VARCHAR(8)	PK_3	일자VC8	분자병리 검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_SEQ	분자병리검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLPT_READ_YMD	분자병리판독일자	5	VARCHAR(8)		일자VC8	분자병리 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_CD	분자병리검사코드	6	VARCHAR(20)		분자병리검사코드	원내에서 사용하는 분자병리 검사코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_NM	분자병리검사명	7	VARCHAR(200)		명VC200	원내에서 사용하는 분자병리 검사명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_KNCD	분자병리검사종류코드	8	VARCHAR(20)		분자병리검사종류코드	분자병리 검사 종류 코드	코드정의서 참고	N	\N	\N	30230	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_KNNM	분자병리검사종류명	9	VARCHAR(200)		명VC200	분자병리 검사 종류 명	EBV ISH  HER-2  Microsatellite instability(MSI)  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_OPN_CD	분자병리검사소견코드	10	VARCHAR(20)		분자병리검사소견코드	분자병리 검사소견 코드	코드정의서 참고	N	\N	\N	30220	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_OPN_NM	분자병리검사소견명	11	VARCHAR(200)		명VC200	분자병리 검사소견 명	Positive  Negative  Equivocal  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_RSLT_CONT	분자병리검사결과내용	12	VARCHAR(200)		내용VC200	분자병리 검사결과 값	99.99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	MLEM_RSLT_UNIT_CONT	분자병리검사결과단위내용	13	VARCHAR(200)		내용VC200	분자병리 검사결과 값 단위	Score  	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_MLPT	CRTN_DT	생성일시	14	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_YMD	생체검사일자	3	VARCHAR(8)	PK_3	일자VC8	생체검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_SEQ	생체검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_READ_YMD	생체검사판독일자	5	VARCHAR(8)		일자VC8	생체검사 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_SITE_CD	생체검사부위코드	6	VARCHAR(20)		생체검사부위코드	생체검사를 실시한 부위 코드	코드정의서 참고	N	\N	\N	30310	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_SITE_NM	생체검사부위명	7	VARCHAR(200)		명VC200	생체검사를 실시한 부위 명	Liver  Stomach  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_MTCD	생체검사방법코드	8	VARCHAR(20)		생체검사방법코드	원내에서 사용하는 생체검사 방법 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_MTNM	생체검사방법명	9	VARCHAR(200)		명VC200	원내에서 사용하는 생체검사 방법 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_MTHD_KNCD	생체검사방법종류코드	10	VARCHAR(20)		생체검사방법종류코드	생체검사를 시행한 방법 종류 코드	코드정의서 참고	N	\N	\N	30290	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_MTHD_KNNM	생체검사방법종류명	11	VARCHAR(200)		명VC200	생체검사를 시행한 방법 종류 명	Endoscopic biopsy  Excision  Needle biopsy  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	BPSY_RSLT_CONT	생체검사결과내용	12	VARCHAR(2000)		내용VC2000	생체검사 결과 병리과 전문의 판독 최종 결론	예) Adenocarcinoma in adenomatous polyposis coli	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	HTLG_DIAG_CD	조직학적진단코드	13	VARCHAR(20)		조직학적진단코드	생체검사에 따른 조직학적 진단 코드	코드정의서 참고	N	\N	\N	30540	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	HTLG_DIAG_NM	조직학적진단명	14	VARCHAR(200)		명VC200	생체검사에 따른 조직학적 진단 명	Adenosquamous carcinoma  Carcinoma with lymphoid stroma  \nGastrointestinal stromal tumor  Hepatoid adenocarcinoma  Mixed adenocarcinoma  Mucinous adenocarcinoma  Neuroendocrine tumor  Papillary adenocarcinoma  Poorly cohesive carcinoma(signet ring cell carcinoma 포함)  Squamous cell carcinoma  Tubular adenocarcinoma  Undifferentiated carcinoma  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	HTLG_DFGD_CD	조직학적분화도코드	15	VARCHAR(20)		조직학적분화도코드	생체검사에 따른 조직학적 분화도 (Histologic grade)  adenocarcinoma 일 때만 분류 코드	코드정의서 참고	N	\N	\N	30530	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	HTLG_DFGD_NM	조직학적분화도명	16	VARCHAR(200)		명VC200	생체검사에 따른 조직학적 분화도 (Histologic grade)  adenocarcinoma 일 때만 분류 명	Well differentiated  Moderately differentiated  Poorly differentiated  Combined  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_BYPS	CRTN_DT	생성일시	17	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	HPLI_EXAM_YMD	HPYLORI검사일자	3	VARCHAR(8)	PK_3	일자VC8	H.pylori 검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	HPLI_EXAM_SEQ	HPYLORI검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	HPLI_EXAM_MTCD	HPYLORI검사방법코드	5	VARCHAR(20)		HPYLORI검사방법코드	H.pylori 검사 방법코드	코드정의서 참고	N	\N	\N	30090	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	HPLI_EXAM_MTNM	HPYLORI검사방법명	6	VARCHAR(200)		명VC200	H.pylori 검사 방법명	H.pylori IgG Ab  Histology(병리검사)  Rapid urease test(CLO test)  \nUrea Breath Test  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	HPLI_EXAM_RSLT_CD	HPYLORI검사결과코드	7	VARCHAR(20)		HPYLORI검사결과코드	H.pylori 검사결과 코드	코드정의서 참고	N	\N	\N	30080	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	HPLI_EXAM_RSLT_NM	HPYLORI검사결과명	8	VARCHAR(200)		명VC200	H.pylori 검사결과 명	Negative  Positive  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_HPLI	CRTN_DT	생성일시	9	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_YMD	위내시경검사일자	3	VARCHAR(8)	PK_3	일자VC8	위내시경검사 검사연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_SEQ	위내시경검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_PRPS_CD	위내시경검사목적코드	5	VARCHAR(20)		위내시경검사목적코드	위내시경검사 목적 코드	코드정의서 참고	N	\N	\N	30450	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_PRPS_NM	위내시경검사목적명	6	VARCHAR(200)		명VC200	위내시경검사 목적 명	공단검진  내시경 시술 및 추적검사  수술후 추적검사  \n암예방검진센터 수검자  진단  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	GTSP_TSPC_CNT	위내시경조직표본수	7	NUMERIC(3)		수N3	위내시경검사시 생체검사조직표본수 Biopsy 개수 (단위 개)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_OPN_CONT	위내시경검사소견내용	8	VARCHAR(4000)		내용VC4000	위내시경검사 소견 내용	Free Text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_RSLT_CONT	위내시경검사결과내용	9	VARCHAR(4000)		내용VC4000	위내시경검사 결과 내용	예) AGC B-III with GOO\r\r\n예) Reflux esophagitis LA-C	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_RSLT_TPCD	위내시경검사결과유형코드	10	VARCHAR(20)		위내시경검사결과유형코드	위내시경 결과 유형 코드	코드정의서 참고	N	\N	\N	30440	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	STMC_EDEX_RSLT_TPNM	위내시경검사결과유형명	11	VARCHAR(200)		명VC200	위내시경 결과 유형 명	EGC-I  EGC-IIa  EGC-IIb  EGC-IIc  EGC-III  AGC-Bormann type 1  \nAGC-Bormann type 2  AGC-Bormann type 3  AGC-Bormann type 4  AGC-Bormann type 5  Combination  기타Unclassifiable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	GTSP_COMP_GRCD	위내시경합병증등급코드	12	VARCHAR(20)		위내시경합병증등급코드	합병증(Name of complication)의 등급(Clavien-Dindo기준) 코드	코드정의서 참고	N	\N	\N	30460	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	GTSP_COMP_GRNM	위내시경합병증등급명	13	VARCHAR(200)		명VC200	합병증(Name of complication)의 등급(Clavien-Dindo기준) 명	0  I  II  IIIa  IV  V  Not available	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	GTSP_COMP_CD	위내시경합병증코드	14	VARCHAR(20)		위내시경합병증코드	위내시경검사 합병증 코드	코드정의서 참고	N	\N	\N	30470	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	GTSP_COMP_NM	위내시경합병증명	15	VARCHAR(200)		명VC200	위내시경검사 합병증 명	None  Bleeding  Perforation  Mallory-weiss tearing  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_GTSP	CRTN_DT	생성일시	16	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_EXAM_YMD	EUS검사일자	3	VARCHAR(8)	PK_3	일자VC8	내시경초음파 검사연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_EXAM_SEQ	EUS검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_T_STAG_CD	EUS_T병기코드	5	VARCHAR(20)		EUS_T병기코드	EUS 검사 결과 T 병기값 코드	코드정의서 참고	N	\N	\N	30050	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_T_STAG_NM	EUS_T병기명	6	VARCHAR(200)		명VC200	EUS 검사 결과 T 병기값 명	T1a  T1b  T2  T3  T4a  T4b  TX	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_N_STAG_CD	EUS_N병기코드	7	VARCHAR(20)		EUS_N병기코드	EUS 검사 결과 N 병기값 코드	코드정의서 참고	N	\N	\N	30040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_N_STAG_NM	EUS_N병기명	8	VARCHAR(200)		명VC200	EUS 검사 결과 N 병기값 명	N()  N0  NX	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_M_STAG_CD	EUS_M병기코드	9	VARCHAR(20)		EUS_M병기코드	EUS 검사 결과 M 병기값 코드	코드정의서 참고	N	\N	\N	30030	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_M_STAG_NM	EUS_M병기명	10	VARCHAR(200)		명VC200	EUS 검사 결과 M 병기값 명	M0  M1  MX	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_EXAM_OPN_CONT	EUS검사소견내용	11	VARCHAR(4000)		내용VC4000	내시경초음파 소견 내용	Free Text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_EXAM_RSLT_CONT	EUS검사결과내용	12	VARCHAR(4000)		내용VC4000	검사 결과 내용	Free Text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_COMP_CD	EUS합병증코드	13	VARCHAR(20)		EUS합병증코드	EUS 후 합병증 코드	코드정의서 참고	N	\N	\N	30060	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	EUS_COMP_NM	EUS합병증명	14	VARCHAR(200)		명VC200	EUS 후 합병증 명	None  bleeding  perforation  Mallory-weiss tearing  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_EUS	CRTN_DT	생성일시	15	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_YMD	수술일자	3	VARCHAR(8)	PK_3	일자VC8	수술을 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_SEQ	수술순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_KNCD	수술종류코드	5	VARCHAR(20)		수술종류코드	수술 종류 코드	코드정의서 참고	N	\N	\N	40310	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_KNNM	수술종류명	6	VARCHAR(200)		명VC200	수술 종류 명	Distal gastrectomy  Open and closure with biopsy  \nProximal gastrectomy  Pylorus preserving gastrectomy  Segmental resection  Total gastrectomy  Wedge resection  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_CD	수술코드	7	VARCHAR(20)		수술코드	병원에서 사용하는 수술 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_NM	수술명	8	VARCHAR(200)		명VC200	병원에서 사용하는 수술 LOCAL 용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_EDI_CD	수술EDI코드	9	VARCHAR(20)		수술EDI코드	수술 EDI 코드	예) Q0254	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_EDI_NM	수술EDI명	10	VARCHAR(200)		명VC200	수술 EDI 명	예 위아전절제술(유문부보존)-림프절 청소를 포함하는 것	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_SMCT_CD	수술SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	원내 수술 용어에 매핑되는 국제표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 49209004\n예2) 49209004_425391005_86174004	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_SMCT_NM	수술SNOMEDCT명	12	VARCHAR(1000)		명VC1000	원내 수술 용어에 매핑되는 국제표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Subtotal gastrectomy\n예2) Subtotal gastrectomy _Using access device_Laparoscope device	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_ICD9CM_CD	수술ICD9CM코드	13	VARCHAR(20)		수술ICD9CM코드	수술 ICD-9-CM 코드	예) 43.89	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_ICD9CM_NM	수술ICD9CM명	14	VARCHAR(1000)		명VC1000	수술 ICD-9-CM 명	예) Other partial gastrectomy	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_LDTM	수술소요시간	15	VARCHAR(20)		시간VC20	수술소요시간(수술종료시간 - 수술시작시간)	HHMMSS	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_PRPS_CD	수술목적코드	16	VARCHAR(20)		수술목적코드	수술 목적 코드	코드정의서 참고	N	\N	\N	40250	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_PRPS_NM	수술목적명	17	VARCHAR(200)		명VC200	수술 목적 명	Curative  Palliative  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_MTCD	수술방법코드	18	VARCHAR(20)		수술방법코드	위암 수술방법 코드	코드정의서 참고	N	\N	\N	40260	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_MTNM	수술방법명	19	VARCHAR(200)		명VC200	위암 수술방법 명	개복  내시경 복강경 협력 수술  로봇 보조  로봇-다공  로봇-단일공  복강경보조  전복강경 (다공 multi-port)  전복강경 (단일공 single port)  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_ANST_SITE_CD	수술마취부위코드	20	VARCHAR(20)		수술마취부위코드	수술 시 마취 부위 코드	코드정의서 참고	N	\N	\N	40240	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_ANST_SITE_NM	수술마취부위명	21	VARCHAR(200)		명VC200	수술 시 마취 부위 명	MAC  경막외  국소  신경차단  전신  정맥  척추  척추경막외  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	ASA_SCOR_CD	ASA점수코드	22	VARCHAR(20)		ASA점수코드	마취 전 환자 평가 코드 (Class 16까지 표현)	코드정의서 참고	N	\N	\N	40010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	ASA_SCOR_NM	ASA점수명	23	VARCHAR(200)		명VC200	마취 전 환자 평가 명 (Class 16까지 표현)	정상의 건강한 환자  경도의 전신 질환을 가진 환자  중등도의 중증 전신질환을 가진 환자  지속적으로 생명을 위협하는 중증의 전신질환을 가진 환자  수술하지 않으면 생명을 유지할 수 없는 정도의 중증질환을 가진 환자  장기 공여를 위한 수술 예정인 뇌사자	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_INCS_MTCD	수술절개방법코드	24	VARCHAR(20)		수술절개방법코드	수술 시 절개방법 코드	코드정의서 참고	N	\N	\N	40290	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_INCS_MTNM	수술절개방법명	25	VARCHAR(200)		명VC200	수술 시 절개방법 명	Rt upper transverse incision  multi-ports  Short upper midline  multi-ports  Single port single incision  Umbilical incision  multi-ports  Upper midline  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_CRMR_TUMR_LOCA_CD	수술둘레방향종양위치코드	26	VARCHAR(20)		수술둘레방향종양위치코드	수술시 확인된 둘레방향(circumferential)의 종양 위치 코드	코드정의서 참고	N	\N	\N	30340	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_CRMR_TUMR_LOCA_NM	수술둘레방향종양위치명	27	VARCHAR(200)		명VC200	수술시 확인된 둘레방향(circumferential)의 종양 위치 명	Lesser curvature  Greater curvature  Anterior wall  Posterior wall  Encircling  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_LNGT_1_TUMR_LOCA_CD	수술종방향1종양위치코드	28	VARCHAR(20)		수술종방향종양위치A코드	수술시 확인된 종방향(longitudinal) 종양의 위치 1 코드	코드정의서 참고	N	\N	\N	30640	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_LNGT_1_TUMR_LOCA_NM	수술종방향1종양위치명	29	VARCHAR(200)		명VC200	수술시 확인된 종방향(longitudinal) 종양의 위치 1 명	Cardia  Fundus  Body  Angle  Antrum  Pylorus  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_LNGT_2_TUMR_LOCA_CD	수술종방향2종양위치코드	30	VARCHAR(20)		수술종방향종양위치B코드	수술시 확인된 종방향(longitudinal) 종양의 위치 2 코드	코드정의서 참고	N	\N	\N	30650	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_LNGT_2_TUMR_LOCA_NM	수술종방향2종양위치명	31	VARCHAR(200)		명VC200	수술시 확인된 종방향(longitudinal) 종양의 위치 2 명	Esophagus  Upper (EGJ 포함)  Middle  Lower  Duodenum  Entire (Whole)  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	DIAG_LPEX_YN_UNID_SPCD	진단복강경검사여부확인불가구분코드	32	VARCHAR(20)		여부확인불가구분코드	진단적 복강경 검사 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	DIAG_LPEX_YN_UNID_SPNM	진단복강경검사여부확인불가구분명	33	VARCHAR(50)		명VC50	진단적 복강경 검사 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRM_ENSP_USE_YN_UNID_SPCD	수술장내시경사용여부확인불가구분코드	34	VARCHAR(20)		여부확인불가구분코드	수술장 내시경 사용 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRM_ENSP_USE_YN_UNID_SPNM	수술장내시경사용여부확인불가구분명	35	VARCHAR(50)		명VC50	수술장 내시경 사용 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	FLRN_IMAG_USE_YN_UNID_SPCD	형광영상사용여부확인불가구분코드	36	VARCHAR(20)		여부확인불가구분코드	형광영상 사용 여부	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	FLRN_IMAG_USE_YN_UNID_SPNM	형광영상사용여부확인불가구분명	37	VARCHAR(50)		명VC50	형광영상 사용 여부	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	INOP_ANTP_CD	수술시항암요법코드	38	VARCHAR(20)		수술시항암요법코드	수술시 사용한 항암요법 코드	코드정의서 참고	N	\N	\N	40280	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	INOP_ANTP_NM	수술시항암요법명	39	VARCHAR(200)		명VC200	수술시 사용한 항암요법 명	No  IP chemo  HIPEC  LHIPEC  PIPAC  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	ADH_IBTR_USE_YN_UNID_SPCD	유착방지제사용여부확인불가구분코드	40	VARCHAR(20)		여부확인불가구분코드	유착방지체 사용 여부	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	ADH_IBTR_USE_YN_UNID_SPNM	유착방지제사용여부확인불가구분명	41	VARCHAR(50)		명VC50	유착방지체 사용 여부	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	ADH_IBTR_GODS_NM	유착방지제제품명	42	VARCHAR(200)		명VC200	유착방지제 사용시 제품명 (Free Text)	예) 가딕스	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OMNL_SRMV_RANG_CD	그물막절제범위코드	43	VARCHAR(20)		그물막절제범위코드	그물막 절제 범위 코드	코드정의서 참고	N	\N	\N	40090	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OMNL_SRMV_RANG_NM	그물막절제범위명	44	VARCHAR(200)		명VC200	그물막 절제 범위 명	Total  Partial  Not done  Not applicable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	CURDG_CD	근치도코드	45	VARCHAR(20)		근치도코드	근치도 (암조직의 절제 정도)암조직의 절제 정도 코드	코드정의서 참고	N	\N	\N	40100	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	CURDG_NM	근치도명	46	VARCHAR(200)		명VC200	근치도 (암조직의 절제 정도)암조직의 절제 정도 명	R0 resection  R1 resection  R2 resection  Not applicable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	LN_SRMV_DGRE_CD	림프절절제정도코드	47	VARCHAR(20)		림프절절제정도코드	림프절 절제 정도 코드	코드정의서 참고	N	\N	\N	40110	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	LN_SRMV_DGRE_NM	림프절절제정도명	48	VARCHAR(200)		명VC200	림프절 절제 정도 명	D1  D1  D1  D2  D2  Sentinel basin dissection  None  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	LN_SRMV_DGRE_DETL_CONT	림프절절제정도상세내용	49	VARCHAR(500)		내용VC500	림프절 절제 정도가 Sentinel LN 또는 기타 일 경우 \r\r\n림프절 절제 정도 상세내용	예) Sentinel LNs 3 4d	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	MRGE_SRMV_SITE_CD	합병절제부위코드	50	VARCHAR(20)		합병절제부위코드	위암 수술시 합병 절제 부위 코드	코드정의서 참고	N	\N	\N	40500	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	MRGE_SRMV_SITE_NM	합병절제부위명	51	VARCHAR(200)		명VC200	위암 수술시 합병 절제 부위 명	None  Colon  Gall Baldder  Liver  Pancreas  Spleen  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	REPR_KNCD	재건술종류코드	52	VARCHAR(20)		재건술종류코드	재건술 종류 코드	코드정의서 참고	N	\N	\N	40490	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	REPR_KNNM	재건술종류명	53	VARCHAR(200)		명VC200	재건술 종류 명	Billroth I  Billroth II  Double tract method  Esophagogastrostomy  Gastrogastrostomy  Primary repair  Roux-en-Y  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	REPR_USE_DVCE_NM	재건술사용도구명	54	VARCHAR(200)		명VC200	재건술 사용도구	예) GIA 603.5	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	REPR_MTCD	재건술방법코드	55	VARCHAR(20)		재건술방법코드	재건술 방법 코드	코드정의서 참고	N	\N	\N	40460	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	REPR_MTNM	재건술방법명	56	VARCHAR(200)		명VC200	재건술 방법 명	Hand-sewing  Not applicable  Stapler  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	REPR_APRMTHD_CD	재건술접근법코드	57	VARCHAR(20)		재건술접근법코드	재건술 접근법 코드	코드정의서 참고	N	\N	\N	40480	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	REPR_APRMTHD_NM	재건술접근법명	58	VARCHAR(200)		명VC200	재건술 접근법 명	Intracorporeal  Extracorporeal  Not applicable   기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	OPRT_EBL_QTY	수술추정실혈량	59	NUMERIC(5)		수N5	수술 시 추정실혈량(Estimated blood loss) (단위 ml)	9999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	ASCT_YN_UNID_SPCD	복수여부확인불가구분코드	60	VARCHAR(20)		여부확인불가구분코드	복수 여부	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	ASCT_YN_UNID_SPNM	복수여부확인불가구분명	61	VARCHAR(50)		명VC50	복수 여부	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_OPRT	CRTN_DT	생성일시	62	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_SRPR_YMD	ESD시술일자	3	VARCHAR(8)	PK_3	일자VC8	내시경점막하절제술을 시행한 수술연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_SRPR_SEQ	ESD시술순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_SRPR_STRT_DT	ESD시술시작일시	5	TIMESTAMP		일시TIMESTAMP	시술시작시간	HHMMSS	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_SRPR_END_DT	ESD시술종료일시	6	TIMESTAMP		일시TIMESTAMP	시술종료시간	HHMMSS	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_LESN_SIZE_VL	ESD병변크기값	7	NUMERIC(3)		값N3	내시경으로 관찰한 병변의 장축 길이 (단위  mm)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_LESN_SHAP_CD	ESD병변모양코드	8	VARCHAR(20)		ESD병변모양코드	내시경으로 관찰한 병변 모양 코드	코드정의서 참고	N	\N	\N	40030	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_LESN_SHAP_NM	ESD병변모양명	9	VARCHAR(200)		명VC200	내시경으로 관찰한 병변 모양 명	Elevated (I IIa IIaIIc)  Flat (IIb)  Depressed  (IIc)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_LESN_LOCA_WDTH_CD	ESD병변위치가로코드	10	VARCHAR(20)		ESD병변위치가로코드	병변 위치 (가로) 코드	코드정의서 참고	N	\N	\N	40040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_LESN_LOCA_WDTH_NM	ESD병변위치가로명	11	VARCHAR(200)		명VC200	병변 위치 (가로) 명	Lessor curvature  Greater curvature  Posterior wall  Anterior wall	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_LESN_LOCA_LGTD_CD	ESD병변위치세로코드	12	VARCHAR(20)		ESD병변위치세로코드	병변 위치 (세로) 코드	코드정의서 참고	N	\N	\N	40050	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_LESN_LOCA_LGTD_NM	ESD병변위치세로명	13	VARCHAR(200)		명VC200	병변 위치 (세로) 명	Antrum  Angle  Lowerbody  Midbody  Upperbody or cardia	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_ULCR_YN_UNID_SPCD	ESD궤양여부확인불가구분코드	14	VARCHAR(20)		여부확인불가구분코드	내시경으로 관찰할 궤양 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_ULCR_YN_UNID_SPNM	ESD궤양여부확인불가구분명	15	VARCHAR(50)		명VC50	내시경으로 관찰할 궤양 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_PERF_YN_UNID_SPCD	ESD천공여부확인불가구분코드	16	VARCHAR(20)		여부확인불가구분코드	시술 중 천공 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_PERF_YN_UNID_SPNM	ESD천공여부확인불가구분명	17	VARCHAR(50)		명VC50	시술 중 천공 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_PERF_MSRE_CD	ESD천공조치코드	18	VARCHAR(20)		ESD천공조치코드	천공에 대한 조치 코드	코드정의서 참고	N	\N	\N	40060	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_PERF_MSRE_NM	ESD천공조치명	19	VARCHAR(200)		명VC200	천공에 대한 조치 명	수술  내시경적치료 (clipping)  내시경치료 없이 보존치료 (산소투여 등)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_RSLT_CD	ESD결과코드	20	VARCHAR(20)		ESD결과코드	절제 결과 코드	코드정의서 참고	N	\N	\N	40020	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_RSLT_NM	ESD결과명	21	VARCHAR(200)		명VC200	절제 결과 명	En bloc resection  Piecemeal resection  Failure	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_OPN_CONT	ESD소견내용	22	VARCHAR(4000)		내용VC4000	ESD 소견 내용	Free text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	ESD_RSLT_CONT	ESD결과내용	23	VARCHAR(500)		내용VC500	ESD 결과 내용	예) Successful ESD for EGC IIc	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_SRPR	CRTN_DT	생성일시	24	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	SRGC_PTEM_YMD	외과병리검사일자	3	VARCHAR(8)	PK_3	일자VC8	수술 후 외과병리를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	SRGC_PTEM_SEQ	외과병리검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	SGPT_READ_YMD	외과병리판독일자	5	VARCHAR(8)		일자VC8	수술 후 외과병리 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	SGPT_HVST_SITE_CD	외과병리채취부위코드	6	VARCHAR(20)		외과병리채취부위코드	수술 후 외과병리 조직 채취부위 코드	코드정의서 참고	N	\N	\N	30430	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	SGPT_HVST_SITE_NM	외과병리채취부위명	7	VARCHAR(200)		명VC200	수술 후 외과병리 조직 채취부위 명	Stomach  LN  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	SRGC_PTEM_RSLT_TUMR_CNT	외과병리검사결과종양수	8	NUMERIC(3)		수N3	병리 검사에서 확인된 종양의 개수	예) 2	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	HTLG_DIAG_CD	조직학적진단코드	9	VARCHAR(20)		조직학적진단코드	수술 후 외과병리를 통해 확인된 조직학적 진단명의 코드	코드정의서 참고	N	\N	\N	30540	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	HTLG_DIAG_NM	조직학적진단명	10	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 조직학적 진단명	Papillary adenocarcinoma  \r\r\nTubular adenocarcinoma  \r\r\nMucinous adenocarcinoma  \r\r\nPoorly cohesive carcinoma(signet ring cell carcinoma 포함) \r\r\nMixed adenocarcinoma \r\r\nAdenosquamous carcinoma  \r\r\nCarcinoma with lymphoid stroma  \r\r\nHepatoid adenocarcinoma  \r\r\nSquamous cell carcinoma  \r\r\nUndifferentiated carcinoma  \r\r\nNeuroendocrine tumor  \r\r\nGastrointestinal stromal tumor  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DRNK_STRT_AGE_VL	음주시작연령값	10	NUMERIC(4)		값N4	음주 시작연령 (단위  세)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	HTLG_DFGD_CD	조직학적분화도코드	11	VARCHAR(20)		조직학적분화도코드	수술 후 외과병리의 조직학적 분화도 (Histologic grade)  adenocarcinoma 일 때만 분류 코드	코드정의서 참고	N	\N	\N	30530	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	HTLG_DFGD_NM	조직학적분화도명	12	VARCHAR(200)		명VC200	수술 후 외과병리의 조직학적 분화도 (Histologic grade)  adenocarcinoma 일 때만 분류 명	Well differentiated  Moderately differentiated  Poorly differentiated  Combined  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_CRMR_TUMR_LOCA_CD	수술후둘레방향종양위치코드	13	VARCHAR(20)		수술둘레방향종양위치코드	수술 후 외과병리를 통해 확인된 둘레방향(circumferential)의 종양 위치 코드	코드정의서 참고	N	\N	\N	30340	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_CRMR_TUMR_LOCA_NM	수술후둘레방향종양위치명	14	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 둘레방향(circumferential)의 종양 위치 명	Lesser curvature  Greater curvature  Anterior wall  Posterior wall  Encircling  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_LNGT_1_TUMR_LOCA_CD	수술후종방향1종양위치코드	15	VARCHAR(20)		수술종방향종양위치A코드	수술 후 외과병리를 통해 확인된 종방향(longitudinal) 종양의 위치 1 코드	코드정의서 참고	N	\N	\N	30640	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_LNGT_1_TUMR_LOCA_NM	수술후종방향1종양위치명	16	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 종방향(longitudinal) 종양의 위치 1 명	Cardia  Fundus  Body  Angle  Antrum  Pylorus  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_LNGT_2_TUMR_LOCA_CD	수술후종방향2종양위치코드	17	VARCHAR(20)		수술종방향종양위치B코드	수술 후 외과병리를 통해 확인된 종방향(longitudinal) 종양의 위치 2 코드	코드정의서 참고	N	\N	\N	30650	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_LNGT_2_TUMR_LOCA_NM	수술후종방향2종양위치명	18	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 종방향(longitudinal) 종양의 위치 2 명	Esophagus  Upper (EGJ 포함)  Middle  Lower  Duodenum  Entire (Whole)  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	GROS_TPCD	GROSS유형코드	19	VARCHAR(20)		GROSS유형코드	Gross type 분류 코드(major)	코드정의서 참고	N	\N	\N	30070	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	GROS_TPNM	GROSS유형명	20	VARCHAR(200)		명VC200	Gross type 분류 명(major)	EGC-I  EGC-IIa  EGC-IIb  EGC-IIc  EGC-III  AGC-Bormann type 1  AGC-Bormann type 2  AGC-Bormann type 3  AGC-Bormann type 4  AGC-Bormann type 5  Combination  기타Unclassifiable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	GROS_TYPE_CONT	GROSS유형내용	21	VARCHAR(200)		내용VC200	Gross type이 Combination일 경우 내용	free text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	TUMR_WDTH_LNTH_VL	종양가로길이값	22	NUMERIC(4,1)		값N4,1	각 종양의 가로 크기 (단위 cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	TUMR_LGTD_LNTH_VL	종양세로길이값	23	NUMERIC(4,1)		값N4,1	각 종양의 세로 크기 (단위 cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	TUMR_HGHT_VL	종양높이값	24	NUMERIC(4,1)		값N4,1	각 종양의 높이 크기 (단위 cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	TUMR_MAX_DIAM_VL	종양최대직경값	25	NUMERIC(4,1)		값N4,1	수술 후 외과병리를 통해 확인된 종양의 최대직경 (단위  cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	IFLT_ORGN_CD	침습장기코드	26	VARCHAR(20)		침습장기코드	종양 T병기값이 T4b경우 침습된 장기 코드	코드정의서 참고	N	\N	\N	30600	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	IFLT_ORGN_NM	침습장기명	27	VARCHAR(200)		명VC200	종양 T병기값이 T4b경우 침습된 장기 명	Abdominal wall  Adrenal gland  Colon  Diaphragm  Gallbladder  Liver  Mesocolon  Pancreas  Retroperitoneum  Spleen  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	INVA_DGRE_CD	침윤정도코드	28	VARCHAR(20)		침윤정도코드	침윤의 정도 코드	코드정의서 참고	N	\N	\N	30610	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	INVA_DGRE_NM	침윤정도명	29	VARCHAR(200)		명VC200	침윤의 정도 명	Mucosa  Submucosa  Proper muscle  Subseroca  Serosa  Adjacent organ  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	INVA_DPTH_VL	침윤깊이값	30	NUMERIC(4)		값N4	점막하 침윤 깊이 (mm) (T1b 경우)	예) 3	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	LYMP_INVA_EX_YN_SPCD	림프성침윤존재여부구분코드	31	VARCHAR(20)		존재여부구분코드	종양의 림프성 침윤 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	LYMP_INVA_EX_YN_SPNM	림프성침윤존재여부구분명	32	VARCHAR(50)		명VC50	종양의 림프성 침윤 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	VASC_INVA_EX_YN_SPCD	혈관성침윤존재여부구분코드	33	VARCHAR(20)		존재여부구분코드	종양의 혈관 침윤 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	VASC_INVA_EX_YN_SPNM	혈관성침윤존재여부구분명	34	VARCHAR(50)		명VC50	종양의 혈관 침윤 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	NERV_PREX_EX_YN_SPCD	신경주위침윤존재여부구분코드	35	VARCHAR(20)		존재여부구분코드	신경주위 침윤 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	NERV_PREX_EX_YN_SPNM	신경주위침윤존재여부구분명	36	VARCHAR(50)		명VC50	신경주위 침윤 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	OPRT_PMRG_RLCR_INVL_YN_SPCD	수술근위절제면잔존암포함여부구분코드	37	VARCHAR(20)		포함여부구분코드	근위 절제연 잔존암 여부 코드	코드정의서 참고	N	\N	\N	30630	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	OPRT_PMRG_RLCR_INVL_YN_SPNM	수술근위절제면잔존암포함여부구분명	38	VARCHAR(50)		명VC50	근위 절제연 잔존암 여부 명	Involved  Not involved  No data	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	OPRT_PMRG_SIZE_VL	수술근위절제면크기값	39	NUMERIC(5,2)		값N5,2	근위 절제 연 크기 (단위  mm)	99.99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	OPRT_DMRG_RLCR_INVL_YN_SPCD	수술원위절제면잔존암포함여부구분코드	40	VARCHAR(20)		포함여부구분코드	원위 절제연 잔존암 여부 코드	코드정의서 참고	N	\N	\N	30630	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	OPRT_DMRG_RLCR_INVL_YN_SPNM	수술원위절제면잔존암포함여부구분명	41	VARCHAR(50)		명VC50	원위 절제연 잔존암 여부 명	Involved  Not involved  No data	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	OPRT_DMRG_SIZE_VL	수술원위절제면크기값	42	NUMERIC(5,2)		값N5,2	원위 절제 연 (단위  mm 소수점 1자리까지 표기)	99.99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	STES_BNST_CNCR_CLCD	위식도경계부위암분류코드	43	VARCHAR(20)		위식도경계부위암분류코드	Siewert type 코드 (EG junction ca 인 경우)	코드정의서 참고	N	\N	\N	30480	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	STES_BNST_CNCR_CLNM	위식도경계부위암분류명	44	VARCHAR(200)		명VC200	Siewert type 명 (EG junction ca 인 경우)	Type I    Type II  Type III  해당없음	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	TOTL_LN_CNT	총림프절수	45	NUMERIC(3)		수N3	절제된 림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	PSTV_LN_CNT	양성림프절수	46	VARCHAR(100)		수VC100	침윤된 림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	LN_BYLC_MTST_CONT	림프절위치별전이내용	47	VARCHAR(4000)		내용VC4000	림프절 위치별 전이 내용	예) LN 1 02  LN 3 04  LN 4d 00  LN 4sb 00  LN 5 01  LN 6 26   LN 7 06  LN 8a 00  LN 9 00  LN 11p 00  LN 12a 00  peritumoral 11	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AJCC_YR	AJCC년도	48	VARCHAR(4)		년도VC4	AJCC 기준년도	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_PATH_TNM_STAG_VL	수술후병리TNM병기값	49	VARCHAR(20)		값VC20	병리 TNM 병기값	예) T1N0M0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_PATH_T_STAG_VL	수술후병리T병기값	50	VARCHAR(20)		값VC20	병리 T 병기값	예) T2	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_PATH_N_STAG_VL	수술후병리N병기값	51	VARCHAR(20)		값VC20	병리 N 병기값	예) N0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	AFOP_PATH_M_STAG_VL	수술후병리M병기값	52	VARCHAR(20)		값VC20	병리 M 병기값	예) M0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	ESD_VMRG_RLCR_PSTV_YN_SPCD	ESD수직절제면잔존암양성여부구분코드	53	VARCHAR(20)		양성여부구분코드	ESD 후 수직절제 연 잔존암 여부 코드 \nDeep (Vertical) margin 	코드정의서 참고	N	\N	\N	30370	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	ESD_VMRG_RLCR_PSTV_YN_SPNM	ESD수직절제면잔존암양성여부구분명	54	VARCHAR(50)		명VC50	ESD 후 수직절제 연 잔존암 여부 명\nDeep (Vertical) margin	Positive  Negative  Indeterminate	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	ESD_VMRG_VL	ESD수직절제면값	55	NUMERIC(4)		값N4	ESD 후 수직절제 연\r\r\nCloset deep (Vertical) margin (단위  mm)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	ESD_HMRG_RLCR_PSTV_YN_SPCD	ESD수평절제면잔존암양성여부구분코드	56	VARCHAR(20)		양성여부구분코드	ESD 후 수평 절제 연 잔존암 여부 코드\nLateral (Horizontal) margin	코드정의서 참고	N	\N	\N	30370	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	ESD_HMRG_RLCR_PSTV_YN_SPNM	ESD수평절제면잔존암양성여부구분명	57	VARCHAR(50)		명VC50	ESD 후 수평 절제 연 잔존암 여부 명\nLateral (Horizontal) margin	Positive  Negative  Indeterminate	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	ESD_HMRG_VL	ESD수평절제면값	58	NUMERIC(4)		값N4	ESD 후 가장 가까운 수평절제 연 Closest lateral (Horizontal) margin (단위  mm)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	ESD_HMRG_RLCR_LNTH_VL	ESD수평절제면잔존암길이값	59	NUMERIC(4)		값N4	ESD 후 수평절제 연 잔존암의 길이\r\r\nLength of positive horizontal margin (단위  mm)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_EXAM_SGPT	CRTN_DT	생성일시	60	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	COMP_OCRN_OPRT_YMD	합병증발생수술일자	3	VARCHAR(8)	PK_3	일자VC8	합병증 발생 관련 수술연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	COMP_OCRN_OPRT_SEQ	합병증발생수술순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	AFOC_CLCD	수술후합병증분류코드	5	VARCHAR(20)		수술후합병증분류코드	수술 후 합병증 분류코드	코드정의서 참고	N	\N	\N	20030	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	AFOC_CLNM	수술후합병증분류명	6	VARCHAR(200)		명VC200	수술 후 합병증 분류명	Local complication  Systemic complication	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	AFOC_CD	수술후합병증코드	7	VARCHAR(20)		수술후합병증코드	수술 후 합병증 코드	코드정의서 참고	N	\N	\N	20040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	AFOC_NM	수술후합병증명	8	VARCHAR(200)		명VC200	수술 후 합병증 명	Anastomotic leakage  Anastomotic stricture  Cardiovascular complications  Central nervous system complications  Chylous ascites  Delayed gastric emptying ( gastric stasis)  Duodenal stump leakage  Endocrine system complications  Hepatic system complications  \nIntestinal obstruction (ileus)  Intra-abdominal bleeding  \nIntra-abdominal fluid collection  Intraluminal bleeding  \nPancreatic leakage  Respiratory complications  \nUrinary system complications  Wound complication  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	AFOP_ETC_COMP_CONT	수술후기타합병증내용	9	VARCHAR(4000)		내용VC4000	수술 후 합병증 기타일 경우 서술 내용	Free text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_DIAG_AFOC	CRTN_DT	생성일시	10	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLTR_PRSC_YMD	수혈처방일자	3	VARCHAR(8)	PK_3	일자VC8	수혈 처방연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLTR_PRSC_SEQ	수혈처방순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLPT_KNCD	혈액제제종류코드	5	VARCHAR(20)		혈액제제종류코드	처방된 수혈 제제 종류	코드정의서 참고	N	\N	\N	40580	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLPT_KNNM	혈액제제종류명	6	VARCHAR(200)		명VC200	처방된 수혈 제제 종류	Apheresis platelet  Autotransfusion  Cryoprecipitate  Fresh frozen plasma  Platelet  Pre-storage Leukocyte Filtered Red Blood Cells  Red blood cell  Washed red blood cell  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLPT_CD	혈액제제코드	7	VARCHAR(20)		혈액제제코드	처방된 수혈 제제 코드 (원내 코드)	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLPT_NM	혈액제제명	8	VARCHAR(200)		명VC200	처방된 수혈 제제 명 (원내 용어)	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLTR_PACK_CNT	수혈팩수	9	NUMERIC(3)		수N3	수혈 제제 pack 수의 합	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	BLTR_TOTL_QTY	수혈총량	10	NUMERIC(8)		수N8	수혈 제제별 용량의 합	9999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_BLTR	CRTN_DT	생성일시	11	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_PRSC_YMD	약제처방일자	3	VARCHAR(8)	PK_3	일자VC8	약제 처방연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_PRSC_SEQ	약제처방순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_CLCD	약제분류코드	5	VARCHAR(20)		약제분류코드	환자에게 처방된 약제 분류 코드	코드정의서 참고	N	\N	\N	40390	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_CLNM	약제분류명	6	VARCHAR(200)		명VC200	환자에게 처방된 약제 분류 명	항암약제  기타약제	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_SPCD	약제구분코드	7	VARCHAR(20)		약제구분코드	약제 구분 코드	코드정의서 참고	N	\N	\N	40380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_SPNM	약제구분명	8	VARCHAR(200)		명VC200	약제 구분 명	세포독성약제  항암표적약제  항암내분비약제  항암면역약제  기타항암약제  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRIN_KNCD	약제성분종류코드	9	VARCHAR(20)		약제성분종류코드	약제 성분명위암 항암약제 및 비항암약제에는 예시와 같은 약제 성분명이 존재하며 약제에 대한 정보를 수집 시 성분명에 따른 LOCAL EDI ATC 등과 같은 코드를 포함	코드정의서 참고	N	\N	\N	40400	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRIN_KNNM	약제성분종류명	10	VARCHAR(200)		명VC200	약제 성분명위암 항암약제 및 비항암약제에는 예시와 같은 약제 성분명이 존재하며 약제에 대한 정보를 수집 시 성분명에 따른 LOCAL EDI ATC 등과 같은 코드를 포함	Capecitabine  Carboplatin  Cisplatin  Docetaxel  Doxorubicin  \nEpirubicin  Etoposide  Fluorouracil  Irinotecan hydrochloride  \nLeucovorin  Methotrexate  Mitomycin C  Nivolumab  Oxaliplatin  \nPaclitaxel  Pembrolizumab  Ramucirumab  Tegafurgimeraciloteracil(S-1)  \nTrastuzumab  Trifluridine-tipiracil  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRIN_CD	약제성분코드	11	VARCHAR(20)		약제성분코드	약제 주성분 코드	예) 134530BIJ	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRIN_NM	약제성분명	12	VARCHAR(200)		명VC200	약제 주성분 명	예) cisplatin	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRIN_SMCT_CD	약제성분SNOMEDCT코드	13	VARCHAR(200)		SNOMEDCT코드	약제 주성분의 국제 표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 784941009\n예2) 716872004_363701004_387318005	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRIN_SMCT_NM	약제성분SNOMEDCT명	14	VARCHAR(1000)		명VC1000	약제 주성분의 국제 표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Product containing precisely cisplatin 50 milligram1 vial powder for conventional release solution for injection\n예2) Antineoplastic chemotherapy regimen_Direct substance_Cisplatin	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_CD	약제코드	15	VARCHAR(20)		약제코드	원내에서 수집하는 약제 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_NM	약제명	16	VARCHAR(200)		명VC200	원내에서 수집하는 약제 LOCAL 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_EDI_CD	약제EDI코드	17	VARCHAR(20)		약제EDI코드	약제 EDI 코드	예) 642502351	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_EDI_NM	약제EDI명	18	VARCHAR(200)		명VC200	약제 EDI 명	예) 씨스푸란주10밀리그램(시스플라틴)_(10mg20mL)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_ATC_CD	약제ATC코드	19	VARCHAR(20)		약제ATC코드	약제 ATC 코드	예) L01XA01	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_ATC_NM	약제ATC명	20	VARCHAR(200)		명VC200	약제 ATC 명	예) Cisplatin	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_RXNM_CD	약제RXNORM코드	21	VARCHAR(20)		RXNORM코드	약제 RxNorm 코드	예) 1736854	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_RXNM_NM	약제RXNORM명	22	VARCHAR(200)		명VC200	약제 RxNorm 명	예) cisplatin 50 MG Injection	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_PRSC_CAPA	약제처방용량	23	VARCHAR(50)		수VC50	처방된 약제 용량	999.999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_PRSC_DCNT	약제처방일수	24	NUMERIC(3)		일수N3	약제 처방일수	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_INJC_PTH_CD	약제투여경로코드	25	VARCHAR(20)		약제투여경로코드	약제 투여경로 코드	코드정의서 참고	N	\N	\N	40440	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_INJC_PTH_NM	약제투여경로명	26	VARCHAR(200)		명VC200	약제 투여경로 명	경구  정맥내주사  척수강내주사  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_PRSC_CAPA_UNIT_CD	약제처방용량단위코드	27	VARCHAR(20)		약제처방용량단위코드	처방된 약제 용량 단위	코드정의서 참고	N	\N	\N	40420	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_PRSC_CAPA_UNIT_NM	약제처방용량단위명	28	VARCHAR(200)		명VC200	처방된 약제 용량 단위	AMP  cap  dos  ea  g  gkg  gm2  ke  kit  mcg  mcgkg  mcgm2  mg  mgkg  mgm2  ml  pfu  pkg  set  tab  unit  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	DRUG_MDCT_DTRN_MCNT	약제투약기간월수	29	NUMERIC(3)		월수N3	환자에게 처방된 약제 투약기간 (단위  개월)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_DRIN	CRTN_DT	생성일시	30	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_STRT_YMD	항암요법시작일자	3	VARCHAR(8)	PK_3	일자VC8	항암요법 시작 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_SEQ	항암요법순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_END_YMD	항암요법종료일자	5	VARCHAR(8)		일자VC8	항암요법 종료 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_LINE_CNT	항암요법라인수	6	NUMERIC(3)		수N3	선택한 항암요법의 Line 수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_TOTL_CYCL_CNT	항암요법총주기수	7	NUMERIC(3)		수N3	항암요법 치료 주기 수 (Cycle)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_TRTM_PRPS_CD	항암요법치료목적코드	8	VARCHAR(20)		항암요법치료목적코드	항암요법 치료 목적 코드	코드정의서 참고	N	\N	\N	40560	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_TRTM_PRPS_NM	항암요법치료목적명	9	VARCHAR(200)		명VC200	항암요법 치료 목적 명	Adjuvant  Concurrent  Consolidation  Induction  Maintenance  Neoadjuvant  Palliative  Salvage  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_NM	항암요법명	10	VARCHAR(200)		명VC200	약제 조합으로서의 항암요법	예) tegafurgimeraciloteracil  capecitabine  oxaliplatin I docetaxel  cisplatin  fluorouracil	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_TEMP_STOP_YN_UNID_SPCD	항암요법임시중단여부확인불가구분코드	11	VARCHAR(20)		여부확인불가구분코드	항암요법 일시중단 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_TEMP_STOP_YN_UNID_SPNM	항암요법임시중단여부확인불가구분명	12	VARCHAR(50)		명VC50	항암요법 일시중단 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_END_RESN_CD	항암요법종료이유코드	13	VARCHAR(20)		항암요법종료이유코드	항암요법 종료 이유 코드	코드정의서 참고	N	\N	\N	40550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_END_RESN_NM	항암요법종료이유명	14	VARCHAR(200)		명VC200	항암요법 종료 이유 명	Tumor progression  사망  추적관찰 소실  항암제 부작용  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_ASMT_YMD	항암요법평가일자	15	VARCHAR(8)		일자VC8	항암요법 평가연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_ASMT_ITEM_CD	항암요법평가항목코드	16	VARCHAR(20)		항암요법평가항목코드	항암요법 후 평가내용을 기재하는 항목 코드	코드정의서 참고	N	\N	\N	40570	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_ASMT_ITEM_NM	항암요법평가항목명	17	VARCHAR(200)		명VC200	항암요법 후 평가내용을 기재하는 항목 명	CR  PD  PR  SD  NE  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_SEFF_CD	항암요법부작용코드	18	VARCHAR(20)		항암요법부작용코드	항암요법 후 발생한 부작용에 대한 정보 제공 항목	코드정의서 참고	N	\N	\N	40530	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_SEFF_NM	항암요법부작용명	19	VARCHAR(200)		명VC200	항암요법 후 발생한 부작용에 대한 정보 제공 항목	Alopecia  Anorexia  Dry skin  Hand-foot syndrome  Nauseavomiting  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_SEFF_GRCD	항암요법부작용등급코드	20	VARCHAR(20)		항암요법부작용등급코드	항암요법 후 발생한 부작용 Grade에 대한 정보 제공 항목	코드정의서 참고	N	\N	\N	40520	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	ANTP_SEFF_GRNM	항암요법부작용등급명	21	VARCHAR(200)		명VC200	항암요법 후 발생한 부작용 Grade에 대한 정보 제공 항목	I  II  III  IV  V	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_ANTP	CRTN_DT	생성일시	22	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_PRSC_YMD	방사선치료처방일자	3	VARCHAR(8)	PK_3	일자VC8	방사선치료 처방연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_PRSC_SEQ	방사선치료처방순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_KNCD	방사선치료종류코드	5	VARCHAR(20)		방사선치료종류코드	방사선치료종류코드	코드정의서 참고	N	\N	\N	40180	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_KNNM	방사선치료종류명	6	VARCHAR(200)		명VC200	방사선치료종류명	뇌 정위적 방사선수술  밀봉소선원치료  세기변조 방사선치료  양성자 치료  입체조형치료  전신조사  정위적 방사선 분할치료  체부 정위적 방사선수술  체외조사	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_CD	방사선치료코드	7	VARCHAR(20)		방사선치료코드	원내에서 수집하는 방사선 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_NM	방사선치료명	8	VARCHAR(200)		명VC200	원내에서 수집하는 방사선 LOCAL 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_EDI_CD	방사선치료EDI코드	9	VARCHAR(20)		방사선EDI코드	방사선치료 EDI 코드	예) HD061	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_EDI_NM	방사선치료EDI명	10	VARCHAR(200)		명VC200	방사선치료 EDI 명	예) 입체조형치료1회당	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SMCT_CD	방사선치료SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	방사선치료 처방명의 국제 표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 441783000\n예2) 33195004_424244007_118345003	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SMCT_NM	방사선치료SNOMEDCT명	12	VARCHAR(1000)		명VC1000	방사선치료 처방명의 국제 표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Conformal radiotherapy\n예2) Teleradiotherapy procedure_Using energy_High energy laser beam	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_PRPS_CD	방사선치료목적코드	13	VARCHAR(20)		방사선치료목적코드	방사선 치료 목적 코드	코드정의서 참고	N	\N	\N	40130	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_PRPS_NM	방사선치료목적명	14	VARCHAR(200)		명VC200	방사선 치료 목적 명	Curative  Palliative  Adjuvant  Neoadjuvant  기타 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SITE_CD	방사선치료부위코드	15	VARCHAR(20)		방사선치료부위코드	방사선 치료 부위 코드	코드정의서 참고	N	\N	\N	40140	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SITE_NM	방사선치료부위명	16	VARCHAR(200)		명VC200	방사선 치료 부위 명	Abdomen wall  Bone  Boost  Brain  \nDistant lymph node  Liver  Lung  Stomach  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	BYST_RD_IMPL_NT	부위별방사선시행횟수	17	NUMERIC(3)		수N3	방사선 부위별 시행 횟수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RD_CGY	방사선선량	18	NUMERIC(5)		수N5	방사선 1회 선량 (단위  Gy)	99	N	\N	\N	\N	N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	BYST_RD_TOTL_CGY	부위별방사선총선량	19	NUMERIC(3)		수N3	방사선 부위별 총선량 (단위  Gy)	999	N	\N	\N	\N	N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_ASMT_YMD	방사선치료평가일자	20	VARCHAR(8)		일자VC8	방사선치료 후 평가 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_ASMT_ITEM_CD	방사선치료평가항목코드	21	VARCHAR(20)		방사선치료평가항목코드	방사선치료 후 평가내용 코드	코드정의서 참고	N	\N	\N	40200	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_ASMT_ITEM_NM	방사선치료평가항목명	22	VARCHAR(200)		명VC200	방사선치료 후 평가내용 명	CR  PD  PR  SD  NE  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SEFF_PERD_SPCD	방사선치료부작용시기구분코드	23	VARCHAR(20)		방사선치료부작용시기구분코드	방사선 치료 후 환자에게 발생한 부작용 시기 코드	코드정의서 참고	N	\N	\N	40160	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SEFF_PERD_SPNM	방사선치료부작용시기구분명	24	VARCHAR(200)		명VC200	방사선 치료 후 환자에게 발생한 부작용 시기 명	급성(3개월 이내)  만성(3개월 초과)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SEFF_KNCD	방사선치료부작용종류코드	25	VARCHAR(20)		방사선치료부작용종류코드	방사선 치료 후 환자에게 발생한 부작용 코드	코드정의서 참고	N	\N	\N	40170	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SEFF_KNNM	방사선치료부작용종류명	26	VARCHAR(200)		명VC200	방사선 치료 후 환자에게 발생한 부작용 명	Aches  Fatigue  Heart damage  Skin irritation  Swelling of  breast	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SEFF_GRCD	방사선치료부작용등급코드	27	VARCHAR(20)		방사선치료부작용등급코드	방사선치료 후 발생한 부작용 등급 코드(CTCAE v5.0 참조)	코드정의서 참고	N	\N	\N	40150	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	RDT_SEFF_GRNM	방사선치료부작용등급명	28	VARCHAR(200)		명VC200	방사선치료 후 발생한 부작용 등급 명(CTCAE v5.0 참조)	Grade 1  Grade 2  Grade 3  Grade 4  Grade 5	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_TRTM_RD	CRTN_DT	생성일시	29	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLDG_YMD	재발진단일자	3	VARCHAR(8)	PK_3	일자VC8	암 재발 진단연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLDG_SEQ	재발진단순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLDG_MTCD	재발진단방법코드	5	VARCHAR(20)		재발진단방법코드	암 재발 진단 시 진단방법 코드	코드정의서 참고	N	\N	\N	50040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLDG_MTNM	재발진단방법명	6	VARCHAR(200)		명VC200	암 재발 진단 시 진단방법 명	영상검사  조직검사  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLPS_SITE_CD	재발부위코드	7	VARCHAR(20)		재발부위코드	재발암 부위 코드	코드정의서 참고	N	\N	\N	50010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLPS_SITE_NM	재발부위명	8	VARCHAR(200)		명VC200	재발암 부위 명	Bone  Distans LN  Liver  Lung  Peritoneum  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLPS_KNCD	재발종류코드	9	VARCHAR(20)		재발종류코드	재발의 성격 (국소재발 원격전이)	코드정의서 참고	N	\N	\N	50020	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLPS_KNNM	재발종류명	10	VARCHAR(200)		명VC200	재발의 성격 (국소재발 원격전이)	Both Local  Distant  Distant(Systemic)  Locoregional	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	RLPS_TRTM_CONT	재발치료내용	11	VARCHAR(5)		내용VC5	재발암 치료 요법 \r\r\n 동시항암화학방사선요법 수술 화학요법 방사선요법 기타  순으로 시행한 치료는 00000에 1로 표시	예) 동시항암화학방사선요법 수술 시행  11000	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_FUOR_RLPS	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF_TEST	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:36:14.384681	TEST01@naver.com	2023-06-12 13:36:14.384681
GSCN_PT_HLINF_TEST	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:36:14.384681	TEST01@naver.com	2023-06-12 13:36:14.384681
GSCN_PT_HLINF_TEST	ADM_YMD	입원일자	3	VARCHAR(8)	PK_3	일자VC8	입원연월일	YYYYMMDD	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	HLINF_SEQ	건강정보순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DSCH_YMD	퇴원일자	5	VARCHAR(8)		일자VC8	퇴원연월일	YYYYMMDD	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	CUR_DRNK_YN_NOANS_SPCD	현재음주여부무응답구분코드	6	VARCHAR(20)		여부무응답구분코드	현재 음주 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	CUR_DRNK_YN_NOANS_SPNM	현재음주여부무응답구분명	7	VARCHAR(50)		명VC50	현재 음주 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DHIS_YN_NOANS_SPCD	음주력여부무응답구분코드	8	VARCHAR(20)		여부무응답구분코드	음주력 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DHIS_YN_NOANS_SPNM	음주력여부무응답구분명	9	VARCHAR(50)		명VC50	음주력 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DRNK_STRT_AGE_VL	음주시작연령값	10	NUMERIC(4)		값N4	음주 시작연령 (단위  세)	999	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DRNK_KNCD	음주종류코드	11	VARCHAR(20)		음주종류코드	음주 종류 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DRNK_KNNM	음주종류명	12	VARCHAR(200)		명VC200	음주 종류 명	막걸리  맥주  소주  양주  무응답  기타	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DRNK_QTY	음주량	13	VARCHAR(100)		수VC100	평균 음주량 (단위  병회)	999	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DRNK_NT	음주횟수	14	NUMERIC(3)		수N3	월평균 음주횟수 (단위  회월)	99	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DRNK_DTRN_YCNT	음주기간년수	15	NUMERIC(3)		년수N3	총 음주기간 (단위  년)	999	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	NDRK_STRT_YR	금주시작년도	16	VARCHAR(4)		년도VC4	환자의 금주시작시기 (단위 년)	YYYY	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	CUR_SMOK_YN_NOANS_SPCD	현재흡연여부무응답구분코드	17	VARCHAR(20)		여부무응답구분코드	현재 흡연 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	CUR_SMOK_YN_NOANS_SPNM	현재흡연여부무응답구분명	18	VARCHAR(50)		명VC50	현재 흡연 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	SHIS_YN_NOANS_SPCD	흡연력여부무응답구분코드	19	VARCHAR(20)		여부무응답구분코드	흡연력 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	SHIS_YN_NOANS_SPNM	흡연력여부무응답구분명	20	VARCHAR(50)		명VC50	흡연력 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	SMOK_STRT_AGE_VL	흡연시작연령값	21	NUMERIC(4)		값N4	흡연 시작연령 (단위  세)	999	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	SMOK_DTRN_YCNT	흡연기간년수	22	NUMERIC(3)		년수N3	흡연기간 (단위  년)	99	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	SMOK_QTY	흡연량	23	NUMERIC(3)		수N3	흡연량 (단위  갑일)	999	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	NSMK_STRT_YR	금연시작년도	24	VARCHAR(4)		년도VC4	금연시작시기	YYYY	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_YN_NOANS_SPCD	병력여부무응답구분코드	25	VARCHAR(20)		여부무응답구분코드	과거 병력 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_YN_NOANS_SPNM	병력여부무응답구분명	26	VARCHAR(50)		명VC50	과거 병력 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_HL_YN_NOANS_SPCD	병력고지혈증여부무응답구분코드	27	VARCHAR(20)		여부무응답구분코드	과거 고지혈증 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_HL_YN_NOANS_SPNM	병력고지혈증여부무응답구분명	28	VARCHAR(50)		명VC50	과거 고지혈증 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_HTN_YN_NOANS_SPCD	병력고혈압여부무응답구분코드	29	VARCHAR(20)		여부무응답구분코드	과거 고혈압 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_HTN_YN_NOANS_SPNM	병력고혈압여부무응답구분명	30	VARCHAR(50)		명VC50	과거 고혈압 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_DBT_YN_NOANS_SPCD	병력당뇨여부무응답구분코드	31	VARCHAR(20)		여부무응답구분코드	과거 당뇨 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_DBT_YN_NOANS_SPNM	병력당뇨여부무응답구분명	32	VARCHAR(50)		명VC50	과거 당뇨 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_TB_YN_NOANS_SPCD	병력결핵여부무응답구분코드	33	VARCHAR(20)		여부무응답구분코드	과거 결핵 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_TB_YN_NOANS_SPNM	병력결핵여부무응답구분명	34	VARCHAR(50)		명VC50	과거 결핵 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
BRCN_DIAG_STAG	DIAG_STAG_RCRD_SEQ	진단병기기록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
GSCN_PT_HLINF_TEST	MHIS_LVDS_YN_NOANS_SPCD	병력간질환여부무응답구분코드	35	VARCHAR(20)		여부무응답구분코드	과거 간질환 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_LVDS_YN_NOANS_SPNM	병력간질환여부무응답구분명	36	VARCHAR(50)		명VC50	과거 간질환 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_CNCR_YN_NOANS_SPCD	병력암여부무응답구분코드	37	VARCHAR(20)		여부무응답구분코드	과거 암 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_CNCR_YN_NOANS_SPNM	병력암여부무응답구분명	38	VARCHAR(50)		명VC50	과거 암 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_CNCR_KNCD	병력암종류코드	39	VARCHAR(20)		암종류코드	과거 암 존재 시 암종 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_CNCR_KNNM	병력암종류명	40	VARCHAR(200)		명VC200	과거 암 존재 시 암종 명	간  갑상선  골육종  구강  난소  뇌  담도  대장  신장  위  유방  자궁  전립선  췌장  폐  혈액  기타	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_DEPR_YN_NOANS_SPCD	병력우울증여부무응답구분코드	41	VARCHAR(20)		여부무응답구분코드	과거 우울증 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_DEPR_YN_NOANS_SPNM	병력우울증여부무응답구분명	42	VARCHAR(50)		명VC50	과거 우울증 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_INSM_YN_NOANS_SPCD	병력불면증여부무응답구분코드	43	VARCHAR(20)		여부무응답구분코드	과거 불면증 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_INSM_YN_NOANS_SPNM	병력불면증여부무응답구분명	44	VARCHAR(50)		명VC50	과거 불면증 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_CADS_YN_NOANS_SPCD	병력심장질환여부무응답구분코드	45	VARCHAR(20)		여부무응답구분코드	과거 심장질환 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MHIS_CADS_YN_NOANS_SPNM	병력심장질환여부무응답구분명	46	VARCHAR(50)		명VC50	과거 심장질환 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	ETC_MHIS_YN_NOANS_SPCD	기타병력여부무응답구분코드	47	VARCHAR(20)		여부무응답구분코드	과거 기타질환 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	ETC_MHIS_YN_NOANS_SPNM	기타병력여부무응답구분명	48	VARCHAR(50)		명VC50	과거 기타질환 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	ETC_MHIS_DISS_CONT	기타병력질환내용	49	VARCHAR(200)		내용VC200	과거 기타질환이 있을 경우 기타질환 내용	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MAIN_SYM_CONT	주증상내용	50	VARCHAR(200)		내용VC200	입원 시 주증상 상세내용	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MAIN_SYM_YN_NOANS_SPCD	주증상여부무응답구분코드	51	VARCHAR(20)		여부무응답구분코드	주증상 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	MAIN_SYM_YN_NOANS_SPNM	주증상여부무응답구분명	52	VARCHAR(50)		명VC50	주증상 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	OHAD_HSTR_YN_NOANS_SPCD	타병원진단후전원여부무응답구분코드	53	VARCHAR(20)		여부무응답구분코드	타병원 진단 후 전원 여부 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	OHAD_HSTR_YN_NOANS_SPNM	타병원진단후전원여부무응답구분명	54	VARCHAR(50)		명VC50	타병원 진단 후 전원 여부 명	예  아니오  무응답	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DSCH_STCD	퇴원상태코드	55	VARCHAR(20)		퇴원상태코드	퇴원 시 환자의 상태 코드	코드정의서 참고	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	DSCH_STNM	퇴원상태명	56	VARCHAR(200)		명VC200	퇴원 시 환자의 상태 명	가망없는퇴원  사망  악화  진단뿐  호전  호전안됨  기타	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
GSCN_PT_HLINF_TEST	CRTN_DT	생성일시	57	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N	\N	N	TEST01@naver.com	2023-06-12 13:32:55.708266	TEST01@naver.com	2023-06-12 13:32:55.708266
BRCN_PT_HLINF	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	ADM_YMD	입원일자	3	VARCHAR(8)	PK_3	일자VC8	입원연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	HLINF_SEQ	건강정보순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DSCH_YMD	퇴원일자	5	VARCHAR(8)		일자VC8	퇴원연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	CUR_DRNK_YN_NOANS_SPCD	현재음주여부무응답구분코드	6	VARCHAR(20)		여부무응답구분코드	현재 음주 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	CUR_DRNK_YN_NOANS_SPNM	현재음주여부무응답구분명	7	VARCHAR(50)		명VC50	현재 음주 여부	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DHIS_YN_NOANS_SPCD	음주력여부무응답구분코드	8	VARCHAR(20)		여부무응답구분코드	음주력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DHIS_YN_NOANS_SPNM	음주력여부무응답구분명	9	VARCHAR(50)		명VC50	음주력 여부	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DRNK_KNCD	음주종류코드	11	VARCHAR(20)		음주종류코드	음주 종류 코드	코드정의서 참고	N	\N	\N	10050	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DRNK_KNNM	음주종류명	12	VARCHAR(200)		명VC200	음주 종류 명 	막걸리  맥주  소주  양주  무응답  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DRNK_QTY	음주량	13	VARCHAR(100)		수VC100	평균 음주량 (단위  병회)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DRNK_NT	음주횟수	14	NUMERIC(3)		수N3	월평균 음주횟수 (단위  회월)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DRNK_DTRN_YCNT	음주기간년수	15	NUMERIC(3)		년수N3	총 음주기간 (단위  년)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	NDRK_STRT_YR	금주시작년도	16	VARCHAR(4)		년도VC4	금주시작시기	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	CUR_SMOK_YN_NOANS_SPCD	현재흡연여부무응답구분코드	17	VARCHAR(20)		여부무응답구분코드	현재 흡연 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	CUR_SMOK_YN_NOANS_SPNM	현재흡연여부무응답구분명	18	VARCHAR(50)		명VC50	현재 흡연 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	SHIS_YN_NOANS_SPCD	흡연력여부무응답구분코드	19	VARCHAR(20)		여부무응답구분코드	흡연력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	SHIS_YN_NOANS_SPNM	흡연력여부무응답구분명	20	VARCHAR(50)		명VC50	흡연력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	SMOK_STRT_AGE_VL	흡연시작연령값	21	NUMERIC(4)		값N4	흡연 시작연령 (단위  세)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	SMOK_QTY	흡연량	22	NUMERIC(3)		수N3	흡연량 (단위  갑일)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	SMOK_DTRN_YCNT	흡연기간년수	23	NUMERIC(3)		년수N3	흡연기간 (단위  년)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	NSMK_STRT_YR	금연시작년도	24	VARCHAR(4)		년도VC4	금연시작시기	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_YN_NOANS_SPCD	병력여부무응답구분코드	25	VARCHAR(20)		여부무응답구분코드	과거 병력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_YN_NOANS_SPNM	병력여부무응답구분명	26	VARCHAR(50)		명VC50	과거 병력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_HTN_YN_NOANS_SPCD	병력고혈압여부무응답구분코드	27	VARCHAR(20)		여부무응답구분코드	과거 고혈압 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_HTN_YN_NOANS_SPNM	병력고혈압여부무응답구분명	28	VARCHAR(50)		명VC50	과거 고혈압 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_DBT_YN_NOANS_SPCD	병력당뇨여부무응답구분코드	29	VARCHAR(20)		여부무응답구분코드	과거 당뇨 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_DBT_YN_NOANS_SPNM	병력당뇨여부무응답구분명	30	VARCHAR(50)		명VC50	과거 당뇨 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_TB_YN_NOANS_SPCD	병력결핵여부무응답구분코드	31	VARCHAR(20)		여부무응답구분코드	과거 결핵 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_TB_YN_NOANS_SPNM	병력결핵여부무응답구분명	32	VARCHAR(50)		명VC50	과거 결핵 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_LVDS_YN_NOANS_SPCD	병력간질환여부무응답구분코드	33	VARCHAR(20)		여부무응답구분코드	과거 간질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_LVDS_YN_NOANS_SPNM	병력간질환여부무응답구분명	34	VARCHAR(50)		명VC50	과거 간질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_HL_YN_NOANS_SPCD	병력고지혈증여부무응답구분코드	35	VARCHAR(20)		여부무응답구분코드	과거 고지혈증 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_HL_YN_NOANS_SPNM	병력고지혈증여부무응답구분명	36	VARCHAR(50)		명VC50	과거 고지혈증 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_CNCR_YN_NOANS_SPCD	병력암여부무응답구분코드	37	VARCHAR(20)		여부무응답구분코드	과거 암 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_CNCR_YN_NOANS_SPNM	병력암여부무응답구분명	38	VARCHAR(50)		명VC50	과거 암 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_CNCR_KNCD	병력암종류코드	39	VARCHAR(20)		암종류코드	과거 암 존재 시 암종 코드	코드정의서 참고	N	\N	\N	10030	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_CNCR_KNNM	병력암종류명	40	VARCHAR(200)		명VC200	과거 암 존재 시 암종 명	간  갑상선  골육종  구강  난소  뇌  담도  대장  신장  위  유방  자궁  전립선  췌장  폐  혈액  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_DEPR_YN_NOANS_SPCD	병력우울증여부무응답구분코드	41	VARCHAR(20)		여부무응답구분코드	과거 우울증 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_DEPR_YN_NOANS_SPNM	병력우울증여부무응답구분명	42	VARCHAR(50)		명VC50	과거 우울증 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_INSM_YN_NOANS_SPCD	병력불면증여부무응답구분코드	43	VARCHAR(20)		여부무응답구분코드	과거 불면증 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_INSM_YN_NOANS_SPNM	병력불면증여부무응답구분명	44	VARCHAR(50)		명VC50	과거 불면증 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_CADS_YN_NOANS_SPCD	병력심장질환여부무응답구분코드	45	VARCHAR(20)		여부무응답구분코드	과거 심장질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MHIS_CADS_YN_NOANS_SPNM	병력심장질환여부무응답구분명	46	VARCHAR(50)		명VC50	과거 심장질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	ETC_MHIS_YN_NOANS_SPCD	기타병력여부무응답구분코드	47	VARCHAR(20)		여부무응답구분코드	과거 기타질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	ETC_MHIS_YN_NOANS_SPNM	기타병력여부무응답구분명	48	VARCHAR(50)		명VC50	과거 기타질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	ETC_MHIS_DISS_CONT	기타병력질환내용	49	VARCHAR(200)		내용VC200	과거 기타질환이 있을 경우 기타질환 내용	예) COPD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MAIN_SYM_YN_NOANS_SPCD	주증상여부무응답구분코드	50	VARCHAR(20)		여부무응답구분코드	주증상 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MAIN_SYM_YN_NOANS_SPNM	주증상여부무응답구분명	51	VARCHAR(50)		명VC50	주증상 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	MAIN_SYM_CONT	주증상내용	52	VARCHAR(200)		내용VC200	입원 시 주증상 상세내용	Asymptomatic  palpable mass  Breast pain  Nipple retraction  Skin change  Nipple discharge  Axillary mass  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	OHAD_HSTR_YN_NOANS_SPCD	타병원진단후전원여부무응답구분코드	53	VARCHAR(20)		여부무응답구분코드	타병원 진단 후 전원 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	OHAD_HSTR_YN_NOANS_SPNM	타병원진단후전원여부무응답구분명	54	VARCHAR(50)		명VC50	타병원 진단 후 전원 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DSCH_STCD	퇴원상태코드	55	VARCHAR(20)		퇴원상태코드	퇴원 시 환자의 상태 코드	코드정의서 참고	N	\N	\N	10060	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	DSCH_STNM	퇴원상태명	56	VARCHAR(200)		명VC200	퇴원 시 환자의 상태 명	48시간이내 사망  48시간이후 사망  가망없는퇴원  악화  완쾌  자의퇴원  진단뿐  호전  호전안됨  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_HLINF	CRTN_DT	생성일시	57	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_RCRD_YMD	가족력기록일자	3	VARCHAR(8)	PK_3	일자VC8	가족력 기록연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_RCRD_SEQ	가족력기록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_YN_NOANS_SPCD	가족력여부무응답구분코드	5	VARCHAR(20)		여부무응답구분코드	가족의 병력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_YN_NOANS_SPNM	가족력여부무응답구분명	6	VARCHAR(50)		명VC50	가족의 병력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	PT_FM_RLCD	환자가족관계코드	7	VARCHAR(20)		환자가족관계코드	가족의 병력 존재 시 관계 코드	코드정의서 참고	N	\N	\N	10070	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	PT_FM_RLNM	환자가족관계명	8	VARCHAR(200)		명VC200	가족의 병력 존재 시 관계 명	아버지  어머니  자녀  형제자매  친척  무응답  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	PT_FMRL_ETC_CONT	환자가족관계기타내용	9	VARCHAR(200)		내용VC200	가족관계 기타일 경우 상세내용	예) 조카	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_HTN_YN_NOANS_SPCD	가족병력고혈압여부무응답구분코드	10	VARCHAR(20)		여부무응답구분코드	가족의 고혈압 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_HTN_YN_NOANS_SPNM	가족병력고혈압여부무응답구분명	11	VARCHAR(50)		명VC50	가족의 고혈압 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_DBT_YN_NOANS_SPCD	가족병력당뇨여부무응답구분코드	12	VARCHAR(20)		여부무응답구분코드	가족의 당뇨 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_DBT_YN_NOANS_SPNM	가족병력당뇨여부무응답구분명	13	VARCHAR(50)		명VC50	가족의 당뇨 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_TB_YN_NOANS_SPCD	가족력결핵여부무응답구분코드	14	VARCHAR(20)		여부무응답구분코드	가족의 결핵 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_TB_YN_NOANS_SPNM	가족력결핵여부무응답구분명	15	VARCHAR(50)		명VC50	가족의 결핵 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_LVDS_YN_NOANS_SPCD	가족병력간질환여부무응답구분코드	16	VARCHAR(20)		여부무응답구분코드	가족의 간질환 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_LVDS_YN_NOANS_SPNM	가족병력간질환여부무응답구분명	17	VARCHAR(50)		명VC50	가족의 간질환 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_CNCR_YN_NOANS_SPCD	가족병력암여부무응답구분코드	18	VARCHAR(20)		여부무응답구분코드	가족의 암 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_CNCR_YN_NOANS_SPNM	가족병력암여부무응답구분명	19	VARCHAR(50)		명VC50	가족의 암 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_CNCR_KNCD	가족력암종류코드	20	VARCHAR(20)		암종류코드	가족의 암 존재 시 암종 코드	코드정의서 참고	N	\N	\N	10030	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_CNCR_KNNM	가족력암종류명	21	VARCHAR(200)		명VC200	가족의 암 존재 시 암종 명	간  갑상선  골육종  구강  난소  뇌  담도  대장  신장  위  유방  자궁  전립선  췌장  폐  혈액  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHT_CNCR_KIND_ETC_CONT	가족력암종류기타내용	22	VARCHAR(200)		내용VC200	가족의 암종이 기타일 경우 기타내용	예) 구강암  후두암	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_ETC_YN_NOANS_SPCD	가족병력기타여부무응답구분코드	23	VARCHAR(20)		여부무응답구분코드	가족의 기타병력 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_ETC_YN_NOANS_SPNM	가족병력기타여부무응답구분명	24	VARCHAR(50)		명VC50	가족의 기타병력 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	FMHS_ETC_CONT	가족병력기타내용	25	VARCHAR(200)		내용VC200	가족의 기타병력 내용	예) COPD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_FMHT	CRTN_DT	생성일시	26	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	OBTR_RCRD_YMD	산과기록일자	3	VARCHAR(8)	PK_3	일자VC8	기록연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	OBTR_RCRD_SEQ	산과기록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MARG_YN_NOANS_SPCD	결혼여부무응답구분코드	5	VARCHAR(20)		여부무응답구분코드	결혼 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MARG_YN_NOANS_SPNM	결혼여부무응답구분명	6	VARCHAR(50)		명VC50	결혼 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MARG_DETL_CD	결혼상세코드	7	VARCHAR(20)		결혼상세코드	결혼 여부가 무응답이 아닐 경우 상세내용	코드정의서 참고	N	\N	\N	10020	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MARG_DETL_NM	결혼상세명	8	VARCHAR(200)		명VC200	결혼 여부가 무응답이 아닐 경우 상세내용	미혼  기혼  이혼  사별  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	HRPR_YN_NOANS_SPCD	HRT경험여부무응답구분코드	9	VARCHAR(20)		여부무응답구분코드	폐경 후 HRT(Hormone replacement therapy) 시행 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	HRPR_YN_NOANS_SPNM	HRT경험여부무응답구분명	10	VARCHAR(50)		명VC50	폐경 후 HRT(Hormone replacement therapy) 시행 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	HRT_IMPL_MCNT	HRT시행월수	11	NUMERIC(3)		월수N3	폐경 후 HRT(Hormone replacement therapy) 시행 Y 시 기간 (단위  개월)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MENA_AGE_VL	초경연령값	12	NUMERIC(4)		값N4	초경 시 만 나이 (단위  세)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	DELV_AGE_VL	출산연령값	13	NUMERIC(4)		값N4	첫 출산 시 만 나이 (단위  세)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	DELV_CHLD_CNT	출산자녀수	14	NUMERIC(3)		수N3	출산 자녀 수 (단위 명)	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	BFPR_YN_NOANS_SPCD	모유수유경험여부무응답구분코드	15	VARCHAR(20)		여부무응답구분코드	모유수유 경험 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	BFPR_YN_NOANS_SPNM	모유수유경험여부무응답구분명	16	VARCHAR(50)		명VC50	모유수유 경험 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	BRFD_MCNT	모유수유월수	17	NUMERIC(3)		월수N3	모유수유 경험 Y 시 기간 (단위  개월)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	OC_USE_YN_NOANS_SPCD	경구피임약사용여부무응답구분코드	18	VARCHAR(20)		여부무응답구분코드	경구피임약 사용 경험 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	OC_USE_YN_NOANS_SPNM	경구피임약사용여부무응답구분명	19	VARCHAR(50)		명VC50	경구피임약 사용 경험 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	OC_USE_MCNT	경구피임약사용월수	20	NUMERIC(3)		월수N3	경구피임약 사용 Y 시 기간 (단위  개월)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MENO_YN_NOANS_SPCD	폐경여부무응답구분코드	21	VARCHAR(20)		여부무응답구분코드	폐경 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MENO_YN_NOANS_SPNM	폐경여부무응답구분명	22	VARCHAR(50)		명VC50	폐경 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	MENO_AGE_VL	폐경연령값	23	NUMERIC(4)		값N4	폐경 시 만나이 (단위 세)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	UTEC_YN_NOANS_SPCD	자궁적출술여부무응답구분코드	24	VARCHAR(20)		여부무응답구분코드	자궁적출술 여부 코드	코드정의서 참고	N	\N	\N	10040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	UTEC_YN_NOANS_SPNM	자궁적출술여부무응답구분명	25	VARCHAR(50)		명VC50	자궁적출술 여부 명	예  아니오  무응답	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_PT_OBINF	CRTN_DT	생성일시	26	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	ANTH_RCRD_YMD	신체계측기록일자	3	VARCHAR(8)	PK_3	일자VC8	신체계측정보 기록연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	ANTH_RCRD_SEQ	신체계측기록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	HT_MSRM_VL	신장측정값	5	NUMERIC(5,1)		값N5,1	신장값 소수점 1자리까지 표기 (단위  cm)	999.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	WT_MSRM_VL	체중측정값	6	NUMERIC(5,1)		값N5,1	체중값 소수점 1자리까지 표기 (단위  kg)	999.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	BMI_VL	BMI값	7	NUMERIC(5,2)		값N5,2	신체질량지수로 환자의 신장과 체중의 비율을 사용해 계산한 지수 \n 소수점 1자리까지 표기 (체중(신장)²)	99.99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	RLXT_BLPR_VL	이완혈압값	8	VARCHAR(10)		값VC10	이완기 혈압값 (단위 mmHg)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	CTRT_BLPR_VL	수축혈압값	9	NUMERIC(5)		값N5	수축기 혈압값 (단위 mmHg)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	ECOG_CD	ECOG코드	10	VARCHAR(20)		ECOG코드	암 환자의 기능 상태 지수 코드(5가지의 점수로 환자의 기능 상태 표현)	코드정의서 참고	N	\N	\N	20010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	ECOG_NM	ECOG명	11	VARCHAR(200)		명VC200	암 환자의 기능 상태 지수 명(5가지의 점수로 환자의 기능 상태 표현)	제한없이 정상적이다  \n증상이 있으나 스스로 활동 가능하다 \n증상이 있으나 누워 지내는 시간은 하루의 반보다 적다  \n증상이 있으며 누워 지내는 시간이 하루의 절반이상이다  \n계속 누워 있어야 한다 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_ANINF	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_RGST_YMD	진단등록일자	3	VARCHAR(8)	PK_3	일자VC8	진단정보 등록연월일(EMR 진단등록화면)	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_RGST_SEQ	진단등록순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	BRCN_DIAG_KNCD	유방암진단종류코드	5	VARCHAR(20)		유방암진단종류코드	진단명의 구분 코드\n유방암 모집단관련 KCD 코드 분류 (C50 D05 기타암 및 기타질환)	코드정의서 참고	N	\N	\N	20100	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	BRCN_DIAG_KNNM	유방암진단종류명	6	VARCHAR(200)		명VC200	진단명의 구분 명\n유방암 모집단관련 KCD 코드 분류 (C50 D05 기타암 및 기타질환)	유방암(C50)  상피내암 (D05)  기타암  기타질환	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_CD	진단코드	7	VARCHAR(20)		진단코드	원내에서 사용하는 진단코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_NM	진단명	8	VARCHAR(200)		명VC200	원내에서 사용하는 진단용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_KCD_CD	진단KCD코드	9	VARCHAR(20)		KCD코드	환자가 진단받은 KCD 코드	예) C50.00	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_KCD_NM	진단KCD명	10	VARCHAR(200)		명VC200	환자가 진단받은 KCD 명 (영문)	예) Malignant neoplasm of nipple and areola right	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_SMCT_CD	진단SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	환자가 진단받은 용어에 대한 국제 표준용어코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 254837009 \n예2) 188147009_363698007_80248007	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	DIAG_SMCT_NM	진단SNOMEDCT명	12	VARCHAR(1000)		명VC1000	환자가 진단받은 용어에 대한 국제 표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1)  Malignant neoplasm of breast\n예2) Malignant neoplasm of nipple and areola of female breast_Finding site_Left breast structure	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_INF	CRTN_DT	생성일시	13	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTDG_YMD	전이진단일자	3	VARCHAR(8)	PK_3	일자VC8	암 전이 진단연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTDG_SEQ	전이진단순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTST_SITE_CD	전이부위코드	5	VARCHAR(20)		전이부위코드	전이암 부위 코드	코드정의서 참고	N	\N	\N	20060	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTST_SITE_NM	전이부위명	6	VARCHAR(200)		명VC200	전이암 부위 명	Bone  Brain  Breast(non-OP site)  Breast(OP site)  Liver  LN  Lung  기타  	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTST_ASPT_CD	전이양상코드	7	VARCHAR(20)		전이양상코드	전이암 양상 코드	코드정의서 참고	N	\N	\N	20070	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTST_ASPT_NM	전이양상명	8	VARCHAR(200)		명VC200	전이암 양상 명	single lesion  multiple lesion - synchronous  multiple lesion - metachronous  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTDG_MTCD	전이진단방법코드	9	VARCHAR(20)		전이진단방법코드	암 전이 진단 시 진단방법 코드	코드정의서 참고	N	\N	\N	20080	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTDG_MTNM	전이진단방법명	10	VARCHAR(200)		명VC200	암 전이 진단 시 진단방법 명	영상검사  조직검사  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	MTST_TRTM_CONT	전이치료내용	11	VARCHAR(5)		내용VC5	전이암 치료 요법  동시항암화학방사선요법 수술 화학요법 방사선요법 기타  순으로 시행한 치료는 00000에 1로 표시	예) 수술 시행  01000	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_MTST	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	DIAG_STAG_RCRD_YMD	진단병기기록일자	3	VARCHAR(8)	PK_3	일자VC8	진단 병기 정보 기록연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	CLNC_TUMR_PRTY_CD	임상종양특성코드	5	VARCHAR(20)		임상종양특성코드	임상 종양특성 코드	코드정의서 참고	N	\N	\N	20050	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	CLNC_TUMR_PRTY_NM	임상종양특성명	6	VARCHAR(200)		명VC200	임상 종양특성 명	Primary  Recurrence  Meta  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	AJCC_YR	AJCC년도	7	VARCHAR(4)		년도VC4	AJCC 기준년도	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	CLNC_TNM_STAG_VL	임상TNM병기값	8	VARCHAR(10)		값VC10	임상 TNM 병기값 	예) T1N0M0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	CLNC_T_STAG_VL	임상T병기값	9	VARCHAR(10)		값VC10	임상 T 병기값	T0  T1  T1a  T1b  T1c  T1mi  T2  T3  T4  T4a  T4b  T4d  Tis  TX	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	CLNC_N_STAG_VL	임상N병기값	10	VARCHAR(10)		값VC10	임상 N 병기값	N0  N1  N2  N2a  N2b  N3  N3a  N3b  N3c  NX	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	CLNC_M_STAG_VL	임상M병기값	11	VARCHAR(10)		값VC10	임상 M 병기값	M0  M1  MX	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_STAG	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_YMD	진단검사일자	3	VARCHAR(8)	PK_3	일자VC8	진단검사 검사연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_SEQ	진단검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_KNCD	진단검사종류코드	5	VARCHAR(20)		진단검사종류코드	진단검사 종류 코드	코드정의서 참고	N	\N	\N	30580	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_KNNM	진단검사종류명	6	VARCHAR(200)		명VC200	진단검사 종류 명	Albumin  Alkaline Phosphatase  ALT   ANC  Basophil  CA 15-3  CA-125  CA19-9  Calcium  CEA  Creatinine  CRP  E2  Eosinophil  FSH  Glucose  Hematocrit  Hemoglobin  Lymphocyte  Monocyte  Neutrophil  Platelets  RBC   WBC  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_CD	진단검사코드	7	VARCHAR(20)		진단검사코드	진단검사 정보 수집 시 병원에서 사용하는 진단검사 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_NM	진단검사명	8	VARCHAR(200)		명VC200	진단검사 정보 수집 시 병원에서 사용하는 진단검사 LOCAL 용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_EDI_CD	진단검사EDI코드	9	VARCHAR(20)		진단검사EDI코드	원내 진단검사 코드에 매핑되는 EDI 코드	예) D0002	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_EDI_NM	진단검사EDI명	10	VARCHAR(200)		명VC200	원내 진단검사 코드에 매핑되는 EDI 명	예) 일반혈액검사(CBC)-혈구세포-장비측정	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_SMCT_CD	진단검사SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	원내 진단검사 용어에 매핑되는 국제표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 767002\n예2) 269926009_260870009_25876001	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_SMCT_NM	진단검사SNOMEDCT명	12	VARCHAR(1000)		명VC1000	원내 진단검사 용어에 매핑되는 국제표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) White blood cell count\n예2) Fluid sample glucose measurement_Priority_Emergency	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_LOINC_CD	진단검사LOINC코드	13	VARCHAR(20)		LOINC코드	원내 진단검사 코드에 매핑되는 LOINC 코드	예) 6690-2	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_LOINC_NM	진단검사LOINC명	14	VARCHAR(1000)		명VC1000	원내 진단검사 코드에 매핑되는 LOINC 명	예) Leukocytes volume in Blood by Automated count	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_RSLT_CONT	진단검사결과내용	15	VARCHAR(4000)		내용VC4000	진단검사 결과 내용	예) 진단검사 결과 표현에 따라 정수값 positivenegative ()(-) 등을 포함	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_RSLT_UNIT_CONT	진단검사결과단위내용	16	VARCHAR(200)		내용VC200	검사결과 수치에서 사용하는 단위	예) gdL	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CEXM_NLRG_REF_VL	진단검사정상범위참고값	17	VARCHAR(200)		값VC200	진단검사 결과 내용의 유효범위 참고치	예) 1216gdL	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_DIAG	CRTN_DT	생성일시	18	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_YMD	영상검사일자	3	VARCHAR(8)	PK_3	일자VC8	영상검사 검사연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_SEQ	영상검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_KNCD	영상검사종류코드	5	VARCHAR(20)		영상검사종류코드	영상검사 종류 코드	코드정의서 참고	N	\N	\N	30410	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_KNNM	영상검사종류명	6	VARCHAR(200)		명VC200	영상검사 종류 명	Bone scan  CT  DBT  Dexa  MMG  MRI  PET  PET-CT  SONO  X-ray  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_CD	영상검사코드	7	VARCHAR(20)		영상검사코드	영상검사 정보 수집 시 병원에서 사용하는 영상검사 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_NM	영상검사명	8	VARCHAR(200)		명VC200	영상검사 정보 수집 시 병원에서 사용하는 영상검사 LOCAL 용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_EDI_CD	영상검사EDI코드	9	VARCHAR(20)		영상검사EDI코드	영상검사 정보 수집 시 병원에서 사용하는 영상검사 EDI 코드	예) EB402	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_EDI_NM	영상검사EDI명	10	VARCHAR(200)		명VC200	영상검사 정보 수집 시 병원에서 사용하는 영상검사 EDI 명	예) 단순초음파(Ⅱ)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_SMCT_CD	영상검사SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	원내 영상검사 용어에 매핑되는 국제표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 572701000119102\n예2) 47079000_405813007_279005008	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_SMCT_NM	영상검사SNOMEDCT명	12	VARCHAR(1000)		명VC1000	원내 영상검사 용어에 매핑되는 국제표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Mammography of left breast\n예2) Ultrasonography of breast_Procedure site - Direct_Structure of region of breast 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_RSLT_CONT	영상검사결과내용	13	VARCHAR(4000)		내용VC4000	영상검사 결과 내용	Free text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	BRST_DENS_CLCD	유방밀도분류코드	14	VARCHAR(20)		유방밀도분류코드	Mammography 결과에서 breast density 코드	코드정의서 참고	N	\N	\N	30490	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	BRST_DENS_CLNM	유방밀도분류명	15	VARCHAR(200)		명VC200	Mammography 결과에서 breast density 명	Extremely dense   Fatty breast  Heterogeneously dense  Scattered fibroglandular  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_RSLT_DIAG_CLCD	영상검사결과진단분류코드	16	VARCHAR(20)		영상검사결과진단적분류코드	영상검사 결과 진단적 분류 (diagnostic classification) 코드	코드정의서 참고	N	\N	\N	30400	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	IMEX_RSLT_DIAG_CLNM	영상검사결과진단분류명	17	VARCHAR(200)		명VC200	영상검사 결과 진단적 분류 (diagnostic classification) 명	negative  benign  probably benign \nsuspicous  highly suggestive  proven malignancy  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	MICF_YN_UNID_SPCD	미세석회화여부확인불가구분코드	18	VARCHAR(20)		여부확인불가구분코드	Mammography 결과에서 microcalcification 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	MICF_YN_UNID_SPNM	미세석회화여부확인불가구분명	19	VARCHAR(50)		명VC50	Mammography 결과에서 microcalcification 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	ASYT_YN_UNID_SPCD	비대칭여부확인불가구분코드	20	VARCHAR(20)		여부확인불가구분코드	Mammography 결과에서 asymmetry 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	ASYT_YN_UNID_SPNM	비대칭여부확인불가구분명	21	VARCHAR(50)		명VC50	Mammography 결과에서 asymmetry 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	BOMS_YN_UNID_SPCD	전신전이여부확인불가구분코드	22	VARCHAR(20)		여부확인불가구분코드	영상검사 판독 결과 전신 전이 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	BOMS_YN_UNID_SPNM	전신전이여부확인불가구분명	23	VARCHAR(50)		명VC50	영상검사 판독 결과 전신 전이 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMAG	CRTN_DT	생성일시	24	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_YMD	생체검사일자	3	VARCHAR(8)	PK_3	일자VC8	생체검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_SEQ	생체검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_READ_YMD	생체검사판독일자	5	VARCHAR(8)		일자VC8	생체검사 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_SITE_CD	생체검사부위코드	6	VARCHAR(20)		생체검사부위코드	생체검사를 실시한 부위 코드	코드정의서 참고	N	\N	\N	30310	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_SITE_NM	생체검사부위명	7	VARCHAR(200)		명VC200	생체검사를 실시한 부위 명	Brain  Breast  Chest  Liver  LN  Lung  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_SITE_LATR_CD	생체검사부위편측성코드	8	VARCHAR(20)		생체검사부위편측성코드	생체검사를 실시한 부위의 편측성 코드	코드정의서 참고	N	\N	\N	30320	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_SITE_LATR_NM	생체검사부위편측성명	9	VARCHAR(200)		명VC200	생체검사를 실시한 부위의 편측성 명	Left  Right  Bilateral  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_MTCD	생체검사방법코드	10	VARCHAR(20)		생체검사방법코드	원내에서 사용하는 생체검사 방법 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_MTNM	생체검사방법명	11	VARCHAR(200)		명VC200	원내에서 사용하는 생체검사 방법 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_MTHD_KNCD	생체검사방법종류코드	12	VARCHAR(20)		생체검사방법종류코드	생체검사를 시행한 방법 종류 코드	코드정의서 참고	N	\N	\N	30290	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_MTHD_KNNM	생체검사방법종류명	13	VARCHAR(200)		명VC200	생체검사를 시행한 방법 종류 명	Biopsy  Computed tomography and biopsy  Gun biopsy  Laparoscopic biopsy  Needle biopsy  Percutaneous liver biopsy  Surgical biopsy  Transjugular biopsy  Transjugular biopsy using fluoroscopic guidance  Ultrasound scan and biopsy  Vacuum Assisted Breast Biopsy(MMT)  Wedge biopsy  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	BPSY_RSLT_CONT	생체검사결과내용	14	VARCHAR(2000)		내용VC2000	생체검사에 따른 전체 결과내용	Free text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	HTLG_DIAG_CD	조직학적진단코드	15	VARCHAR(20)		조직학적진단코드	생체검사에 따른 조직학적 진단 코드	코드정의서 참고	N	\N	\N	30540	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	CRTN_DT	생성일시	17	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	HTLG_DIAG_NM	조직학적진단명	16	VARCHAR(200)		명VC200	생체검사에 따른 조직학적 진단 명	DCIS  Ductal carcinoma in situ  ILC Invasive lobular carcinoma  Invasive ductal carcinoma IDC micro IDC  LCIS  Lobular carcinoma in situ  Lymphoma  Malignant Phyllodes tumor  Medullary carcinoma  Metaplastic carcinoma  Mucinous carcinoma  Pagets disease  Papillary carcinoma  Sarcoma  Tubular carcinoma  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	HTLG_GRCD	조직학적등급코드	17	VARCHAR(20)		조직학적등급코드	생체검사에 따른 조직학적 등급 (Histologic grade) 코드	코드정의서 참고	N	\N	\N	30520	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	HTLG_GRNM	조직학적등급명	18	VARCHAR(200)		명VC200	생체검사에 따른 조직학적 등급 (Histologic grade) 명	Gx  G1 G2  G3 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_BYPS	CRTN_DT	생성일시	19	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_YMD	면역병리검사일자	3	VARCHAR(8)	PK_3	일자VC8	면역병리 검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_SEQ	면역병리검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMPT_READ_YMD	면역병리판독일자	5	VARCHAR(8)		일자VC8	면역병리 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_KNCD	면역병리검사종류코드	6	VARCHAR(20)		면역병리검사종류코드	면역병리 검사 종류코드	코드정의서 참고	N	\N	\N	30170	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_KNNM	면역병리검사종류명	7	VARCHAR(200)		명VC200	면역병리 검사 종류명	AR  CK56  EGFR  ER  HER2  Ki67  PR  TIL  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_NM	면역병리검사명	8	VARCHAR(200)		명VC200	원내에서 사용하는 면역병리 검사 명	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_CD	면역병리검사코드	9	VARCHAR(20)		면역병리검사코드	원내에서 사용하는 면역병리 검사 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_OPN_CLCD	면역병리검사소견분류코드	10	VARCHAR(20)		면역병리검사소견코드	면역병리검사소견코드	코드정의서 참고	N	\N	\N	30160	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_OPN_CLNM	면역병리검사소견분류명	11	VARCHAR(200)		명VC200	면역병리 검사소견 분류명	Positive  Negative  Equivocal  Not evaluable 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_RSLT_VL	면역병리검사결과값	12	NUMERIC(5,2)		값N5,2	면역병리 검사결과 값	99.99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_RSLT_UNIT_CD	면역병리검사결과단위코드	13	VARCHAR(20)		면역병리검사결과단위코드	면역병리 검사결과 값 단위	Score  	N	\N	\N	30140	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	IMEM_RSLT_UNIT_NM	면역병리검사결과단위명	14	VARCHAR(200)		명VC200	면역병리 검사결과 값 단위	Score  	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_IMPT	CRTN_DT	생성일시	15	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_YMD	분자병리검사일자	3	VARCHAR(8)	PK_3	일자VC8	분자병리 검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_SEQ	분자병리검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLPT_READ_YMD	분자병리판독일자	5	VARCHAR(8)		일자VC8	분자병리 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_CD	분자병리검사코드	6	VARCHAR(20)		분자병리검사코드	원내에서 사용하는 분자병리 검사코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_NM	분자병리검사명	7	VARCHAR(200)		명VC200	원내에서 사용하는 분자병리 검사명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_KNCD	분자병리검사종류코드	8	VARCHAR(20)		분자병리검사종류코드	분자병리 검사코드	코드정의서 참고	N	\N	\N	30230	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_KNNM	분자병리검사종류명	9	VARCHAR(200)		명VC200	분자병리 검사명	HER2  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_MTCD	분자병리검사방법코드	10	VARCHAR(20)		분자병리검사방법코드	분자병리 검사방법 코드	코드정의서 참고	N	\N	\N	30210	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_MTNM	분자병리검사방법명	11	VARCHAR(200)		명VC200	분자병리 검사방법 명	SISH  FISH	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_RSLT_CD	분자병리검사결과코드	12	VARCHAR(20)		분자병리검사결과코드	분지병리 검사결과 코드	코드정의서 참고	N	\N	\N	30200	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_RSLT_NM	분자병리검사결과명	13	VARCHAR(200)		명VC200	분지병리 검사결과 명	Positive  Negative  Equivocal  Not evaluable 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_RSLT_KNCD	분자병리검사결과종류코드	14	VARCHAR(20)		분자병리검사결과종류코드	분자병리 검사에 따른 검사 결과 구분 코드	코드정의서 참고	N	\N	\N	30190	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_RSLT_KNNM	분자병리검사결과종류명	15	VARCHAR(200)		명VC200	분자병리 검사에 따른 검사 결과 구분 명	검사한 종양 세포의 핵 개수  핵당 HER2 평균수  핵당 CEP17 평균수  HER2CEP17 비율  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_MLPT	MLEM_RSLT_VL	분자병리검사결과값	16	NUMERIC(5,2)		값N5,2	분자병리 검사결과 구분에 따른 결과 값\n소수점 2자리까지 표현	99.99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_YMD	생식세포변이검사일자	3	VARCHAR(8)	PK_3	일자VC8	생식세포 변이검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_SEQ	생식세포변이검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_CD	생식세포변이검사코드	5	VARCHAR(20)		생식세포변이검사코드	원내에서 사용하는 생식세포 변이검사 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_NM	생식세포변이검사명	6	VARCHAR(200)		명VC200	원내에서 사용하는 생식세포 변이검사 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_MTCD	생식세포변이검사방법코드	7	VARCHAR(20)		생식세포변이검사방법코드	생식세포 변이검사를 시행한 방법 코드	코드정의서 참고	N	\N	\N	30260	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_MTNM	생식세포변이검사방법명	8	VARCHAR(200)		명VC200	생식세포 변이검사를 시행한 방법 명	Sanger sequencing I NGS I 기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_GENE_KNCD	생식세포변이검사유전자종류코드	9	VARCHAR(20)		생식세포변이검사유전자종류코드	생식세포 변이검사를 시행한 유전자 종류 코드	코드정의서 참고	N	\N	\N	30270	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMVX_GENE_KNNM	생식세포변이검사유전자종류명	10	VARCHAR(200)		명VC200	생식세포 변이검사를 시행한 유전자 종류 명	BRCA1 I BRCA2 I 기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	GMTE_MTST_EXAM_RSLT_CONT	생식세포전이검사결과내용	11	VARCHAR(4000)		내용VC4000	생식세포 변이검사 결과 내용	Free text	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	PAVR_DETECT_YN_SPCD	병원변형체감지여부구분코드	12	VARCHAR(20)		감지여부구분코드	Pathogenic variant 여부 코드	코드정의서 참고	N	\N	\N	30120	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	PAVR_DETECT_YN_SPNM	병원변형체감지여부구분명	13	VARCHAR(50)		명VC50	Pathogenic variant 여부 명	Detected  Not detected  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	UNCL_VARNT_DETECT_YN_SPCD	미확인변형체감지여부구분코드	14	VARCHAR(20)		감지여부구분코드	Unclassified variation 여부 코드	코드정의서 참고	N	\N	\N	30120	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	UNCL_VARNT_DETECT_YN_SPNM	미확인변형체감지여부구분명	15	VARCHAR(50)		명VC50	Unclassified variation 여부 명	Detected  Not detected  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	DNA_VAINF_A_VL	DNA변이정보A값	16	NUMERIC(5)		값N5	DNA 변이정보_A	9999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	DNA_VAINF_B_CD	DNA변이정보B코드	17	VARCHAR(20)		DNA변이정보B코드	DNA 변이정보_B 코드	코드정의서 참고	N	\N	\N	30010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	DNA_VAINF_B_NM	DNA변이정보B명	18	VARCHAR(200)		명VC200	DNA 변이정보_B 명	A  G  C T	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	DNA_VAINF_C_CD	DNA변이정보C코드	19	VARCHAR(20)		DNA변이정보C코드	DNA 변이정보_C 코드	코드정의서 참고	N	\N	\N	30020	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	DNA_VAINF_C_NM	DNA변이정보C명	20	VARCHAR(200)		명VC200	DNA 변이정보_C 명	A  G  C  T  Ins  Del  Dup  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	AMSN_VAINF_A_CD	아미노산변이정보A코드	21	VARCHAR(20)		아미노산변이정보A코드	아미노산 변이정보_A 코드	코드정의서 참고	N	\N	\N	30350	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	AMSN_VAINF_A_NM	아미노산변이정보A명	22	VARCHAR(200)		명VC200	아미노산 변이정보_A 명	Ala(A)  Arg(R)  Asn(N)  Asp(D)  Cys(C)  Gln(Q)  Glu(E)  Gly(G)  His(H)  Ile(I)  Leu(L)  Lys(K)  Met(M)  Phe(F)  Pro(P)  Ser(S)  Thr(T)  Trp(W)  Tyr(Y)  Val(V)  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	AMSN_VAINF_B_VL	아미노산변이정보B값	23	NUMERIC(5)		값N5	아미노산 변이정보_B	9999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	AMSN_VAINF_C_CD	아미노산변이정보C코드	24	VARCHAR(20)		아미노산변이정보C코드	아미노산 변이정보_C 코드	코드정의서 참고	N	\N	\N	30360	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	AMSN_VAINF_C_NM	아미노산변이정보C명	25	VARCHAR(200)		명VC200	아미노산 변이정보_C 명	Ala(A)  Arg(R)  Asn(N)  Asp(D)  Cys(C)  del  dup  fs(Frame shift)  Gln(Q)  Glu(E)  Gly(G)  His(H)  Ile(I)  ins  Leu(L)  Lys(K)  Met(M)  Phe(F)  Pro(P)  Ser(S)  Thr(T)  Trp(W)  Tyr(Y)  Val(V)  (TerStop)  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	REF_SEQ	참고순번	26	NUMERIC(3)		일련번호N3	Reference sequence	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GMVX	CRTN_DT	생성일시	27	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	GNRX_YMD	유전자발현검사일자	3	VARCHAR(8)	PK_3	일자VC8	예후예측 유전자 발현검사를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	GNRX_SEQ	유전자발현검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	GNRX_KNCD	유전자발현검사종류코드	5	VARCHAR(20)		유전자발현검사종류코드	예후예측 유전자 발현검사를 시행한 종류 코드	코드정의서 참고	N	\N	\N	30510	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	GNRX_KNNM	유전자발현검사종류명	6	VARCHAR(200)		명VC200	예후예측 유전자 발현검사를 시행한 종류 명	BCI  Endopredict  GenesWell BCT  Mammaprint  Oncofree  Oncotype Dx  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	GNRX_RSLT_KNCD	유전자발현검사결과종류코드	7	VARCHAR(20)		유전자발현검사결과종류코드	예후예측 유전자 발현검사 시행결과 구분 코드	코드정의서 참고	N	\N	\N	30500	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	GNRX_RSLT_KNNM	유전자발현검사결과종류명	8	VARCHAR(200)		명VC200	예후예측 유전자 발현검사 시행결과 구분 명	EPclin score  Mammaprint Index  Oncotype Recurrence Score (RS)  Risk Assessment  Risk-of-Recurrence Result	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	GNRX_RSLT_CONT	유전자발현검사결과내용	9	VARCHAR(100)		내용VC100	예후예측 유전자 발현검사 시행결과 구분에 따른 결과 값	- EPclin score\n숫자 (예 999.9)\n- Risk Assessment\nLow  High  기타\n- Mammaprint Index\n숫자 (예 999.9)\n- Risk-of-Recurrence Result\nLow  High  기타\n- Oncotype Recurrence Score (RS)\n숫자 (예 999.9)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_GNRX	CRTN_DT	생성일시	10	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_YMD	수술일자	3	VARCHAR(8)	PK_3	일자VC8	수술을 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_SEQ	수술순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_KNCD	수술종류코드	5	VARCHAR(20)		수술종류코드	수술 종류 코드	코드정의서 참고	N	\N	\N	40310	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_KNNM	수술종류명	6	VARCHAR(200)		명VC200	수술 종류 명	Augmentation Mammoplasty  Axillary Sentinel Lymph Node Excision  Breast conserving surgery  Breast Reconstruction  Dissection of  Axillary Lymph Node  Excision or destruction of breast tissue  Immediate Implant Insertion Following Mastectomy  Local excision of lesion of breast  Lumpectomy  Mastectomy With Axillary LN Dissection  Mastectomy Without Axillary LN Dissection  Modified radical mastectomy  Musculocutaneous Flap  Other Mammoplasty  Partial Mastectomy  Reduction Mammoplasty  Resection of quadrant of breast  Revision of implant of breast  Simple Mastectomy  Skin sparing mastectomy  Subcutaneous Mastectomy  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_CD	수술코드	7	VARCHAR(20)		수술코드	병원에서 사용하는 수술 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_NM	수술명	8	VARCHAR(200)		명VC200	병원에서 사용하는 수술 LOCAL 용어	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_EDI_CD	수술EDI코드	9	VARCHAR(20)		수술EDI코드	수술 EDI 코드	예) N7131	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_EDI_NM	수술EDI명	10	VARCHAR(200)		명VC200	수술 EDI 명	예) 유방절제술-단순전절제	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_SMCT_CD	수술SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	원내 수술 용어에 매핑되는 국제표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 172043006\n예2) 33496007_363702006_254837009	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_SMCT_NM	수술SNOMEDCT명	12	VARCHAR(1000)		명VC1000	원내 수술 용어에 매핑되는 국제표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Simple mastectomy\n예2) Reconstruction of breast_Has focus_Malignant neoplasm of breast 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_ICD9CM_CD	수술ICD9CM코드	13	VARCHAR(20)		수술ICD9CM코드	수술 ICD-9-CM 코드	예) 85.7	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_ICD9CM_NM	수술ICD9CM명	14	VARCHAR(1000)		명VC1000	수술 ICD-9-CM 명	예) Total reconstruction of breast	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_ANST_SITE_CD	수술마취부위코드	15	VARCHAR(20)		수술마취부위코드	수술 시 마취 부위 코드	코드정의서 참고	N	\N	\N	40240	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_ANST_SITE_NM	수술마취부위명	16	VARCHAR(200)		명VC200	수술 시 마취 부위 명	MAC  경막외  국소  신경차단  전신  정맥  척추  척추경막외  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	EBL_QTY	추정실혈량	17	NUMERIC(5)		수N5	수술 시 추정실혈량(Estimated blood loss) (단위 mL)	9999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_LDTM	수술소요시간	18	VARCHAR(20)		시간VC20	수술소요시간(수술종료시간-수술시작시간)	HHMMSS	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_PRPS_CD	수술목적코드	19	VARCHAR(20)		수술목적코드	수술목적 코드	코드정의서 참고	N	\N	\N	40250	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_PRPS_NM	수술목적명	20	VARCHAR(200)		명VC200	수술목적 명	Curative  Palliative  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_SITE_CD	수술부위코드	21	VARCHAR(20)		수술부위코드	수술 부위명	코드정의서 참고	N	\N	\N	40270	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_SITE_NM	수술부위명	22	VARCHAR(200)		명VC200	수술 부위명	Breast  LN  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	BRCN_OPRT_MTCD	유방암수술방법코드	23	VARCHAR(20)		유방암수술방법코드	유방암 수술방법 코드	코드정의서 참고	N	\N	\N	40450	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	BRCN_OPRT_MTNM	유방암수술방법명	24	VARCHAR(200)		명VC200	유방암 수술방법 명	Open  Endoscopic  Robotic  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	ASA_SCOR_CD	ASA점수코드	25	VARCHAR(20)		ASA점수코드	마취 전 환자 평가 코드 (Class 16까지 표현)	코드정의서 참고	N	\N	\N	40010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	ASA_SCOR_NM	ASA점수명	26	VARCHAR(200)		명VC200	마취 전 환자 평가 명 (Class 16까지 표현)	정상의 건강한 환자  경도의 전신 질환을 가진 환자  중등도의 중증 전신질환을 가진 환자  지속적으로 생명을 위협하는 중증의 전신질환을 가진 환자  수술하지 않으면 생명을 유지할 수 없는 정도의 중증질환을 가진 환자  장기 공여를 위한 수술 예정인 뇌사자	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_INCS_MTHD_CONT	수술절개방법내용	27	VARCHAR(200)		내용VC200	수술 시 절개방법 (free text)	예) Upper midline\n     Separate skin incision in axilla \n     circum areolar incision for skin sparing \n     oblique transverse elliptical incision \n     radial incison\n     transverse incision over the tumor	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_ICLN_TPCD	수술절개선유형코드	28	VARCHAR(20)		수술절개선유형코드	수술 시 절개선 유형 코드	코드정의서 참고	N	\N	\N	40300	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_ICLN_TPNM	수술절개선유형명	29	VARCHAR(200)		명VC200	수술 시 절개선 유형 명	Curved linear  Elliptical  Inframammary  Periareolar  Radial  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_TUMR_LOCA_CD	수술종양위치코드	30	VARCHAR(20)		생체검사부위편측성코드	수술 시 확인한 종양 위치 코드	코드정의서 참고	N	\N	\N	30320	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_TUMR_LOCA_NM	수술종양위치명	31	VARCHAR(200)		명VC200	수술 시 확인한 종양 위치 명	Left  Right  Bilateral  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_TUMR_DETL_LOCA_CD	수술종양상세위치코드	32	VARCHAR(20)		수술종양상세위치코드	수술 시 확인한 종양의 상세위치 코드	코드정의서 참고	N	\N	\N	40320	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	OPRT_TUMR_DETL_LOCA_NM	수술종양상세위치명	33	VARCHAR(200)		명VC200	수술 시 확인한 종양의 상세위치 명	Central  Lower inner  Lower outer  Upper inner  Upper outer  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	REPR_CLCD	재건술분류코드	34	VARCHAR(20)		재건성형술분류코드	재건성형술 분류 코드	코드정의서 참고	N	\N	\N	40470	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	REPR_CLNM	재건술분류명	35	VARCHAR(200)		명VC200	재건성형술 분류 명	Immediate reconstruction  Delayed reconstruction  Oncoplastic  Not applicable  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	REPR_MTCD	재건술방법코드	36	VARCHAR(20)		재건술방법코드	재건술 방법 코드	코드정의서 참고	N	\N	\N	40460	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	REPR_MTNM	재건술방법명	37	VARCHAR(200)		명VC200	재건술 방법 명	Advanced glandular  Direct to implant  LD flap  Tissue expander  TRAMDIEP  Vicryl mesh  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	SLND_DTCT_MTCD	감시림프절검출방법코드	38	VARCHAR(20)		감시림프절검출방법코드	감시 림프절 생검술 시 node identification을 위해 사용된 방법 코드	코드정의서 참고	N	\N	\N	40080	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	SLND_DTCT_MTNM	감시림프절검출방법명	39	VARCHAR(200)		명VC200	감시 림프절 생검술 시 node identification을 위해 사용된 방법 명	Dye  ICG  Indigocarmine  Radioisotope  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	AFOP_ASMT_ITEM_CD	수술후평가항목코드	40	VARCHAR(20)		수술후평가항목코드	수술치료 후 평가내용을 기재하는 항목 코드	코드정의서 참고	N	\N	\N	40350	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	AFOP_ASMT_ITEM_NM	수술후평가항목명	41	VARCHAR(200)		명VC200	수술치료 후 평가내용을 기재하는 항목 명	CR  PD  PR  SD  NE  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_OPRT	CRTN_DT	생성일시	42	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLTR_PRSC_YMD	수혈처방일자	3	VARCHAR(8)	PK_3	일자VC8	수혈 처방연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLTR_PRSC_SEQ	수혈처방순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLPT_KNCD	혈액제제종류코드	5	VARCHAR(20)		혈액제제종류코드	처방된 수혈 제제 종류코드	코드정의서 참고	N	\N	\N	40580	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLPT_KNNM	혈액제제종류명	6	VARCHAR(200)		명VC200	처방된 수혈 제제 종류명	Apheresis platelet  Autotransfusion  Cryoprecipitate  Fresh frozen plasma  Plateletpheresis (혈액원)  Pre-storage Leukocyte Filtered Red Blood Cells  Red blood cell  Washed red blood cell	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLPT_CD	혈액제제코드	7	VARCHAR(20)		혈액제제코드	처방된 수혈 제제 코드 (원내 코드)	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLPT_NM	혈액제제명	8	VARCHAR(200)		명VC200	처방된 수혈 제제 명 (원내 용어)	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLPT_CAPA	혈액제제용량	9	NUMERIC(5)		수N5	처방된 수혈 제제별 용량 (단위 mL)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLTR_PACK_CNT	수혈팩수	10	NUMERIC(3)		수N3	수혈 제제 pack 수의 합	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	BLTR_TOTL_QTY	수혈총량	11	NUMERIC(8)		수N8	수혈 제제별 용량의 합 (단위 mL)	99999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_BLTR	CRTN_DT	생성일시	12	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SRGC_PTEM_YMD	외과병리검사일자	3	VARCHAR(8)	PK_3	일자VC8	수술 후 외과병리를 시행한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SRGC_PTEM_SEQ	외과병리검사순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SGPT_READ_YMD	외과병리판독일자	5	VARCHAR(8)		일자VC8	수술 후 외과병리 조직을 판독한 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SGPT_HVST_SITE_CD	외과병리채취부위코드	6	VARCHAR(20)		외과병리채취부위코드	수술 후 외과병리 조직 채취 부위 코드	코드정의서 참고	N	\N	\N	30430	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SGPT_HVST_SITE_NM	외과병리채취부위명	7	VARCHAR(200)		명VC200	수술 후 외과병리 조직 채취 부위 명	Breast  LN  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SGPT_EXAM_SITE_LATR_CD	외과병리검사부위편측성코드	8	VARCHAR(20)		생체검사부위편측성코드	수술 후 외과병리 조직 채취 부위의 편측성 코드	코드정의서 참고	N	\N	\N	30320	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SGPT_EXAM_SITE_LATR_NM	외과병리검사부위편측성명	9	VARCHAR(200)		명VC200	수술 후 외과병리 조직 채취 부위의 편측성 명	Left  Right  Bilateral  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SRGC_PTEM_RSLT_TUMR_CNT	외과병리검사결과종양수	10	NUMERIC(3)		수N3	병리 검사에서 확인된 종양의 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	TUMR_WDTH_LNTH_VL	종양가로길이값	11	NUMERIC(4,1)		값N4,1	각 종양의 가로 크기 (단위 cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	TUMR_LGTD_LNTH_VL	종양세로길이값	12	NUMERIC(4,1)		값N4,1	각 종양의 세로 크기 (단위 cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	TUMR_HGHT_VL	종양높이값	13	NUMERIC(4,1)		값N4,1	각 종양의 높이 크기 (단위 cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	TUMR_MAX_DIAM_VL	종양최대직경값	14	NUMERIC(4,1)		값N4,1	수술 후 외과병리를 통해 확인된 종양의 최대직경 (단위  cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	HTLG_DIAG_CD	조직학적진단코드	15	VARCHAR(20)		조직학적진단코드	수술 후 외과병리를 통해 확인된 조직학적 진단코드	코드정의서 참고	N	\N	\N	30540	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	HTLG_DIAG_NM	조직학적진단명	16	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 조직학적 진단명	Invasive ductal carcinoma IDC micro IDC  Medullary carcinoma  Mucinous carcinoma  Papillary carcinoma  Tubular carcinoma  Metaplastic carcinoma  ILC Invasive lobular carcinoma  DCIS  Ductal carcinoma in situ  LCIS  Lobular carcinoma in situ  Pagets disease  Malignant Phyllodes tumor  Lymphoma  Sarcoma  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	HTLG_GRCD	조직학적등급코드	17	VARCHAR(20)		조직학적등급코드	수술 후 외과병리를 통해 확인된 조직학적 등급 (Histologic grade) 코드	코드정의서 참고	N	\N	\N	30520	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	HTLG_GRNM	조직학적등급명	18	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 조직학적 등급 (Histologic grade) 명	Gx  G1 G2  G3 	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	LVIN_EX_YN_SPCD	림프혈관침윤존재여부구분코드	19	VARCHAR(20)		존재여부구분코드	종양의 림프혈관 침윤 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	LVIN_EX_YN_SPNM	림프혈관침윤존재여부구분명	20	VARCHAR(50)		명VC50	종양의 림프혈관 침윤 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	LPIN_EX_YN_SPCD	림프절주위침윤존재여부구분코드	21	VARCHAR(20)		존재여부구분코드	림프절 주위 침윤 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	LPIN_EX_YN_SPNM	림프절주위침윤존재여부구분명	22	VARCHAR(50)		명VC50	림프절 주위 침윤 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	NIIN_EX_YN_SPCD	유두침윤존재여부구분코드	23	VARCHAR(20)		존재여부구분코드	유두 침윤 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	NIIN_EX_YN_SPNM	유두침윤존재여부구분명	24	VARCHAR(50)		명VC50	유두 침윤 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SGPT_MICF_EX_YN_SPCD	외과병리미세석회화존재여부구분코드	25	VARCHAR(20)		존재여부구분코드	미세석회화 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SGPT_MICF_EX_YN_SPNM	외과병리미세석회화존재여부구분명	26	VARCHAR(50)		명VC50	미세석회화 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	INCN_NECR_EX_YN_SPCD	상피내암괴사존재여부구분코드	27	VARCHAR(20)		존재여부구분코드	동반된 상피내암 괴사 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	INCN_NECR_EX_YN_SPNM	상피내암괴사존재여부구분명	28	VARCHAR(50)		명VC50	동반된 상피내암 괴사 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	INCN_ASSO_EX_YN_SPCD	상피내암동반존재여부구분코드	29	VARCHAR(20)		존재여부구분코드	상피내암 동반 여부 코드	코드정의서 참고	N	\N	\N	30550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	INCN_ASSO_EX_YN_SPNM	상피내암동반존재여부구분명	30	VARCHAR(50)		명VC50	상피내암 동반 여부 명	Present  Absent  Not evaluable	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	INCN_CORE_GRCD	상피내암핵등급코드	31	VARCHAR(20)		상피내암핵등급코드	동반된 상피내암의 핵등급 코드	코드정의서 참고	N	\N	\N	30250	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	INCN_CORE_GRNM	상피내암핵등급명	32	VARCHAR(200)		명VC200	동반된 상피내암의 핵등급 명	G1  G2  G3  Gx  High  Intermediate  Low  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SRMG_SFMG_LNTH_VL	수술절제면안전경계길이값	33	NUMERIC(4,1)		값N4,1	수술 후 외과병리를 통해 확인된 수술절제면의 암조직으로부터 여유길이 (단위 mm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SRMG_DETL_CONT	수술절제면상세내용	34	VARCHAR(200)		내용VC200	수술 절제면에 암조직 잔존여부 및 상세내용	예) 6h margin 2mm	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SRMG_RLCT_CD	수술절제면잔존코드	35	VARCHAR(20)		수술절제면잔존코드	수술 후 외과병리를 통해 확인된 수술절제면 암조직 잔존 코드	코드정의서 참고	N	\N	\N	30330	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SRMG_RLCT_NM	수술절제면잔존명	36	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 수술절제면 암조직 잔존 명	R0  R1  R2  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	MTCR_SIZE_VL	전이암크기값	37	NUMERIC(4,1)		값N4,1	림프절 전이된 암의 크기 (단위  cm)	99.9	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	ASSO_LESN_CD	동반병변코드	38	VARCHAR(20)		동반병변코드	수술 후 외과병리를 통해 확인된 동반된 병변 코드	코드정의서 참고	N	\N	\N	30130	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	ASSO_LESN_NM	동반병변명	39	VARCHAR(200)		명VC200	수술 후 외과병리를 통해 확인된 동반된 병변 명	Apocrine differentiation  Apocrine metaplasia  Complex sclerosing lesion  Fibroadenoma  Foamy histiocytic collection  Foreign body reaction  Intraductal papilloma  Medullary feature  Microcalcification  Mucinous component  Sclerosing adenosis  Stromal degeneration  Stromal fibrosis  Usual ductal hyperplasia  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	RESI_TUMR_CD	잔여종양코드	40	VARCHAR(20)		잔여종양코드	Residual tumor 코드	코드정의서 참고	N	\N	\N	30560	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	RESI_TUMR_NM	잔여종양명	41	VARCHAR(200)		명VC200	Residual tumor 명	No residual  CIS only  Residual breast tumor  Residual LN meta  Residual breast tumor and LN meta  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	LN_TOTL_CNT	림프절총수	42	NUMERIC(3)		수N3	절제된 림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	PSTV_LN_CNT	양성림프절수	43	VARCHAR(100)		수VC100	침윤된 림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	SLND_TOTL_CNT	감시림프절총수	44	NUMERIC(3)		수N3	절제된 감시림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	PSTV_SLND_CNT	양성감시림프절수	45	NUMERIC(3)		수N3	침윤된 감시림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	NSND_TOTL_CNT	비감시림프절총수	46	NUMERIC(3)		수N3	절제된 비감시림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	PSTV_NSND_CNT	양성비감시림프절수	47	NUMERIC(3)		수N3	침윤된 비감시림프절 개수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	AJCC_YR	AJCC년도	48	VARCHAR(4)		년도VC4	AJCC 기준년도 	YYYY	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	AFOP_PATH_TNM_STAG_VL	수술후병리TNM병기값	49	VARCHAR(20)		값VC20	병리 TNM 병기값	예) T1N0M0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	AFOP_PATH_T_STAG_VL	수술후병리T병기값	50	VARCHAR(20)		값VC20	병리 T 병기값	예) T2	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	AFOP_PATH_N_STAG_VL	수술후병리N병기값	51	VARCHAR(20)		값VC20	병리 N 병기값	예) N0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	AFOP_PATH_M_STAG_VL	수술후병리M병기값	52	VARCHAR(20)		값VC20	병리 M 병기값	예) M0	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_EXAM_SGPT	CRTN_DT	생성일시	53	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	COMP_OCRN_OPRT_YMD	합병증발생수술일자	3	VARCHAR(8)	PK_3	일자VC8	합병증 발생 관련 수술연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	COMP_OCRN_OPRT_SEQ	합병증발생수술순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	COMP_OCRN_YMD	합병증발생일자	5	VARCHAR(8)		일자VC8	수술 후 합병증의 발생연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	AFOC_CONT	수술후합병증내용	6	VARCHAR(4000)		내용VC4000	수술 후 합병증에 대한 정보를 정의하는 항목 내용	예) Seroma Infection Bleeding	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	COMP_GRCD	합병증등급코드	7	VARCHAR(20)		합병증등급코드	합병증(Name of complication)의 등급 코드\n(Clavien-Dindo기준)	코드정의서 참고	N	\N	\N	20120	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	COMP_GRNM	합병증등급명	8	VARCHAR(200)		명VC200	합병증(Name of complication)의 등급 명\n(Clavien-Dindo기준)	Grade 1  Grade 2  Grade 3  Grade 3a  Grade 3b  Grade 4  Grade 4a  Grade 4b  Grade 5	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_DIAG_AFOC	CRTN_DT	생성일시	9	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_PRSC_YMD	약제처방일자	3	VARCHAR(8)	PK_3	일자VC8	약제 처방연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_PRSC_SEQ	약제처방순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_CLCD	약제분류코드	5	VARCHAR(20)		약제분류코드	환자에게 처방된 약제 분류 코드	코드정의서 참고	N	\N	\N	40390	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_CLNM	약제분류명	6	VARCHAR(200)		명VC200	환자에게 처방된 약제 분류 명	항암약제  기타약제	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	ANDR_SPCD	항암약제구분코드	7	VARCHAR(20)		약제구분코드	항암약제 구분 코드	코드정의서 참고	N	\N	\N	40380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	ANDR_SPNM	항암약제구분명	8	VARCHAR(200)		명VC200	항암약제 구분 명	세포독성약제  항암표적약제  항암내분비약제  항암면역약제  기타항암약제	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRIN_KNCD	약제성분종류코드	9	VARCHAR(20)		약제성분종류코드	약제 성분 코드\n유방암 항암제에는 예시와 같은 약제 성분명이 존재하며                                                                       \n약제에 대한 정보를 수집 시 성분명에 따른 LOCAL EDI ATC 등과 같은 코드를 포함	코드정의서 참고	N	\N	\N	40400	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRIN_KNNM	약제성분종류명	10	VARCHAR(200)		명VC200	약제 성분명\n유방암 항암제에는 예시와 같은 약제 성분명이 존재하며                                                                       \n약제에 대한 정보를 수집 시 성분명에 따른 LOCAL EDI ATC 등과 같은 코드를 포함	Abemaciclib  Acetate  Albumin-bound paclitaxel  Anastrozole  Bevacizumab  \nCapecitabine  Carboplatin  Cetuximab  Cisplatin  Cyclophosphamide  \nDocetaxel  Doxorubicin  Epirubicin  Eribulin  Etoposide  Everolimus  \nExemestane  Fluorouracil  Fulvestrant  Gemcitabine  Goserelin  Ifosfamide  \nIrinotecan  Irinotecan hydrochloride  Lapatinib  Letrozole  Leucovorin  \nLeuprolide  Megestrol  Methotrexate  Mitomycin C  Nivolumab  Oxaliplatin  \nPaclitaxel  Palbociclib  Pembrolizumab  Pertuzumab  Ramucirumab  \nRibociclib  Tamoxifen  Tegafurgimeraciloteracil(S-1)  Toremifene   \nTrastuzumab  Trastuzumab emtansine   Trifluridine-tipiracil  Vinorelbine  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRIN_CD	약제성분코드	11	VARCHAR(20)		약제성분코드	약제 주성분 코드	예) 149430BIJ	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRIN_NM	약제성분명	12	VARCHAR(200)		명VC200	약제 주성분 명	예) doxorubicin hydrochloride	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRIN_SMCT_CD	약제성분SNOMEDCT코드	13	VARCHAR(200)		SNOMEDCT코드	약제 주성분의 국제 표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 327373002\n예2) 716872004_363701004_372817009	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRIN_SMCT_NM	약제성분SNOMEDCT명	14	VARCHAR(1000)		명VC1000	약제 주성분의 국제 표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Product containing precisely anastrozole 1 milligram1 each conventional release oral tablet \n예2) Antineoplastic chemotherapy regimen_Direct substance_Doxorubicin	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_CD	약제코드	15	VARCHAR(20)		약제코드	원내에서 수집하는 약제 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_NM	약제명	16	VARCHAR(200)		명VC200	원내에서 수집하는 약제 LOCAL 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_EDI_CD	약제EDI코드	17	VARCHAR(20)		약제EDI코드	약제 EDI 코드	예) 642901711	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_EDI_NM	약제EDI명	18	VARCHAR(200)		명VC200	약제 EDI 명	예) 유617일동아드리아마이신알.디.에프.주사10밀리그램(독소루비신염산염)_(10mg1병)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_ATC_CD	약제ATC코드	19	VARCHAR(20)		약제ATC코드	약제 ATC 코드	예) L01DB01	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_ATC_NM	약제ATC명	20	VARCHAR(200)		명VC200	약제 ATC 명	예) Doxorubicin	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_RXNM_CD	약제RXNORM코드	21	VARCHAR(20)		RXNORM코드	약제 RxNorm 코드	예) 2001102	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_RXNM_NM	약제RXNORM명	22	VARCHAR(200)		명VC200	약제 RxNorm 명	예) doxorubicin hydrochloride 10 MG Injection Adriamycin	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_PRSC_CAPA	약제처방용량	23	VARCHAR(50)		수VC50	처방된 약제 용량	999.999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_PRSC_CAPA_UNIT_CD	약제처방용량단위코드	24	VARCHAR(20)		약제처방용량단위코드	처방된 약제 용량 단위 코드	코드정의서 참고	N	\N	\N	40420	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_PRSC_CAPA_UNIT_NM	약제처방용량단위명	25	VARCHAR(200)		명VC200	처방된 약제 용량 단위 명	AMP  cap  dos  ea  g  gkg  gm2  ke  kit  mcg  mcgkg  mcgm2  mg  mgkg  mgm2  ml  pfu  pkg  set  tab  unit  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_PRSC_DCNT	약제처방일수	26	NUMERIC(3)		일수N3	약제 처방일수	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_INJC_PTH_CD	약제투여경로코드	27	VARCHAR(20)		약제투여경로코드	약제 투여경로 코드	코드정의서 참고	N	\N	\N	40440	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	DRUG_INJC_PTH_NM	약제투여경로명	28	VARCHAR(200)		명VC200	약제 투여경로 명	경구  근육주사  정맥내주사  피내주사  피하주사  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_DRIN	CRTN_DT	생성일시	29	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_STRT_YMD	항암요법시작일자	3	VARCHAR(8)	PK_3	일자VC8	항암요법 시작 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_SEQ	항암요법순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_END_YMD	항암요법종료일자	5	VARCHAR(8)		일자VC8	항암요법 종료 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_NM	항암요법명	6	VARCHAR(200)		명VC200	약제 조합으로서의 항암요법 	예) tegafurgimeraciloteracil  capecitabine  oxaliplatin I docetaxel  cisplatin  fluorouracil	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_CYCL_CNT	항암요법주기수	7	NUMERIC(3)		수N3	항암요법 치료 주기 수 (Cycle)	999	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_LINE_CNT	항암요법라인수	8	NUMERIC(3)		수N3	선택한 항암요법의 Line 수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_TEMP_STOP_YN_UNID_SPCD	항암요법임시중단여부확인불가구분코드	9	VARCHAR(20)		여부확인불가구분코드	항암요법 일시중단 여부 코드	코드정의서 참고	N	\N	\N	30380	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_TEMP_STOP_YN_UNID_SPNM	항암요법임시중단여부확인불가구분명	10	VARCHAR(50)		명VC50	항암요법 일시중단 여부 명	Yes  No  Unknown	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_END_RESN_CD	항암요법종료이유코드	11	VARCHAR(20)		항암요법종료이유코드	항암요법 종료 이유 코드	코드정의서 참고	N	\N	\N	40550	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_END_RESN_NM	항암요법종료이유명	12	VARCHAR(200)		명VC200	항암요법 종료 이유 명	Tumor progression  사망  추적관찰 소실  항암제 부작용  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_ASMT_YMD	항암요법평가일자	13	VARCHAR(8)		일자VC8	항암요법 평가연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_ASMT_ITEM_CD	항암요법평가항목코드	14	VARCHAR(20)		항암요법평가항목코드	항암요법 후 평가내용을 기재하는 항목 코드	코드정의서 참고	N	\N	\N	40570	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_ASMT_ITEM_NM	항암요법평가항목명	15	VARCHAR(200)		명VC200	항암요법 후 평가내용을 기재하는 항목 명	CR  PD  PR  SD  NE  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_SEFF_ITEM_CD	항암요법부작용항목코드	16	VARCHAR(20)		항암요법부작용코드	항암요법 후 발생한 부작용에 대한 정보 제공 항목 코드	코드정의서 참고	N	\N	\N	40530	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_SEFF_ITEM_NM	항암요법부작용항목명	17	VARCHAR(200)		명VC200	항암요법 후 발생한 부작용에 대한 정보 제공 항목 명	Alopecia  Anorexia  Constipation  Diarrhea  Dry skin  Fatigue  Hand-foot syndrome  Leukopenia  Mucositis  Nauseavomiting  Neuropathy  Skin rash  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_SEFF_GRCD	항암요법부작용등급코드	18	VARCHAR(20)		항암요법부작용등급코드	항암요법 후 발생한 부작용 Grade에 대한 정보 제공 항목 코드	코드정의서 참고	N	\N	\N	40520	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_SEFF_GRNM	항암요법부작용등급명	19	VARCHAR(200)		명VC200	항암요법 후 발생한 부작용 Grade에 대한 정보 제공 항목 명	I  II  III  IV   V	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_TRTM_PRPS_CD	항암요법치료목적코드	20	VARCHAR(20)		항암요법치료목적코드	항암요법 치료 목적 코드	코드정의서 참고	N	\N	\N	40560	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	ANTP_TRTM_PRPS_NM	항암요법치료목적명	21	VARCHAR(200)		명VC200	항암요법 치료 목적 명	Neoadjuvant  Adjuvant  Palliative  Concurrent  Induction  Maintenance  Salvage  Consolidation  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_ANTP	CRTN_DT	생성일시	22	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_PRSC_YMD	방사선치료처방일자	3	VARCHAR(8)	PK_3	일자VC8	방사선치료 처방연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_PRSC_SEQ	방사선치료처방순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_KNCD	방사선치료종류코드	5	VARCHAR(20)		방사선치료종류코드	방사선치료종류코드	코드정의서 참고	N	\N	\N	40180	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_KNNM	방사선치료종류명	6	VARCHAR(200)		명VC200	방사선치료종류명	뇌 정위적 방사선수술  밀봉소선원치료  세기변조 방사선치료  양성자 치료  입체조형치료  전신조사  정위적 방사선 분할치료  체부 정위적 방사선수술  체외조사  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_CD	방사선치료코드	7	VARCHAR(20)		방사선치료코드	원내에서 수집하는 방사선 LOCAL 코드	(원내코드)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_NM	방사선치료명	8	VARCHAR(200)		명VC200	원내에서 수집하는 방사선 LOCAL 명	(원내용어)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_EDI_CD	방사선치료EDI코드	9	VARCHAR(20)		방사선EDI코드	방사선치료 EDI 코드	예) HD091	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_EDI_NM	방사선치료EDI명	10	VARCHAR(200)		명VC200	방사선치료 EDI 명	예) 전신조사1회당-전신	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SMCT_CD	방사선치료SNOMEDCT코드	11	VARCHAR(200)		SNOMEDCT코드	방사선치료 처방명의 국제 표준용어 코드 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) 47479005\n예2) 33195004_424244007_118345003	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SMCT_NM	방사선치료SNOMEDCT명	12	VARCHAR(1000)		명VC1000	방사선치료 처방명의 국제 표준용어 (SNOMED CT)\n후조합 시 _ 를 구분자로 합쳐서 데이터 적재	예1) Total body irradiation\n예2) Teleradiotherapy procedure_Using energy_High energy laser beam	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_PRPS_CD	방사선치료목적코드	13	VARCHAR(20)		방사선치료목적코드	방사선치료 목적 코드	코드정의서 참고	N	\N	\N	40130	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_PRPS_NM	방사선치료목적명	14	VARCHAR(200)		명VC200	방사선치료 목적 명	Curative  Palliative  Adjuvant  Neoadjuvant  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SITE_CD	방사선치료부위코드	15	VARCHAR(20)		방사선치료부위코드	방사선치료 부위 코드	코드정의서 참고	N	\N	\N	40140	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SITE_NM	방사선치료부위명	16	VARCHAR(200)		명VC200	방사선치료 부위 명	Brain  Breast  Liver  LN  Lung  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RD_CGY	방사선선량	17	NUMERIC(5)		수N5	방사선 1회 선량 (단위  Gy)	99	N	\N	\N	\N	N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RD_IMPL_NT	방사선시행횟수	18	NUMERIC(3)		수N3	방사선 부위별 시행 횟수	99	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RD_TOTL_CGY	방사선총선량	19	NUMERIC(3)		수N3	방사선 부위별 총선량 (단위  Gy)	999	N	\N	\N	\N	N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_ASMT_YMD	방사선치료평가일자	20	VARCHAR(8)		일자VC8	방사선치료 후 평가 연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SEFF_PERD_SPCD	방사선치료부작용시기구분코드	21	VARCHAR(20)		방사선치료부작용시기구분코드	방사선 치료 후 환자에게 발생한 부작용 시기에 대한 정보 제공 항목 코드	코드정의서 참고	N	\N	\N	40160	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SEFF_PERD_SPNM	방사선치료부작용시기구분명	22	VARCHAR(200)		명VC200	방사선 치료 후 환자에게 발생한 부작용 시기에 대한 정보 제공 항목 명	급성(3개월 이내)  만성(3개월 초과)	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SEFF_KNCD	방사선치료부작용종류코드	23	VARCHAR(20)		방사선치료부작용종류코드	방사선 치료 후 환자에게 발생한 부작용에 대한 정보 제공 항목 코드	코드정의서 참고	N	\N	\N	40170	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SEFF_KNNM	방사선치료부작용종류명	24	VARCHAR(200)		명VC200	방사선 치료 후 환자에게 발생한 부작용에 대한 정보 제공 항목 명	Aches  Fatigue  Heart damage  Radiation pneumonitis  Skin irritation  Swelling of  breast	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SEFF_GRCD	방사선치료부작용등급코드	25	VARCHAR(20)		방사선치료부작용등급코드	방사선치료 후 발생한 부작용 등급에 대한 정보 제공 항목 코드 (CTCAE v5.0 참조)	코드정의서 참고	N	\N	\N	40150	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_SEFF_GRNM	방사선치료부작용등급명	26	VARCHAR(200)		명VC200	방사선치료 후 발생한 부작용 등급에 대한 정보 제공 항목 명 (CTCAE v5.0 참조)	Grade 1  Grade 2  Grade 3  Grade 4  Grade 5	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_ASMT_ITEM_CD	방사선치료평가항목코드	27	VARCHAR(20)		방사선치료평가항목코드	방사선치료 후 평가내용을 기재하는 항목 코드	코드정의서 참고	N	\N	\N	40200	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	RDT_ASMT_ITEM_NM	방사선치료평가항목명	28	VARCHAR(200)		명VC200	방사선치료 후 평가내용을 기재하는 항목 명	CR  PD  PR  SD  NE  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_TRTM_RD	CRTN_DT	생성일시	29	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	HOSP_CD	병원코드	1	VARCHAR(20)	PK_1	병원코드	병원코드	9999	N	\N	\N	10010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	PT_SBST_NO	환자대체번호	2	VARCHAR(10)	PK_2	환자대체번호	환자대체번호	예) RNxxxxxx	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLDG_YMD	재발진단일자	3	VARCHAR(8)	PK_3	일자VC8	암 재발 진단연월일	YYYYMMDD	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLDG_SEQ	재발진단순번	4	NUMERIC(3)	PK_4	일련번호N3	일련번호	예) 1	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLPS_SITE_CD	재발부위코드	5	VARCHAR(20)		재발부위코드	재발암 부위 코드	코드정의서 참고	N	\N	\N	50010	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLPS_SITE_NM	재발부위명	6	VARCHAR(200)		명VC200	재발암 부위 명	Bone  Liver  LN  Lung  Peritoneum  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLPS_TRTM_CONT	재발치료내용	7	VARCHAR(5)		내용VC5	재발암 치료 요법  동시항암화학방사선요법 수술 화학요법 방사선요법 기타   순으로 시행한 치료는 00000에 1로 표시 	예) 동시항암화학방사선요법 수술 시행  11000	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLDG_MTCD	재발진단방법코드	8	VARCHAR(20)		재발진단방법코드	암 재발 진단 시 진단방법 코드	코드정의서 참고	N	\N	\N	50040	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLDG_MTNM	재발진단방법명	9	VARCHAR(200)		명VC200	암 재발 진단 시 진단방법 명	영상검사  조직검사  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLPS_KNCD	재발종류코드	10	VARCHAR(20)		재발종류코드	재발 종류 코드	코드정의서 참고	N	\N	\N	50020	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLPS_KNNM	재발종류명	11	VARCHAR(200)		명VC200	재발 종류 명	Both Local  Distant  Distant(Systemic)  Locoregional  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLPS_SYM_CD	재발증상코드	12	VARCHAR(20)		재발증상코드	재발에 해당하는 증상 코드	코드정의서 참고	N	\N	\N	50030	Y	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	RLPS_SYM_NM	재발증상명	13	VARCHAR(200)		명VC200	재발에 해당하는 증상 명	Lymph node  Palpable  Palpable mass  Skin change  기타	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
BRCN_FUOR_RLPS	CRTN_DT	생성일시	14	TIMESTAMP		일시TIMESTAMP	데이터생성일시	생성일시  DEFAULT current_timestamp()	N	\N	\N		N	TEST01	2023-02-16 16:28:45.071271	TEST01	2023-02-16 16:28:45.071271
\.


--
-- TOC entry 4152 (class 0 OID 33249)
-- Dependencies: 300
-- Data for Name: ecrf_tbl_dfnd; Type: TABLE DATA; Schema: public; Owner: gony
--

COPY public.ecrf_tbl_dfnd (tbl_enm, tbl_knm, tbl_ord, crcn_nm, lcls_nm, mcls_nm, ldng_dtrn_cont, coll_bldt_col_knm, coll_bldt_col_enm, frst_regp_id, frst_rgst_dt, last_modp_id, last_modf_dt) FROM stdin;
GSCN_PT_HLINF	위암_환자_건강정보	1	위암	환자	건강정보	2010년~현재	입원일자	ADM_YMD	43	2023-05-15 20:38:51.986752	43	2023-06-12 11:11:06.671437
GSCN_PT_FMHT	위암_환자_가족력	2	위암	환자	가족력	2010년~현재	가족력기록일자	FMHT_RCRD_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_DIAG_ANINF	위암_진단_신체계측정보	3	위암	진단	신체계측정보	2010년~현재	신체계측기록일자	ANTH_RCRD_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_DIAG_INF	위암_진단_정보	4	위암	진단	진단정보	2010년~현재	진단등록일자	DIAG_RGST_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_DIAG_STAG	위암_진단_병기	5	위암	진단	병기	2010년~현재	진단병기기록일자	DIAG_STAG_RCRD_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_DIAG_MTST	위암_진단_전이	6	위암	진단	전이정보	2010년~현재	전이진단일자	MTDG_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_DIAG	위암_검사_진단	7	위암	검사	진단	2010년~현재	진단검사일자	CEXM_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_IMAG	위암_검사_영상	8	위암	검사	영상	2010년~현재	영상검사일자	IMEX_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_IMPT	위암_검사_면역병리	9	위암	검사	면역병리	2010년~현재	면역병리검사일자	IMEM_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_MLPT	위암_검사_분자병리	10	위암	검사	분자병리	2010년~현재	분자병리검사일자	MLEM_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_BYPS	위암_검사_생체	11	위암	검사	생체검사	2010년~현재	생체검사일자	BPSY_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_HPLI	위암_검사_HPYLORI	12	위암	검사	H.pylori 감염여부	2010년~현재	HPYLORI검사일자	HPLI_EXAM_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_GTSP	위암_검사_위내시경	13	위암	검사	위내시경	2010년~현재	위내시경검사일자	STMC_EDEX_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_EUS	위암_검사_EUS	14	위암	검사	내시경초음파(EUS)	2010년~현재	EUS검사일자	EUS_EXAM_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_TRTM_OPRT	위암_치료_수술	15	위암	치료	수술	2010년~현재	수술일자	OPRT_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_TRTM_SRPR	위암_치료_시술	16	위암	치료	시술	2010년~현재	ESD시술일자	ESD_SRPR_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_EXAM_SGPT	위암_검사_외과병리	17	위암	검사	수술 후 외과병리	2010년~현재	외과병리검사일자	SRGC_PTEM_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_DIAG_AFOC	위암_진단_수술후합병증	18	위암	진단	수술 후 합병증	2010년~현재	합병증발생수술일자	COMP_OCRN_OPRT_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_TRTM_BLTR	위암_치료_수혈	19	위암	치료	수혈	2010년~현재	수혈처방일자	BLTR_PRSC_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_TRTM_DRIN	위암_치료_약제성분	20	위암	치료	약제	2010년~현재	약제처방일자	DRUG_PRSC_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_TRTM_ANTP	위암_치료_항암요법	21	위암	치료	항암요법	2010년~현재	항암요법시작일자	ANTP_STRT_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_TRTM_RD	위암_치료_방사선	22	위암	치료	방사선	2010년~현재	방사선치료처방일자	RDT_PRSC_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_FUOR_RLPS	위암_추적관찰_재발	23	위암	추적관찰	재발정보	2010년~현재	재발진단일자	RLDG_YMD	43	2023-04-17 10:24:06.143651	43	2023-04-17 10:24:06.143651
GSCN_PT_HLINF_TEST	위암_환자_건강정보시험	24	위암	환자	건강정보시험	2010년현재	입원일자	ADM_YMD	43	2023-06-12 13:22:15.488797	43	2023-06-12 13:23:22.812592
GSCN_PT_HLINF_TM	위암_환자_건강정보임시	26	위암	환자	건강정보	2010년~현재	입원일자	ADM_YMD	43	2023-06-15 08:54:29.739067	43	2023-06-15 08:54:29.739067
GSCN_PT_FMHT_TM	위암_환자_가족력임시	27	위암	환자	가족력	2010년~현재	가족력기록일자	FMHT_RCRD_YMD	43	2023-06-15 08:54:29.739067	43	2023-06-15 08:54:29.739067
BRCN_PT_HLINF	유방암_환자_건강정보	1	유방암	환자	건강정보	2010년~현재	입원일자	ADM_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_PT_FMHT	유방암_환자_가족력	2	유방암	환자	가족력	2010년~현재	가족력기록일자	FMHT_RCRD_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_PT_OBINF	유방암_환자_산과정보	3	유방암	환자	산과정보	2010년~현재	산과기록일자	OBTR_RCRD_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_DIAG_ANINF	유방암_진단_신체계측정보	4	유방암	진단	신체계측정보	2010년~현재	신체계측기록일자	ANTH_RCRD_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_DIAG_INF	유방암_진단_정보	5	유방암	진단	진단정보	2010년~현재	진단등록일자	DIAG_RGST_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_DIAG_MTST	유방암_진단_전이	6	유방암	진단	전이정보	2010년~현재	전이진단일자	MTDG_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_DIAG_STAG	유방암_진단_병기	7	유방암	진단	병기	2010년~현재	진단병기기록일자	DIAG_STAG_RCRD_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_DIAG	유방암_검사_진단	8	유방암	검사	진단	2010년~현재	진단검사일자	CEXM_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_IMAG	유방암_검사_영상	9	유방암	검사	영상	2010년~현재	영상검사일자	IMEX_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_BYPS	유방암_검사_생체	10	유방암	검사	생체검사	2010년~현재	생체검사일자	BPSY_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_IMPT	유방암_검사_면역병리	11	유방암	검사	면역병리	2010년~현재	면역병리검사일자	IMEM_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_MLPT	유방암_검사_분자병리	12	유방암	검사	분자병리	2010년~현재	분자병리검사일자	MLEM_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_GMVX	유방암_검사_생식세포변이검사	13	유방암	검사	생식세포 변이검사	2010년~현재	생식세포변이검사일자	GMVX_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_GNRX	유방암_검사_유전자발현검사	14	유방암	검사	예후예측 유전자 발현검사	2010년~현재	유전자발현검사일자	GNRX_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_TRTM_OPRT	유방암_치료_수술	15	유방암	치료	수술	2010년~현재	수술일자	OPRT_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_TRTM_BLTR	유방암_치료_수혈	16	유방암	치료	수혈	2010년~현재	수혈처방일자	BLTR_PRSC_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_EXAM_SGPT	유방암_검사_외과병리	17	유방암	검사	수술 후 외과병리	2010년~현재	외과병리검사일자	SRGC_PTEM_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_DIAG_AFOC	유방암_진단_수술후합병증	18	유방암	진단	수술 후 합병증	2010년~현재	합병증발생수술일자	COMP_OCRN_OPRT_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_TRTM_DRIN	유방암_치료_약제성분	19	유방암	치료	약제	2010년~현재	약제처방일자	DRUG_PRSC_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_TRTM_ANTP	유방암_치료_항암요법	20	유방암	치료	항암요법	2010년~현재	항암요법시작일자	ANTP_STRT_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_TRTM_RD	유방암_치료_방사선	21	유방암	치료	방사선	2010년~현재	방사선치료처방일자	RDT_PRSC_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
BRCN_FUOR_RLPS	유방암_추적관찰_재발	22	유방암	추적관찰	재발정보	2010년~현재	재발진단일자	RLDG_YMD	43	2023-04-17 10:24:17.89372	43	2023-04-17 10:24:17.89372
\.


--
-- TOC entry 4151 (class 0 OID 33240)
-- Dependencies: 299
-- Data for Name: ecrf_user; Type: TABLE DATA; Schema: public; Owner: gony
--

COPY public.ecrf_user (user_id, user_nm, login_pswd, user_expl_cont, user_wthd_dt, last_login_dt, frst_regp_id, frst_rgst_dt, last_modp_id, last_modf_dt) FROM stdin;
\.


--
-- TOC entry 4064 (class 0 OID 16386)
-- Dependencies: 212
-- Data for Name: tb_test; Type: TABLE DATA; Schema: public; Owner: gony
--

COPY public.tb_test (id, researcher, department, research, apply_step, apply_status, imported_data_exists, data_export_request_exists, data_export_approval_existence, date_utilization_start_date, data_utilization_end_date) FROM stdin;
1	유창곤	데이터스트림즈	개발	신청	접수중	f	f	f	\N	\N
2	홍다림	데이터스트림즈	개발	신청	접수중	f	f	f	\N	\N
3	유창곤	데이터스트림즈	품질	신청	접수중	f	f	f	\N	\N
\.


--
-- TOC entry 3660 (class 2606 OID 33239)
-- Name: concept_synonym uq_concept_synonym; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_synonym
    ADD CONSTRAINT uq_concept_synonym UNIQUE (concept_id, concept_synonym_name, language_concept_id);


--
-- TOC entry 3680 (class 2606 OID 25339)
-- Name: attribute_definition xpk_attribute_definition; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.attribute_definition
    ADD CONSTRAINT xpk_attribute_definition PRIMARY KEY (attribute_definition_id);


--
-- TOC entry 3747 (class 2606 OID 25371)
-- Name: care_site xpk_care_site; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.care_site
    ADD CONSTRAINT xpk_care_site PRIMARY KEY (care_site_id);


--
-- TOC entry 3758 (class 2606 OID 25379)
-- Name: cohort xpk_cohort; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort
    ADD CONSTRAINT xpk_cohort PRIMARY KEY (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date);


--
-- TOC entry 3762 (class 2606 OID 25381)
-- Name: cohort_attribute xpk_cohort_attribute; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort_attribute
    ADD CONSTRAINT xpk_cohort_attribute PRIMARY KEY (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id);


--
-- TOC entry 3677 (class 2606 OID 25337)
-- Name: cohort_definition xpk_cohort_definition; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort_definition
    ADD CONSTRAINT xpk_cohort_definition PRIMARY KEY (cohort_definition_id);


--
-- TOC entry 3640 (class 2606 OID 25319)
-- Name: concept xpk_concept; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept
    ADD CONSTRAINT xpk_concept PRIMARY KEY (concept_id);


--
-- TOC entry 3664 (class 2606 OID 25331)
-- Name: concept_ancestor xpk_concept_ancestor; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_ancestor
    ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY (ancestor_concept_id, descendant_concept_id);


--
-- TOC entry 3649 (class 2606 OID 25325)
-- Name: concept_class xpk_concept_class; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_class
    ADD CONSTRAINT xpk_concept_class PRIMARY KEY (concept_class_id);


--
-- TOC entry 3654 (class 2606 OID 25327)
-- Name: concept_relationship xpk_concept_relationship; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_relationship
    ADD CONSTRAINT xpk_concept_relationship PRIMARY KEY (concept_id_1, concept_id_2, relationship_id);


--
-- TOC entry 3774 (class 2606 OID 25387)
-- Name: condition_era xpk_condition_era; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_era
    ADD CONSTRAINT xpk_condition_era PRIMARY KEY (condition_era_id);


--
-- TOC entry 3721 (class 2606 OID 25359)
-- Name: condition_occurrence xpk_condition_occurrence; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT xpk_condition_occurrence PRIMARY KEY (condition_occurrence_id);


--
-- TOC entry 3693 (class 2606 OID 25347)
-- Name: death xpk_death; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.death
    ADD CONSTRAINT xpk_death PRIMARY KEY (person_id);


--
-- TOC entry 3716 (class 2606 OID 25357)
-- Name: device_exposure xpk_device_exposure; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.device_exposure
    ADD CONSTRAINT xpk_device_exposure PRIMARY KEY (device_exposure_id);


--
-- TOC entry 3646 (class 2606 OID 25323)
-- Name: domain xpk_domain; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.domain
    ADD CONSTRAINT xpk_domain PRIMARY KEY (domain_id);


--
-- TOC entry 3770 (class 2606 OID 25385)
-- Name: dose_era xpk_dose_era; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.dose_era
    ADD CONSTRAINT xpk_dose_era PRIMARY KEY (dose_era_id);


--
-- TOC entry 3766 (class 2606 OID 25383)
-- Name: drug_era xpk_drug_era; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_era
    ADD CONSTRAINT xpk_drug_era PRIMARY KEY (drug_era_id);


--
-- TOC entry 3711 (class 2606 OID 25355)
-- Name: drug_exposure xpk_drug_exposure; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT xpk_drug_exposure PRIMARY KEY (drug_exposure_id);


--
-- TOC entry 3674 (class 2606 OID 25335)
-- Name: drug_strength xpk_drug_strength; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_strength
    ADD CONSTRAINT xpk_drug_strength PRIMARY KEY (drug_concept_id, ingredient_concept_id);


--
-- TOC entry 3745 (class 2606 OID 25369)
-- Name: location xpk_location; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.location
    ADD CONSTRAINT xpk_location PRIMARY KEY (location_id);


--
-- TOC entry 3726 (class 2606 OID 25361)
-- Name: measurement xpk_measurement; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT xpk_measurement PRIMARY KEY (measurement_id);


--
-- TOC entry 3731 (class 2606 OID 25363)
-- Name: note xpk_note; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT xpk_note PRIMARY KEY (note_id);


--
-- TOC entry 3735 (class 2606 OID 25365)
-- Name: note_nlp xpk_note_nlp; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note_nlp
    ADD CONSTRAINT xpk_note_nlp PRIMARY KEY (note_nlp_id);


--
-- TOC entry 3740 (class 2606 OID 25367)
-- Name: observation xpk_observation; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT xpk_observation PRIMARY KEY (observation_id);


--
-- TOC entry 3686 (class 2606 OID 25343)
-- Name: observation_period xpk_observation_period; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation_period
    ADD CONSTRAINT xpk_observation_period PRIMARY KEY (observation_period_id);


--
-- TOC entry 3752 (class 2606 OID 25375)
-- Name: payer_plan_period xpk_payer_plan_period; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.payer_plan_period
    ADD CONSTRAINT xpk_payer_plan_period PRIMARY KEY (payer_plan_period_id);


--
-- TOC entry 3683 (class 2606 OID 25341)
-- Name: person xpk_person; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT xpk_person PRIMARY KEY (person_id);


--
-- TOC entry 3706 (class 2606 OID 25353)
-- Name: procedure_occurrence xpk_procedure_occurrence; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT xpk_procedure_occurrence PRIMARY KEY (procedure_occurrence_id);


--
-- TOC entry 3749 (class 2606 OID 25373)
-- Name: provider xpk_provider; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.provider
    ADD CONSTRAINT xpk_provider PRIMARY KEY (provider_id);


--
-- TOC entry 3657 (class 2606 OID 25329)
-- Name: relationship xpk_relationship; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.relationship
    ADD CONSTRAINT xpk_relationship PRIMARY KEY (relationship_id);


--
-- TOC entry 3670 (class 2606 OID 25333)
-- Name: source_to_concept_map xpk_source_to_concept_map; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.source_to_concept_map
    ADD CONSTRAINT xpk_source_to_concept_map PRIMARY KEY (source_vocabulary_id, target_concept_id, source_code, valid_end_date);


--
-- TOC entry 3690 (class 2606 OID 25345)
-- Name: specimen xpk_specimen; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.specimen
    ADD CONSTRAINT xpk_specimen PRIMARY KEY (specimen_id);


--
-- TOC entry 3754 (class 2606 OID 25377)
-- Name: cost xpk_visit_cost; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cost
    ADD CONSTRAINT xpk_visit_cost PRIMARY KEY (cost_id);


--
-- TOC entry 3701 (class 2606 OID 25351)
-- Name: visit_detail xpk_visit_detail; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT xpk_visit_detail PRIMARY KEY (visit_detail_id);


--
-- TOC entry 3697 (class 2606 OID 25349)
-- Name: visit_occurrence xpk_visit_occurrence; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT xpk_visit_occurrence PRIMARY KEY (visit_occurrence_id);


--
-- TOC entry 3643 (class 2606 OID 25321)
-- Name: vocabulary xpk_vocabulary; Type: CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.vocabulary
    ADD CONSTRAINT xpk_vocabulary PRIMARY KEY (vocabulary_id);


--
-- TOC entry 3587 (class 2606 OID 24902)
-- Name: brcn_diag_afoc brcn_diag_afoc_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_diag_afoc
    ADD CONSTRAINT brcn_diag_afoc_pk PRIMARY KEY (hosp_cd, pt_sbst_no, comp_ocrn_oprt_ymd, comp_ocrn_oprt_seq);


--
-- TOC entry 3589 (class 2606 OID 24909)
-- Name: brcn_diag_aninf brcn_diag_aninf_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_diag_aninf
    ADD CONSTRAINT brcn_diag_aninf_pk PRIMARY KEY (hosp_cd, pt_sbst_no, anth_rcrd_ymd, anth_rcrd_seq);


--
-- TOC entry 3591 (class 2606 OID 24916)
-- Name: brcn_diag_inf brcn_diag_inf_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_diag_inf
    ADD CONSTRAINT brcn_diag_inf_pk PRIMARY KEY (hosp_cd, pt_sbst_no, diag_rgst_ymd, diag_rgst_seq);


--
-- TOC entry 3593 (class 2606 OID 24923)
-- Name: brcn_diag_mtst brcn_diag_mtst_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_diag_mtst
    ADD CONSTRAINT brcn_diag_mtst_pk PRIMARY KEY (hosp_cd, pt_sbst_no, mtdg_ymd, mtdg_seq);


--
-- TOC entry 3595 (class 2606 OID 24930)
-- Name: brcn_diag_stag brcn_diag_stag_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_diag_stag
    ADD CONSTRAINT brcn_diag_stag_pk PRIMARY KEY (hosp_cd, pt_sbst_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq);


--
-- TOC entry 3597 (class 2606 OID 24937)
-- Name: brcn_exam_byps brcn_exam_byps_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_byps
    ADD CONSTRAINT brcn_exam_byps_pk PRIMARY KEY (hosp_cd, pt_sbst_no, bpsy_ymd, bpsy_seq);


--
-- TOC entry 3599 (class 2606 OID 24944)
-- Name: brcn_exam_diag brcn_exam_diag_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_diag
    ADD CONSTRAINT brcn_exam_diag_pk PRIMARY KEY (hosp_cd, pt_sbst_no, cexm_ymd, cexm_seq);


--
-- TOC entry 3601 (class 2606 OID 24951)
-- Name: brcn_exam_gmvx brcn_exam_gmvx_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_gmvx
    ADD CONSTRAINT brcn_exam_gmvx_pk PRIMARY KEY (hosp_cd, pt_sbst_no, gmvx_ymd, gmvx_seq);


--
-- TOC entry 3603 (class 2606 OID 24958)
-- Name: brcn_exam_gnrx brcn_exam_gnrx_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_gnrx
    ADD CONSTRAINT brcn_exam_gnrx_pk PRIMARY KEY (hosp_cd, pt_sbst_no, gnrx_ymd, gnrx_seq);


--
-- TOC entry 3605 (class 2606 OID 24965)
-- Name: brcn_exam_imag brcn_exam_imag_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_imag
    ADD CONSTRAINT brcn_exam_imag_pk PRIMARY KEY (hosp_cd, pt_sbst_no, imex_ymd, imex_seq);


--
-- TOC entry 3607 (class 2606 OID 24972)
-- Name: brcn_exam_impt brcn_exam_impt_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_impt
    ADD CONSTRAINT brcn_exam_impt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, imem_ymd, imem_seq);


--
-- TOC entry 3609 (class 2606 OID 24979)
-- Name: brcn_exam_mlpt brcn_exam_mlpt_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_mlpt
    ADD CONSTRAINT brcn_exam_mlpt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, mlem_ymd, mlem_seq);


--
-- TOC entry 3611 (class 2606 OID 24986)
-- Name: brcn_exam_sgpt brcn_exam_sgpt_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_exam_sgpt
    ADD CONSTRAINT brcn_exam_sgpt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, srgc_ptem_ymd, srgc_ptem_seq);


--
-- TOC entry 3613 (class 2606 OID 24993)
-- Name: brcn_fuor_rlps brcn_fuor_rlps_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_fuor_rlps
    ADD CONSTRAINT brcn_fuor_rlps_pk PRIMARY KEY (hosp_cd, pt_sbst_no, rldg_ymd, rldg_seq);


--
-- TOC entry 3615 (class 2606 OID 25000)
-- Name: brcn_pt_fmht brcn_pt_fmht_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_pt_fmht
    ADD CONSTRAINT brcn_pt_fmht_pk PRIMARY KEY (hosp_cd, pt_sbst_no, fmht_rcrd_ymd, fmht_rcrd_seq);


--
-- TOC entry 3617 (class 2606 OID 25007)
-- Name: brcn_pt_hlinf brcn_pt_hlinf_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_pt_hlinf
    ADD CONSTRAINT brcn_pt_hlinf_pk PRIMARY KEY (hosp_cd, pt_sbst_no, adm_ymd, hlinf_seq);


--
-- TOC entry 3619 (class 2606 OID 25014)
-- Name: brcn_pt_obinf brcn_pt_obinf_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_pt_obinf
    ADD CONSTRAINT brcn_pt_obinf_pk PRIMARY KEY (hosp_cd, pt_sbst_no, obtr_rcrd_ymd, obtr_rcrd_seq);


--
-- TOC entry 3621 (class 2606 OID 25021)
-- Name: brcn_trtm_antp brcn_trtm_antp_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_trtm_antp
    ADD CONSTRAINT brcn_trtm_antp_pk PRIMARY KEY (hosp_cd, pt_sbst_no, antp_strt_ymd, antp_seq);


--
-- TOC entry 3623 (class 2606 OID 25026)
-- Name: brcn_trtm_bltr brcn_trtm_bltr_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_trtm_bltr
    ADD CONSTRAINT brcn_trtm_bltr_pk PRIMARY KEY (hosp_cd, pt_sbst_no, bltr_prsc_ymd, bltr_prsc_seq);


--
-- TOC entry 3625 (class 2606 OID 25033)
-- Name: brcn_trtm_drin brcn_trtm_drin_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_trtm_drin
    ADD CONSTRAINT brcn_trtm_drin_pk PRIMARY KEY (hosp_cd, pt_sbst_no, drug_prsc_ymd, drug_prsc_seq);


--
-- TOC entry 3627 (class 2606 OID 25040)
-- Name: brcn_trtm_oprt brcn_trtm_oprt_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_trtm_oprt
    ADD CONSTRAINT brcn_trtm_oprt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, oprt_ymd, oprt_seq);


--
-- TOC entry 3629 (class 2606 OID 25047)
-- Name: brcn_trtm_rd brcn_trtm_rd_pk; Type: CONSTRAINT; Schema: cancle_breast; Owner: gony
--

ALTER TABLE ONLY cancle_breast.brcn_trtm_rd
    ADD CONSTRAINT brcn_trtm_rd_pk PRIMARY KEY (hosp_cd, pt_sbst_no, rdt_prsc_ymd, rdt_prsc_seq);


--
-- TOC entry 3541 (class 2606 OID 24744)
-- Name: gscn_diag_afoc gscn_diag_afoc_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_diag_afoc
    ADD CONSTRAINT gscn_diag_afoc_pk PRIMARY KEY (hosp_cd, pt_sbst_no, comp_ocrn_oprt_ymd, comp_ocrn_oprt_seq);


--
-- TOC entry 3543 (class 2606 OID 24751)
-- Name: gscn_diag_aninf gscn_diag_aninf_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_diag_aninf
    ADD CONSTRAINT gscn_diag_aninf_pk PRIMARY KEY (hosp_cd, pt_sbst_no, anth_rcrd_ymd, anth_rcrd_seq);


--
-- TOC entry 3545 (class 2606 OID 24758)
-- Name: gscn_diag_inf gscn_diag_inf_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_diag_inf
    ADD CONSTRAINT gscn_diag_inf_pk PRIMARY KEY (hosp_cd, pt_sbst_no, diag_rgst_ymd, diag_rgst_seq);


--
-- TOC entry 3547 (class 2606 OID 24765)
-- Name: gscn_diag_mtst gscn_diag_mtst_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_diag_mtst
    ADD CONSTRAINT gscn_diag_mtst_pk PRIMARY KEY (hosp_cd, pt_sbst_no, mtdg_ymd, mtdg_seq);


--
-- TOC entry 3549 (class 2606 OID 24772)
-- Name: gscn_diag_stag gscn_diag_stag_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_diag_stag
    ADD CONSTRAINT gscn_diag_stag_pk PRIMARY KEY (hosp_cd, pt_sbst_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq);


--
-- TOC entry 3551 (class 2606 OID 24779)
-- Name: gscn_exam_byps gscn_exam_byps_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_byps
    ADD CONSTRAINT gscn_exam_byps_pk PRIMARY KEY (hosp_cd, pt_sbst_no, bpsy_ymd, bpsy_seq);


--
-- TOC entry 3553 (class 2606 OID 24786)
-- Name: gscn_exam_diag gscn_exam_diag_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_diag
    ADD CONSTRAINT gscn_exam_diag_pk PRIMARY KEY (hosp_cd, pt_sbst_no, cexm_ymd, cexm_seq);


--
-- TOC entry 3555 (class 2606 OID 24793)
-- Name: gscn_exam_eus gscn_exam_eus_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_eus
    ADD CONSTRAINT gscn_exam_eus_pk PRIMARY KEY (hosp_cd, pt_sbst_no, eus_exam_ymd, eus_exam_seq);


--
-- TOC entry 3557 (class 2606 OID 24800)
-- Name: gscn_exam_gtsp gscn_exam_gtsp_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_gtsp
    ADD CONSTRAINT gscn_exam_gtsp_pk PRIMARY KEY (hosp_cd, pt_sbst_no, stmc_edex_ymd, stmc_edex_seq);


--
-- TOC entry 3559 (class 2606 OID 24805)
-- Name: gscn_exam_hpli gscn_exam_hpli_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_hpli
    ADD CONSTRAINT gscn_exam_hpli_pk PRIMARY KEY (hosp_cd, pt_sbst_no, hpli_exam_ymd, hpli_exam_seq);


--
-- TOC entry 3561 (class 2606 OID 24812)
-- Name: gscn_exam_imag gscn_exam_imag_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_imag
    ADD CONSTRAINT gscn_exam_imag_pk PRIMARY KEY (hosp_cd, pt_sbst_no, imex_ymd, imex_seq);


--
-- TOC entry 3563 (class 2606 OID 24819)
-- Name: gscn_exam_impt gscn_exam_impt_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_impt
    ADD CONSTRAINT gscn_exam_impt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, imem_ymd, imem_seq);


--
-- TOC entry 3565 (class 2606 OID 24826)
-- Name: gscn_exam_mlpt gscn_exam_mlpt_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_mlpt
    ADD CONSTRAINT gscn_exam_mlpt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, mlem_ymd, mlem_seq);


--
-- TOC entry 3567 (class 2606 OID 24833)
-- Name: gscn_exam_sgpt gscn_exam_sgpt_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_exam_sgpt
    ADD CONSTRAINT gscn_exam_sgpt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, srgc_ptem_ymd, srgc_ptem_seq);


--
-- TOC entry 3569 (class 2606 OID 24840)
-- Name: gscn_fuor_rlps gscn_fuor_rlps_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_fuor_rlps
    ADD CONSTRAINT gscn_fuor_rlps_pk PRIMARY KEY (hosp_cd, pt_sbst_no, rldg_ymd, rldg_seq);


--
-- TOC entry 3571 (class 2606 OID 24847)
-- Name: gscn_pt_fmht gscn_pt_fmht_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_pt_fmht
    ADD CONSTRAINT gscn_pt_fmht_pk PRIMARY KEY (hosp_cd, pt_sbst_no, fmht_rcrd_ymd, fmht_rcrd_seq);


--
-- TOC entry 3573 (class 2606 OID 24854)
-- Name: gscn_pt_hlinf gscn_pt_hlinf_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_pt_hlinf
    ADD CONSTRAINT gscn_pt_hlinf_pk PRIMARY KEY (hosp_cd, pt_sbst_no, adm_ymd, hlinf_seq);


--
-- TOC entry 3575 (class 2606 OID 24861)
-- Name: gscn_trtm_antp gscn_trtm_antp_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_trtm_antp
    ADD CONSTRAINT gscn_trtm_antp_pk PRIMARY KEY (hosp_cd, pt_sbst_no, antp_strt_ymd, antp_seq);


--
-- TOC entry 3577 (class 2606 OID 24866)
-- Name: gscn_trtm_bltr gscn_trtm_bltr_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_trtm_bltr
    ADD CONSTRAINT gscn_trtm_bltr_pk PRIMARY KEY (hosp_cd, pt_sbst_no, bltr_prsc_ymd, bltr_prsc_seq);


--
-- TOC entry 3579 (class 2606 OID 24873)
-- Name: gscn_trtm_drin gscn_trtm_drin_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_trtm_drin
    ADD CONSTRAINT gscn_trtm_drin_pk PRIMARY KEY (hosp_cd, pt_sbst_no, drug_prsc_ymd, drug_prsc_seq);


--
-- TOC entry 3581 (class 2606 OID 24880)
-- Name: gscn_trtm_oprt gscn_trtm_oprt_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_trtm_oprt
    ADD CONSTRAINT gscn_trtm_oprt_pk PRIMARY KEY (hosp_cd, pt_sbst_no, oprt_ymd, oprt_seq);


--
-- TOC entry 3583 (class 2606 OID 24887)
-- Name: gscn_trtm_rd gscn_trtm_rd_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_trtm_rd
    ADD CONSTRAINT gscn_trtm_rd_pk PRIMARY KEY (hosp_cd, pt_sbst_no, rdt_prsc_ymd, rdt_prsc_seq);


--
-- TOC entry 3585 (class 2606 OID 24894)
-- Name: gscn_trtm_srpr gscn_trtm_srpr_pk; Type: CONSTRAINT; Schema: cancle_stomach; Owner: gony
--

ALTER TABLE ONLY cancle_stomach.gscn_trtm_srpr
    ADD CONSTRAINT gscn_trtm_srpr_pk PRIMARY KEY (hosp_cd, pt_sbst_no, esd_srpr_ymd, esd_srpr_seq);


--
-- TOC entry 3631 (class 2606 OID 25057)
-- Name: cncr_code_meta cncr_code_meta_pk; Type: CONSTRAINT; Schema: public; Owner: gony
--

ALTER TABLE ONLY public.cncr_code_meta
    ADD CONSTRAINT cncr_code_meta_pk PRIMARY KEY (hosp_cd, cd_clcd, cd_id, cd_vl);


--
-- TOC entry 3633 (class 2606 OID 25066)
-- Name: cncr_rgst cncr_rgst_pk; Type: CONSTRAINT; Schema: public; Owner: gony
--

ALTER TABLE ONLY public.cncr_rgst
    ADD CONSTRAINT cncr_rgst_pk PRIMARY KEY (hcode, ptno, fdx, cncr_rgst_seq);


--
-- TOC entry 3780 (class 2606 OID 33264)
-- Name: ecrf_col_info ecrf_col_info_pk; Type: CONSTRAINT; Schema: public; Owner: gony
--

ALTER TABLE ONLY public.ecrf_col_info
    ADD CONSTRAINT ecrf_col_info_pk PRIMARY KEY (tbl_enm, col_enm);


--
-- TOC entry 3778 (class 2606 OID 33266)
-- Name: ecrf_tbl_dfnd ecrf_tbl_dfnd_pk; Type: CONSTRAINT; Schema: public; Owner: gony
--

ALTER TABLE ONLY public.ecrf_tbl_dfnd
    ADD CONSTRAINT ecrf_tbl_dfnd_pk PRIMARY KEY (tbl_enm);


--
-- TOC entry 3776 (class 2606 OID 33248)
-- Name: ecrf_user ecrf_user_pk; Type: CONSTRAINT; Schema: public; Owner: gony
--

ALTER TABLE ONLY public.ecrf_user
    ADD CONSTRAINT ecrf_user_pk PRIMARY KEY (user_id);


--
-- TOC entry 3539 (class 2606 OID 16397)
-- Name: tb_test tb_test_pk; Type: CONSTRAINT; Schema: public; Owner: gony
--

ALTER TABLE ONLY public.tb_test
    ADD CONSTRAINT tb_test_pk PRIMARY KEY (id);


--
-- TOC entry 3678 (class 1259 OID 25467)
-- Name: idx_attribute_definition_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_attribute_definition_id ON baseline.attribute_definition USING btree (attribute_definition_id);

ALTER TABLE baseline.attribute_definition CLUSTER ON idx_attribute_definition_id;


--
-- TOC entry 3759 (class 1259 OID 25601)
-- Name: idx_ca_definition_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_ca_definition_id ON baseline.cohort_attribute USING btree (cohort_definition_id);


--
-- TOC entry 3760 (class 1259 OID 25600)
-- Name: idx_ca_subject_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_ca_subject_id ON baseline.cohort_attribute USING btree (subject_id);


--
-- TOC entry 3755 (class 1259 OID 25599)
-- Name: idx_cohort_c_definition_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_cohort_c_definition_id ON baseline.cohort USING btree (cohort_definition_id);


--
-- TOC entry 3675 (class 1259 OID 25459)
-- Name: idx_cohort_definition_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_cohort_definition_id ON baseline.cohort_definition USING btree (cohort_definition_id);

ALTER TABLE baseline.cohort_definition CLUSTER ON idx_cohort_definition_id;


--
-- TOC entry 3756 (class 1259 OID 25598)
-- Name: idx_cohort_subject_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_cohort_subject_id ON baseline.cohort USING btree (subject_id);


--
-- TOC entry 3661 (class 1259 OID 25434)
-- Name: idx_concept_ancestor_id_1; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_ancestor_id_1 ON baseline.concept_ancestor USING btree (ancestor_concept_id);

ALTER TABLE baseline.concept_ancestor CLUSTER ON idx_concept_ancestor_id_1;


--
-- TOC entry 3662 (class 1259 OID 25440)
-- Name: idx_concept_ancestor_id_2; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_ancestor_id_2 ON baseline.concept_ancestor USING btree (descendant_concept_id);


--
-- TOC entry 3647 (class 1259 OID 25412)
-- Name: idx_concept_class_class_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE UNIQUE INDEX idx_concept_class_class_id ON baseline.concept_class USING btree (concept_class_id);

ALTER TABLE baseline.concept_class CLUSTER ON idx_concept_class_class_id;


--
-- TOC entry 3634 (class 1259 OID 25397)
-- Name: idx_concept_class_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_class_id ON baseline.concept USING btree (concept_class_id);


--
-- TOC entry 3635 (class 1259 OID 25394)
-- Name: idx_concept_code; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_code ON baseline.concept USING btree (concept_code);


--
-- TOC entry 3636 (class 1259 OID 25388)
-- Name: idx_concept_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE UNIQUE INDEX idx_concept_concept_id ON baseline.concept USING btree (concept_id);

ALTER TABLE baseline.concept CLUSTER ON idx_concept_concept_id;


--
-- TOC entry 3637 (class 1259 OID 25396)
-- Name: idx_concept_domain_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_domain_id ON baseline.concept USING btree (domain_id);


--
-- TOC entry 3650 (class 1259 OID 25418)
-- Name: idx_concept_relationship_id_1; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_relationship_id_1 ON baseline.concept_relationship USING btree (concept_id_1);


--
-- TOC entry 3651 (class 1259 OID 25419)
-- Name: idx_concept_relationship_id_2; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_relationship_id_2 ON baseline.concept_relationship USING btree (concept_id_2);


--
-- TOC entry 3652 (class 1259 OID 25420)
-- Name: idx_concept_relationship_id_3; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_relationship_id_3 ON baseline.concept_relationship USING btree (relationship_id);


--
-- TOC entry 3658 (class 1259 OID 25427)
-- Name: idx_concept_synonym_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_synonym_id ON baseline.concept_synonym USING btree (concept_id);

ALTER TABLE baseline.concept_synonym CLUSTER ON idx_concept_synonym_id;


--
-- TOC entry 3638 (class 1259 OID 25395)
-- Name: idx_concept_vocabluary_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_concept_vocabluary_id ON baseline.concept USING btree (vocabulary_id);


--
-- TOC entry 3717 (class 1259 OID 25548)
-- Name: idx_condition_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_condition_concept_id ON baseline.condition_occurrence USING btree (condition_concept_id);


--
-- TOC entry 3771 (class 1259 OID 25624)
-- Name: idx_condition_era_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_condition_era_concept_id ON baseline.condition_era USING btree (condition_concept_id);


--
-- TOC entry 3772 (class 1259 OID 25618)
-- Name: idx_condition_era_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_condition_era_person_id ON baseline.condition_era USING btree (person_id);

ALTER TABLE baseline.condition_era CLUSTER ON idx_condition_era_person_id;


--
-- TOC entry 3718 (class 1259 OID 25542)
-- Name: idx_condition_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_condition_person_id ON baseline.condition_occurrence USING btree (person_id);

ALTER TABLE baseline.condition_occurrence CLUSTER ON idx_condition_person_id;


--
-- TOC entry 3719 (class 1259 OID 25549)
-- Name: idx_condition_visit_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_condition_visit_id ON baseline.condition_occurrence USING btree (visit_occurrence_id);


--
-- TOC entry 3691 (class 1259 OID 25496)
-- Name: idx_death_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_death_person_id ON baseline.death USING btree (person_id);

ALTER TABLE baseline.death CLUSTER ON idx_death_person_id;


--
-- TOC entry 3712 (class 1259 OID 25540)
-- Name: idx_device_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_device_concept_id ON baseline.device_exposure USING btree (device_concept_id);


--
-- TOC entry 3713 (class 1259 OID 25534)
-- Name: idx_device_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_device_person_id ON baseline.device_exposure USING btree (person_id);

ALTER TABLE baseline.device_exposure CLUSTER ON idx_device_person_id;


--
-- TOC entry 3714 (class 1259 OID 25541)
-- Name: idx_device_visit_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_device_visit_id ON baseline.device_exposure USING btree (visit_occurrence_id);


--
-- TOC entry 3644 (class 1259 OID 25406)
-- Name: idx_domain_domain_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE UNIQUE INDEX idx_domain_domain_id ON baseline.domain USING btree (domain_id);

ALTER TABLE baseline.domain CLUSTER ON idx_domain_domain_id;


--
-- TOC entry 3767 (class 1259 OID 25617)
-- Name: idx_dose_era_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_dose_era_concept_id ON baseline.dose_era USING btree (drug_concept_id);


--
-- TOC entry 3768 (class 1259 OID 25609)
-- Name: idx_dose_era_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_dose_era_person_id ON baseline.dose_era USING btree (person_id);

ALTER TABLE baseline.dose_era CLUSTER ON idx_dose_era_person_id;


--
-- TOC entry 3707 (class 1259 OID 25532)
-- Name: idx_drug_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_drug_concept_id ON baseline.drug_exposure USING btree (drug_concept_id);


--
-- TOC entry 3763 (class 1259 OID 25608)
-- Name: idx_drug_era_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_drug_era_concept_id ON baseline.drug_era USING btree (drug_concept_id);


--
-- TOC entry 3764 (class 1259 OID 25602)
-- Name: idx_drug_era_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_drug_era_person_id ON baseline.drug_era USING btree (person_id);

ALTER TABLE baseline.drug_era CLUSTER ON idx_drug_era_person_id;


--
-- TOC entry 3708 (class 1259 OID 25524)
-- Name: idx_drug_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_drug_person_id ON baseline.drug_exposure USING btree (person_id);

ALTER TABLE baseline.drug_exposure CLUSTER ON idx_drug_person_id;


--
-- TOC entry 3671 (class 1259 OID 25450)
-- Name: idx_drug_strength_id_1; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_drug_strength_id_1 ON baseline.drug_strength USING btree (drug_concept_id);

ALTER TABLE baseline.drug_strength CLUSTER ON idx_drug_strength_id_1;


--
-- TOC entry 3672 (class 1259 OID 25458)
-- Name: idx_drug_strength_id_2; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_drug_strength_id_2 ON baseline.drug_strength USING btree (ingredient_concept_id);


--
-- TOC entry 3709 (class 1259 OID 25533)
-- Name: idx_drug_visit_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_drug_visit_id ON baseline.drug_exposure USING btree (visit_occurrence_id);


--
-- TOC entry 3741 (class 1259 OID 25589)
-- Name: idx_fact_relationship_id_1; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_fact_relationship_id_1 ON baseline.fact_relationship USING btree (domain_concept_id_1);


--
-- TOC entry 3742 (class 1259 OID 25590)
-- Name: idx_fact_relationship_id_2; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_fact_relationship_id_2 ON baseline.fact_relationship USING btree (domain_concept_id_2);


--
-- TOC entry 3743 (class 1259 OID 25591)
-- Name: idx_fact_relationship_id_3; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_fact_relationship_id_3 ON baseline.fact_relationship USING btree (relationship_concept_id);


--
-- TOC entry 3722 (class 1259 OID 25558)
-- Name: idx_measurement_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_measurement_concept_id ON baseline.measurement USING btree (measurement_concept_id);


--
-- TOC entry 3723 (class 1259 OID 25550)
-- Name: idx_measurement_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_measurement_person_id ON baseline.measurement USING btree (person_id);

ALTER TABLE baseline.measurement CLUSTER ON idx_measurement_person_id;


--
-- TOC entry 3724 (class 1259 OID 25559)
-- Name: idx_measurement_visit_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_measurement_visit_id ON baseline.measurement USING btree (visit_occurrence_id);


--
-- TOC entry 3727 (class 1259 OID 25568)
-- Name: idx_note_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_note_concept_id ON baseline.note USING btree (note_type_concept_id);


--
-- TOC entry 3732 (class 1259 OID 25578)
-- Name: idx_note_nlp_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_note_nlp_concept_id ON baseline.note_nlp USING btree (note_nlp_concept_id);


--
-- TOC entry 3733 (class 1259 OID 25570)
-- Name: idx_note_nlp_note_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_note_nlp_note_id ON baseline.note_nlp USING btree (note_id);

ALTER TABLE baseline.note_nlp CLUSTER ON idx_note_nlp_note_id;


--
-- TOC entry 3728 (class 1259 OID 25560)
-- Name: idx_note_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_note_person_id ON baseline.note USING btree (person_id);

ALTER TABLE baseline.note CLUSTER ON idx_note_person_id;


--
-- TOC entry 3729 (class 1259 OID 25569)
-- Name: idx_note_visit_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_note_visit_id ON baseline.note USING btree (visit_occurrence_id);


--
-- TOC entry 3736 (class 1259 OID 25587)
-- Name: idx_observation_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_observation_concept_id ON baseline.observation USING btree (observation_concept_id);


--
-- TOC entry 3684 (class 1259 OID 25481)
-- Name: idx_observation_period_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_observation_period_id ON baseline.observation_period USING btree (person_id);

ALTER TABLE baseline.observation_period CLUSTER ON idx_observation_period_id;


--
-- TOC entry 3737 (class 1259 OID 25579)
-- Name: idx_observation_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_observation_person_id ON baseline.observation USING btree (person_id);

ALTER TABLE baseline.observation CLUSTER ON idx_observation_person_id;


--
-- TOC entry 3738 (class 1259 OID 25588)
-- Name: idx_observation_visit_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_observation_visit_id ON baseline.observation USING btree (visit_occurrence_id);


--
-- TOC entry 3750 (class 1259 OID 25592)
-- Name: idx_period_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_period_person_id ON baseline.payer_plan_period USING btree (person_id);

ALTER TABLE baseline.payer_plan_period CLUSTER ON idx_period_person_id;


--
-- TOC entry 3681 (class 1259 OID 25475)
-- Name: idx_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE UNIQUE INDEX idx_person_id ON baseline.person USING btree (person_id);

ALTER TABLE baseline.person CLUSTER ON idx_person_id;


--
-- TOC entry 3702 (class 1259 OID 25522)
-- Name: idx_procedure_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_procedure_concept_id ON baseline.procedure_occurrence USING btree (procedure_concept_id);


--
-- TOC entry 3703 (class 1259 OID 25516)
-- Name: idx_procedure_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_procedure_person_id ON baseline.procedure_occurrence USING btree (person_id);

ALTER TABLE baseline.procedure_occurrence CLUSTER ON idx_procedure_person_id;


--
-- TOC entry 3704 (class 1259 OID 25523)
-- Name: idx_procedure_visit_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_procedure_visit_id ON baseline.procedure_occurrence USING btree (visit_occurrence_id);


--
-- TOC entry 3655 (class 1259 OID 25421)
-- Name: idx_relationship_rel_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE UNIQUE INDEX idx_relationship_rel_id ON baseline.relationship USING btree (relationship_id);

ALTER TABLE baseline.relationship CLUSTER ON idx_relationship_rel_id;


--
-- TOC entry 3665 (class 1259 OID 25449)
-- Name: idx_source_to_concept_map_code; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_source_to_concept_map_code ON baseline.source_to_concept_map USING btree (source_code);


--
-- TOC entry 3666 (class 1259 OID 25447)
-- Name: idx_source_to_concept_map_id_1; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_source_to_concept_map_id_1 ON baseline.source_to_concept_map USING btree (source_vocabulary_id);


--
-- TOC entry 3667 (class 1259 OID 25448)
-- Name: idx_source_to_concept_map_id_2; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_source_to_concept_map_id_2 ON baseline.source_to_concept_map USING btree (target_vocabulary_id);


--
-- TOC entry 3668 (class 1259 OID 25441)
-- Name: idx_source_to_concept_map_id_3; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_source_to_concept_map_id_3 ON baseline.source_to_concept_map USING btree (target_concept_id);

ALTER TABLE baseline.source_to_concept_map CLUSTER ON idx_source_to_concept_map_id_3;


--
-- TOC entry 3687 (class 1259 OID 25495)
-- Name: idx_specimen_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_specimen_concept_id ON baseline.specimen USING btree (specimen_concept_id);


--
-- TOC entry 3688 (class 1259 OID 25487)
-- Name: idx_specimen_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_specimen_person_id ON baseline.specimen USING btree (person_id);

ALTER TABLE baseline.specimen CLUSTER ON idx_specimen_person_id;


--
-- TOC entry 3694 (class 1259 OID 25508)
-- Name: idx_visit_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_visit_concept_id ON baseline.visit_occurrence USING btree (visit_concept_id);


--
-- TOC entry 3698 (class 1259 OID 25515)
-- Name: idx_visit_detail_concept_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_visit_detail_concept_id ON baseline.visit_detail USING btree (visit_detail_concept_id);


--
-- TOC entry 3699 (class 1259 OID 25509)
-- Name: idx_visit_detail_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_visit_detail_person_id ON baseline.visit_detail USING btree (person_id);

ALTER TABLE baseline.visit_detail CLUSTER ON idx_visit_detail_person_id;


--
-- TOC entry 3695 (class 1259 OID 25502)
-- Name: idx_visit_person_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE INDEX idx_visit_person_id ON baseline.visit_occurrence USING btree (person_id);

ALTER TABLE baseline.visit_occurrence CLUSTER ON idx_visit_person_id;


--
-- TOC entry 3641 (class 1259 OID 25398)
-- Name: idx_vocabulary_vocabulary_id; Type: INDEX; Schema: baseline; Owner: gony
--

CREATE UNIQUE INDEX idx_vocabulary_vocabulary_id ON baseline.vocabulary USING btree (vocabulary_id);

ALTER TABLE baseline.vocabulary CLUSTER ON idx_vocabulary_vocabulary_id;


--
-- TOC entry 3845 (class 2606 OID 32838)
-- Name: visit_detail fpd_v_detail_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpd_v_detail_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3807 (class 2606 OID 26016)
-- Name: attribute_definition fpk_attribute_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.attribute_definition
    ADD CONSTRAINT fpk_attribute_type_concept FOREIGN KEY (attribute_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3916 (class 2606 OID 33193)
-- Name: cohort_attribute fpk_ca_attribute_definition; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort_attribute
    ADD CONSTRAINT fpk_ca_attribute_definition FOREIGN KEY (attribute_definition_id) REFERENCES baseline.attribute_definition(attribute_definition_id);


--
-- TOC entry 3915 (class 2606 OID 33188)
-- Name: cohort_attribute fpk_ca_cohort_definition; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort_attribute
    ADD CONSTRAINT fpk_ca_cohort_definition FOREIGN KEY (cohort_definition_id) REFERENCES baseline.cohort_definition(cohort_definition_id);


--
-- TOC entry 3917 (class 2606 OID 33198)
-- Name: cohort_attribute fpk_ca_value; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort_attribute
    ADD CONSTRAINT fpk_ca_value FOREIGN KEY (value_as_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3904 (class 2606 OID 33133)
-- Name: care_site fpk_care_site_location; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.care_site
    ADD CONSTRAINT fpk_care_site_location FOREIGN KEY (location_id) REFERENCES baseline.location(location_id);


--
-- TOC entry 3905 (class 2606 OID 33138)
-- Name: care_site fpk_care_site_place; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.care_site
    ADD CONSTRAINT fpk_care_site_place FOREIGN KEY (place_of_service_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3805 (class 2606 OID 26006)
-- Name: cohort_definition fpk_cohort_definition_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort_definition
    ADD CONSTRAINT fpk_cohort_definition_concept FOREIGN KEY (definition_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3806 (class 2606 OID 26011)
-- Name: cohort_definition fpk_cohort_subject_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cohort_definition
    ADD CONSTRAINT fpk_cohort_subject_concept FOREIGN KEY (subject_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3794 (class 2606 OID 25951)
-- Name: concept_ancestor fpk_concept_ancestor_concept_1; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_ancestor
    ADD CONSTRAINT fpk_concept_ancestor_concept_1 FOREIGN KEY (ancestor_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3795 (class 2606 OID 25956)
-- Name: concept_ancestor fpk_concept_ancestor_concept_2; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_ancestor
    ADD CONSTRAINT fpk_concept_ancestor_concept_2 FOREIGN KEY (descendant_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3782 (class 2606 OID 25891)
-- Name: concept fpk_concept_class; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept
    ADD CONSTRAINT fpk_concept_class FOREIGN KEY (concept_class_id) REFERENCES baseline.concept_class(concept_class_id);


--
-- TOC entry 3786 (class 2606 OID 25911)
-- Name: concept_class fpk_concept_class_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_class
    ADD CONSTRAINT fpk_concept_class_concept FOREIGN KEY (concept_class_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3781 (class 2606 OID 25886)
-- Name: concept fpk_concept_domain; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept
    ADD CONSTRAINT fpk_concept_domain FOREIGN KEY (domain_id) REFERENCES baseline.domain(domain_id);


--
-- TOC entry 3787 (class 2606 OID 25916)
-- Name: concept_relationship fpk_concept_relationship_c_1; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_relationship
    ADD CONSTRAINT fpk_concept_relationship_c_1 FOREIGN KEY (concept_id_1) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3788 (class 2606 OID 25921)
-- Name: concept_relationship fpk_concept_relationship_c_2; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_relationship
    ADD CONSTRAINT fpk_concept_relationship_c_2 FOREIGN KEY (concept_id_2) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3789 (class 2606 OID 25926)
-- Name: concept_relationship fpk_concept_relationship_id; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_relationship
    ADD CONSTRAINT fpk_concept_relationship_id FOREIGN KEY (relationship_id) REFERENCES baseline.relationship(relationship_id);


--
-- TOC entry 3792 (class 2606 OID 25941)
-- Name: concept_synonym fpk_concept_synonym_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_synonym
    ADD CONSTRAINT fpk_concept_synonym_concept FOREIGN KEY (concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3793 (class 2606 OID 25946)
-- Name: concept_synonym fpk_concept_synonym_language; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept_synonym
    ADD CONSTRAINT fpk_concept_synonym_language FOREIGN KEY (language_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3783 (class 2606 OID 25896)
-- Name: concept fpk_concept_vocabulary; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.concept
    ADD CONSTRAINT fpk_concept_vocabulary FOREIGN KEY (vocabulary_id) REFERENCES baseline.vocabulary(vocabulary_id);


--
-- TOC entry 3867 (class 2606 OID 32948)
-- Name: condition_occurrence fpk_condition_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT fpk_condition_concept FOREIGN KEY (condition_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3871 (class 2606 OID 32968)
-- Name: condition_occurrence fpk_condition_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT fpk_condition_concept_s FOREIGN KEY (condition_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3924 (class 2606 OID 33233)
-- Name: condition_era fpk_condition_era_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_era
    ADD CONSTRAINT fpk_condition_era_concept FOREIGN KEY (condition_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3923 (class 2606 OID 33228)
-- Name: condition_era fpk_condition_era_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_era
    ADD CONSTRAINT fpk_condition_era_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3866 (class 2606 OID 32943)
-- Name: condition_occurrence fpk_condition_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT fpk_condition_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3869 (class 2606 OID 32958)
-- Name: condition_occurrence fpk_condition_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT fpk_condition_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3872 (class 2606 OID 32973)
-- Name: condition_occurrence fpk_condition_status_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT fpk_condition_status_concept FOREIGN KEY (condition_status_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3868 (class 2606 OID 32953)
-- Name: condition_occurrence fpk_condition_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT fpk_condition_type_concept FOREIGN KEY (condition_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3870 (class 2606 OID 32963)
-- Name: condition_occurrence fpk_condition_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.condition_occurrence
    ADD CONSTRAINT fpk_condition_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3827 (class 2606 OID 26241)
-- Name: death fpk_death_cause_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.death
    ADD CONSTRAINT fpk_death_cause_concept FOREIGN KEY (cause_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3828 (class 2606 OID 26246)
-- Name: death fpk_death_cause_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.death
    ADD CONSTRAINT fpk_death_cause_concept_s FOREIGN KEY (cause_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3825 (class 2606 OID 26231)
-- Name: death fpk_death_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.death
    ADD CONSTRAINT fpk_death_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3826 (class 2606 OID 26236)
-- Name: death fpk_death_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.death
    ADD CONSTRAINT fpk_death_type_concept FOREIGN KEY (death_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3861 (class 2606 OID 32918)
-- Name: device_exposure fpk_device_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.device_exposure
    ADD CONSTRAINT fpk_device_concept FOREIGN KEY (device_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3865 (class 2606 OID 32938)
-- Name: device_exposure fpk_device_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.device_exposure
    ADD CONSTRAINT fpk_device_concept_s FOREIGN KEY (device_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3860 (class 2606 OID 32913)
-- Name: device_exposure fpk_device_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.device_exposure
    ADD CONSTRAINT fpk_device_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3863 (class 2606 OID 32928)
-- Name: device_exposure fpk_device_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.device_exposure
    ADD CONSTRAINT fpk_device_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3862 (class 2606 OID 32923)
-- Name: device_exposure fpk_device_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.device_exposure
    ADD CONSTRAINT fpk_device_type_concept FOREIGN KEY (device_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3864 (class 2606 OID 32933)
-- Name: device_exposure fpk_device_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.device_exposure
    ADD CONSTRAINT fpk_device_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3785 (class 2606 OID 25906)
-- Name: domain fpk_domain_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.domain
    ADD CONSTRAINT fpk_domain_concept FOREIGN KEY (domain_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3921 (class 2606 OID 33218)
-- Name: dose_era fpk_dose_era_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.dose_era
    ADD CONSTRAINT fpk_dose_era_concept FOREIGN KEY (drug_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3920 (class 2606 OID 33213)
-- Name: dose_era fpk_dose_era_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.dose_era
    ADD CONSTRAINT fpk_dose_era_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3922 (class 2606 OID 33223)
-- Name: dose_era fpk_dose_era_unit_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.dose_era
    ADD CONSTRAINT fpk_dose_era_unit_concept FOREIGN KEY (unit_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3914 (class 2606 OID 33183)
-- Name: cost fpk_drg_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cost
    ADD CONSTRAINT fpk_drg_concept FOREIGN KEY (drg_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3854 (class 2606 OID 32883)
-- Name: drug_exposure fpk_drug_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT fpk_drug_concept FOREIGN KEY (drug_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3859 (class 2606 OID 32908)
-- Name: drug_exposure fpk_drug_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT fpk_drug_concept_s FOREIGN KEY (drug_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3919 (class 2606 OID 33208)
-- Name: drug_era fpk_drug_era_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_era
    ADD CONSTRAINT fpk_drug_era_concept FOREIGN KEY (drug_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3918 (class 2606 OID 33203)
-- Name: drug_era fpk_drug_era_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_era
    ADD CONSTRAINT fpk_drug_era_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3853 (class 2606 OID 32878)
-- Name: drug_exposure fpk_drug_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT fpk_drug_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3857 (class 2606 OID 32898)
-- Name: drug_exposure fpk_drug_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT fpk_drug_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3856 (class 2606 OID 32893)
-- Name: drug_exposure fpk_drug_route_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT fpk_drug_route_concept FOREIGN KEY (route_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3800 (class 2606 OID 25981)
-- Name: drug_strength fpk_drug_strength_concept_1; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_strength
    ADD CONSTRAINT fpk_drug_strength_concept_1 FOREIGN KEY (drug_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3801 (class 2606 OID 25986)
-- Name: drug_strength fpk_drug_strength_concept_2; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_strength
    ADD CONSTRAINT fpk_drug_strength_concept_2 FOREIGN KEY (ingredient_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3802 (class 2606 OID 25991)
-- Name: drug_strength fpk_drug_strength_unit_1; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_strength
    ADD CONSTRAINT fpk_drug_strength_unit_1 FOREIGN KEY (amount_unit_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3803 (class 2606 OID 25996)
-- Name: drug_strength fpk_drug_strength_unit_2; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_strength
    ADD CONSTRAINT fpk_drug_strength_unit_2 FOREIGN KEY (numerator_unit_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3804 (class 2606 OID 26001)
-- Name: drug_strength fpk_drug_strength_unit_3; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_strength
    ADD CONSTRAINT fpk_drug_strength_unit_3 FOREIGN KEY (denominator_unit_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3855 (class 2606 OID 32888)
-- Name: drug_exposure fpk_drug_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT fpk_drug_type_concept FOREIGN KEY (drug_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3858 (class 2606 OID 32903)
-- Name: drug_exposure fpk_drug_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.drug_exposure
    ADD CONSTRAINT fpk_drug_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3901 (class 2606 OID 33118)
-- Name: fact_relationship fpk_fact_domain_1; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.fact_relationship
    ADD CONSTRAINT fpk_fact_domain_1 FOREIGN KEY (domain_concept_id_1) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3902 (class 2606 OID 33123)
-- Name: fact_relationship fpk_fact_domain_2; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.fact_relationship
    ADD CONSTRAINT fpk_fact_domain_2 FOREIGN KEY (domain_concept_id_2) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3903 (class 2606 OID 33128)
-- Name: fact_relationship fpk_fact_relationship; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.fact_relationship
    ADD CONSTRAINT fpk_fact_relationship FOREIGN KEY (relationship_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3886 (class 2606 OID 33043)
-- Name: note fpk_language_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT fpk_language_concept FOREIGN KEY (language_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3874 (class 2606 OID 32983)
-- Name: measurement fpk_measurement_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_concept FOREIGN KEY (measurement_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3881 (class 2606 OID 33018)
-- Name: measurement fpk_measurement_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_concept_s FOREIGN KEY (measurement_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3876 (class 2606 OID 32993)
-- Name: measurement fpk_measurement_operator; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_operator FOREIGN KEY (operator_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3873 (class 2606 OID 32978)
-- Name: measurement fpk_measurement_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3879 (class 2606 OID 33008)
-- Name: measurement fpk_measurement_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3875 (class 2606 OID 32988)
-- Name: measurement fpk_measurement_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_type_concept FOREIGN KEY (measurement_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3878 (class 2606 OID 33003)
-- Name: measurement fpk_measurement_unit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_unit FOREIGN KEY (unit_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3877 (class 2606 OID 32998)
-- Name: measurement fpk_measurement_value; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_value FOREIGN KEY (value_as_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3880 (class 2606 OID 33013)
-- Name: measurement fpk_measurement_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.measurement
    ADD CONSTRAINT fpk_measurement_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3884 (class 2606 OID 33033)
-- Name: note fpk_note_class_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT fpk_note_class_concept FOREIGN KEY (note_class_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3885 (class 2606 OID 33038)
-- Name: note fpk_note_encoding_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT fpk_note_encoding_concept FOREIGN KEY (encoding_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3891 (class 2606 OID 33068)
-- Name: note_nlp fpk_note_nlp_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note_nlp
    ADD CONSTRAINT fpk_note_nlp_concept FOREIGN KEY (note_nlp_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3889 (class 2606 OID 33058)
-- Name: note_nlp fpk_note_nlp_note; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note_nlp
    ADD CONSTRAINT fpk_note_nlp_note FOREIGN KEY (note_id) REFERENCES baseline.note(note_id);


--
-- TOC entry 3890 (class 2606 OID 33063)
-- Name: note_nlp fpk_note_nlp_section_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note_nlp
    ADD CONSTRAINT fpk_note_nlp_section_concept FOREIGN KEY (section_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3882 (class 2606 OID 33023)
-- Name: note fpk_note_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT fpk_note_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3887 (class 2606 OID 33048)
-- Name: note fpk_note_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT fpk_note_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3883 (class 2606 OID 33028)
-- Name: note fpk_note_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT fpk_note_type_concept FOREIGN KEY (note_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3888 (class 2606 OID 33053)
-- Name: note fpk_note_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.note
    ADD CONSTRAINT fpk_note_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3893 (class 2606 OID 33078)
-- Name: observation fpk_observation_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_concept FOREIGN KEY (observation_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3900 (class 2606 OID 33113)
-- Name: observation fpk_observation_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_concept_s FOREIGN KEY (observation_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3818 (class 2606 OID 26196)
-- Name: observation_period fpk_observation_period_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation_period
    ADD CONSTRAINT fpk_observation_period_concept FOREIGN KEY (period_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3817 (class 2606 OID 26191)
-- Name: observation_period fpk_observation_period_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation_period
    ADD CONSTRAINT fpk_observation_period_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3892 (class 2606 OID 33073)
-- Name: observation fpk_observation_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3898 (class 2606 OID 33103)
-- Name: observation fpk_observation_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3896 (class 2606 OID 33093)
-- Name: observation fpk_observation_qualifier; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_qualifier FOREIGN KEY (qualifier_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3894 (class 2606 OID 33083)
-- Name: observation fpk_observation_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_type_concept FOREIGN KEY (observation_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3897 (class 2606 OID 33098)
-- Name: observation fpk_observation_unit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_unit FOREIGN KEY (unit_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3895 (class 2606 OID 33088)
-- Name: observation fpk_observation_value; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_value FOREIGN KEY (value_as_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3899 (class 2606 OID 33108)
-- Name: observation fpk_observation_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.observation
    ADD CONSTRAINT fpk_observation_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3911 (class 2606 OID 33168)
-- Name: payer_plan_period fpk_payer_plan_period; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.payer_plan_period
    ADD CONSTRAINT fpk_payer_plan_period FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3816 (class 2606 OID 26186)
-- Name: person fpk_person_care_site; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_care_site FOREIGN KEY (care_site_id) REFERENCES baseline.care_site(care_site_id);


--
-- TOC entry 3810 (class 2606 OID 26156)
-- Name: person fpk_person_ethnicity_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_ethnicity_concept FOREIGN KEY (ethnicity_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3813 (class 2606 OID 26171)
-- Name: person fpk_person_ethnicity_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_ethnicity_concept_s FOREIGN KEY (ethnicity_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3808 (class 2606 OID 26146)
-- Name: person fpk_person_gender_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_gender_concept FOREIGN KEY (gender_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3811 (class 2606 OID 26161)
-- Name: person fpk_person_gender_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_gender_concept_s FOREIGN KEY (gender_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3814 (class 2606 OID 26176)
-- Name: person fpk_person_location; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_location FOREIGN KEY (location_id) REFERENCES baseline.location(location_id);


--
-- TOC entry 3815 (class 2606 OID 26181)
-- Name: person fpk_person_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3809 (class 2606 OID 26151)
-- Name: person fpk_person_race_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_race_concept FOREIGN KEY (race_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3812 (class 2606 OID 26166)
-- Name: person fpk_person_race_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.person
    ADD CONSTRAINT fpk_person_race_concept_s FOREIGN KEY (race_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3847 (class 2606 OID 32848)
-- Name: procedure_occurrence fpk_procedure_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT fpk_procedure_concept FOREIGN KEY (procedure_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3852 (class 2606 OID 32873)
-- Name: procedure_occurrence fpk_procedure_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT fpk_procedure_concept_s FOREIGN KEY (procedure_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3849 (class 2606 OID 32858)
-- Name: procedure_occurrence fpk_procedure_modifier; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT fpk_procedure_modifier FOREIGN KEY (modifier_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3846 (class 2606 OID 32843)
-- Name: procedure_occurrence fpk_procedure_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT fpk_procedure_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3850 (class 2606 OID 32863)
-- Name: procedure_occurrence fpk_procedure_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT fpk_procedure_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3848 (class 2606 OID 32853)
-- Name: procedure_occurrence fpk_procedure_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT fpk_procedure_type_concept FOREIGN KEY (procedure_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3851 (class 2606 OID 32868)
-- Name: procedure_occurrence fpk_procedure_visit; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.procedure_occurrence
    ADD CONSTRAINT fpk_procedure_visit FOREIGN KEY (visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3907 (class 2606 OID 33148)
-- Name: provider fpk_provider_care_site; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.provider
    ADD CONSTRAINT fpk_provider_care_site FOREIGN KEY (care_site_id) REFERENCES baseline.care_site(care_site_id);


--
-- TOC entry 3908 (class 2606 OID 33153)
-- Name: provider fpk_provider_gender; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.provider
    ADD CONSTRAINT fpk_provider_gender FOREIGN KEY (gender_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3910 (class 2606 OID 33163)
-- Name: provider fpk_provider_gender_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.provider
    ADD CONSTRAINT fpk_provider_gender_s FOREIGN KEY (gender_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3906 (class 2606 OID 33143)
-- Name: provider fpk_provider_specialty; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.provider
    ADD CONSTRAINT fpk_provider_specialty FOREIGN KEY (specialty_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3909 (class 2606 OID 33158)
-- Name: provider fpk_provider_specialty_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.provider
    ADD CONSTRAINT fpk_provider_specialty_s FOREIGN KEY (specialty_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3790 (class 2606 OID 25931)
-- Name: relationship fpk_relationship_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.relationship
    ADD CONSTRAINT fpk_relationship_concept FOREIGN KEY (relationship_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3791 (class 2606 OID 25936)
-- Name: relationship fpk_relationship_reverse; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.relationship
    ADD CONSTRAINT fpk_relationship_reverse FOREIGN KEY (reverse_relationship_id) REFERENCES baseline.relationship(relationship_id);


--
-- TOC entry 3797 (class 2606 OID 25966)
-- Name: source_to_concept_map fpk_source_concept_id; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.source_to_concept_map
    ADD CONSTRAINT fpk_source_concept_id FOREIGN KEY (source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3799 (class 2606 OID 25976)
-- Name: source_to_concept_map fpk_source_to_concept_map_c_1; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.source_to_concept_map
    ADD CONSTRAINT fpk_source_to_concept_map_c_1 FOREIGN KEY (target_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3796 (class 2606 OID 25961)
-- Name: source_to_concept_map fpk_source_to_concept_map_v_1; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.source_to_concept_map
    ADD CONSTRAINT fpk_source_to_concept_map_v_1 FOREIGN KEY (source_vocabulary_id) REFERENCES baseline.vocabulary(vocabulary_id);


--
-- TOC entry 3798 (class 2606 OID 25971)
-- Name: source_to_concept_map fpk_source_to_concept_map_v_2; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.source_to_concept_map
    ADD CONSTRAINT fpk_source_to_concept_map_v_2 FOREIGN KEY (target_vocabulary_id) REFERENCES baseline.vocabulary(vocabulary_id);


--
-- TOC entry 3820 (class 2606 OID 26206)
-- Name: specimen fpk_specimen_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.specimen
    ADD CONSTRAINT fpk_specimen_concept FOREIGN KEY (specimen_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3819 (class 2606 OID 26201)
-- Name: specimen fpk_specimen_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.specimen
    ADD CONSTRAINT fpk_specimen_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3823 (class 2606 OID 26221)
-- Name: specimen fpk_specimen_site_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.specimen
    ADD CONSTRAINT fpk_specimen_site_concept FOREIGN KEY (anatomic_site_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3824 (class 2606 OID 26226)
-- Name: specimen fpk_specimen_status_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.specimen
    ADD CONSTRAINT fpk_specimen_status_concept FOREIGN KEY (disease_status_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3821 (class 2606 OID 26211)
-- Name: specimen fpk_specimen_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.specimen
    ADD CONSTRAINT fpk_specimen_type_concept FOREIGN KEY (specimen_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3822 (class 2606 OID 26216)
-- Name: specimen fpk_specimen_unit_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.specimen
    ADD CONSTRAINT fpk_specimen_unit_concept FOREIGN KEY (unit_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3841 (class 2606 OID 32818)
-- Name: visit_detail fpk_v_detail_admitting_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_admitting_s FOREIGN KEY (admitting_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3839 (class 2606 OID 32808)
-- Name: visit_detail fpk_v_detail_care_site; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_care_site FOREIGN KEY (care_site_id) REFERENCES baseline.care_site(care_site_id);


--
-- TOC entry 3840 (class 2606 OID 32813)
-- Name: visit_detail fpk_v_detail_concept_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_concept_s FOREIGN KEY (visit_detail_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3842 (class 2606 OID 32823)
-- Name: visit_detail fpk_v_detail_discharge; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_discharge FOREIGN KEY (discharge_to_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3844 (class 2606 OID 32833)
-- Name: visit_detail fpk_v_detail_parent; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_parent FOREIGN KEY (visit_detail_parent_id) REFERENCES baseline.visit_detail(visit_detail_id);


--
-- TOC entry 3836 (class 2606 OID 32768)
-- Name: visit_detail fpk_v_detail_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3843 (class 2606 OID 32828)
-- Name: visit_detail fpk_v_detail_preceding; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_preceding FOREIGN KEY (preceding_visit_detail_id) REFERENCES baseline.visit_detail(visit_detail_id);


--
-- TOC entry 3838 (class 2606 OID 32803)
-- Name: visit_detail fpk_v_detail_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3837 (class 2606 OID 32798)
-- Name: visit_detail fpk_v_detail_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_detail
    ADD CONSTRAINT fpk_v_detail_type_concept FOREIGN KEY (visit_detail_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3834 (class 2606 OID 32788)
-- Name: visit_occurrence fpk_visit_admitting_s; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT fpk_visit_admitting_s FOREIGN KEY (admitting_source_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3832 (class 2606 OID 26286)
-- Name: visit_occurrence fpk_visit_care_site; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT fpk_visit_care_site FOREIGN KEY (care_site_id) REFERENCES baseline.care_site(care_site_id);


--
-- TOC entry 3912 (class 2606 OID 33173)
-- Name: cost fpk_visit_cost_currency; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cost
    ADD CONSTRAINT fpk_visit_cost_currency FOREIGN KEY (currency_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3913 (class 2606 OID 33178)
-- Name: cost fpk_visit_cost_period; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.cost
    ADD CONSTRAINT fpk_visit_cost_period FOREIGN KEY (payer_plan_period_id) REFERENCES baseline.payer_plan_period(payer_plan_period_id);


--
-- TOC entry 3835 (class 2606 OID 32793)
-- Name: visit_occurrence fpk_visit_discharge; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT fpk_visit_discharge FOREIGN KEY (discharge_to_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3829 (class 2606 OID 26271)
-- Name: visit_occurrence fpk_visit_person; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT fpk_visit_person FOREIGN KEY (person_id) REFERENCES baseline.person(person_id);


--
-- TOC entry 3833 (class 2606 OID 32773)
-- Name: visit_occurrence fpk_visit_preceding; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT fpk_visit_preceding FOREIGN KEY (preceding_visit_occurrence_id) REFERENCES baseline.visit_occurrence(visit_occurrence_id);


--
-- TOC entry 3831 (class 2606 OID 26281)
-- Name: visit_occurrence fpk_visit_provider; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT fpk_visit_provider FOREIGN KEY (provider_id) REFERENCES baseline.provider(provider_id);


--
-- TOC entry 3830 (class 2606 OID 26276)
-- Name: visit_occurrence fpk_visit_type_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.visit_occurrence
    ADD CONSTRAINT fpk_visit_type_concept FOREIGN KEY (visit_type_concept_id) REFERENCES baseline.concept(concept_id);


--
-- TOC entry 3784 (class 2606 OID 25901)
-- Name: vocabulary fpk_vocabulary_concept; Type: FK CONSTRAINT; Schema: baseline; Owner: gony
--

ALTER TABLE ONLY baseline.vocabulary
    ADD CONSTRAINT fpk_vocabulary_concept FOREIGN KEY (vocabulary_concept_id) REFERENCES baseline.concept(concept_id);


-- Completed on 2023-08-08 10:17:37

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-08-08 10:17:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2023-08-08 10:17:39

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-08-08 10:17:39

--
-- PostgreSQL database cluster dump complete
--

