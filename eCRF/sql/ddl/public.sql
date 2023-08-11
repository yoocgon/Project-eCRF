-- public.cncr_code_meta definition

-- Drop table

-- DROP TABLE public.cncr_code_meta;

CREATE TABLE public.cncr_code_meta (
	hosp_cd varchar(20) NOT NULL,
	cd_clcd varchar(20) NOT NULL,
	cd_id varchar(20) NOT NULL,
	cd_nm varchar(200) NOT NULL,
	cd_vl varchar(200) NOT NULL,
	cd_vl_nm varchar(200) NOT NULL,
	arry_ord_vl numeric(10) NOT NULL,
	cd_expl_cont varchar(4000) NULL,
	crtn_dt timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- public.cncr_rgst definition

-- Drop table

-- DROP TABLE public.cncr_rgst;

CREATE TABLE public.cncr_rgst (
	hcode varchar(20) NOT NULL,
	ptno varchar(15) NOT NULL,
	fdx varchar(8) NOT NULL,
	cncr_rgst_seq numeric(3) NOT NULL,
	brth varchar(6) NULL,
	age varchar(3) NULL,
	sex varchar(20) NULL,
	popcode varchar(20) NULL,
	popname varchar(50) NULL,
	frgcode varchar(20) NULL,
	frgname varchar(50) NULL,
	hmlscode varchar(20) NULL,
	hmlsname varchar(50) NULL,
	jobcode varchar(20) NULL,
	jobname varchar(50) NULL,
	job1 varchar(50) NULL,
	unknownjob varchar(50) NULL,
	visitpathcode varchar(20) NULL,
	visitpathname varchar(50) NULL,
	visitpath_desc varchar(50) NULL,
	tcode varchar(20) NULL,
	tcode1 varchar(200) NULL,
	tcode2 varchar(200) NULL,
	latercode varchar(20) NULL,
	latername varchar(100) NULL,
	mcode varchar(20) NULL,
	mcode1 varchar(200) NULL,
	mcode2 varchar(200) NULL,
	bunhwadocode varchar(20) NULL,
	bunhwadoname varchar(50) NULL,
	expire varchar(8) NULL,
	sain varchar(20) NULL,
	methodcode varchar(20) NULL,
	methodname varchar(100) NULL,
	method2 varchar(50) NULL,
	methodetc varchar(50) NULL,
	txcheckcode varchar(20) NULL,
	txcheckname varchar(50) NULL,
	tx varchar(5) NULL,
	txetc varchar(50) NULL,
	recoyear varchar(50) NULL,
	admisdate varchar(8) NULL,
	disdate varchar(8) NULL,
	dbyear varchar(4) NULL,
	inputday varchar(8) NULL,
	seeryear varchar(4) NULL,
	seercode varchar(20) NULL,
	seername varchar(100) NULL,
	stagecode varchar(50) NULL,
	stageyear varchar(4) NULL,
	stagedesc varchar(50) NULL,
	metacode1 varchar(20) NULL,
	metacode2 varchar(20) NULL,
	metacode3 varchar(20) NULL,
	crtn_dt timestamp NOT NULL
);


-- public.ecrf_col_info definition

-- Drop table

-- DROP TABLE public.ecrf_col_info;

CREATE TABLE public.ecrf_col_info (
	tbl_enm varchar(100) NOT NULL,
	col_enm varchar(100) NOT NULL,
	col_knm varchar(200) NULL,
	col_ord numeric(3) NULL,
	data_tp_cont varchar(100) NULL,
	pk_ord varchar(50) NULL,
	domn_nm varchar(1000) NULL,
	col_expl_cont varchar(4000) NULL,
	col_vl_cont varchar(4000) NULL,
	fltr_use_yn varchar(1) NOT NULL,
	fltr_expl_cont varchar(4000) NULL,
	fltr_vl_expl_cont varchar(4000) NULL,
	cd_id varchar(100) NULL,
	com_cd_ref_yn varchar(1) NOT NULL DEFAULT 'N'::character varying,
	frst_regp_id varchar(200) NOT NULL,
	frst_rgst_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
	last_modp_id varchar(200) NOT NULL,
	last_modf_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);


-- public.ecrf_tbl_dfnd definition

-- Drop table

-- DROP TABLE public.ecrf_tbl_dfnd;

CREATE TABLE public.ecrf_tbl_dfnd (
	tbl_enm varchar(100) NOT NULL,
	tbl_knm varchar(200) NULL,
	tbl_ord numeric(3) NULL,
	crcn_nm varchar(200) NULL,
	lcls_nm varchar(200) NULL,
	mcls_nm varchar(200) NULL,
	ldng_dtrn_cont varchar(100) NULL,
	coll_bldt_col_knm varchar(200) NULL,
	coll_bldt_col_enm varchar(200) NULL,
	frst_regp_id varchar(200) NOT NULL,
	frst_rgst_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
	last_modp_id varchar(200) NOT NULL,
	last_modf_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);


-- public.ecrf_user definition

-- Drop table

-- DROP TABLE public.ecrf_user;

CREATE TABLE public.ecrf_user (
	user_id varchar(200) NOT NULL,
	user_nm varchar(50) NULL,
	login_pswd varchar(1000) NULL,
	user_expl_cont varchar(4000) NULL,
	user_wthd_dt timestamp NULL,
	last_login_dt timestamp NULL,
	frst_regp_id varchar(200) NOT NULL,
	frst_rgst_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
	last_modp_id varchar(200) NOT NULL,
	last_modf_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);


-- public.tb_test definition

-- Drop table

-- DROP TABLE public.tb_test;

CREATE TABLE public.tb_test (
	id int4 NOT NULL,
	researcher text NULL,
	department text NULL,
	research text NULL,
	apply_step text NULL,
	apply_status text NULL,
	imported_data_exists bool NOT NULL DEFAULT false,
	data_export_request_exists bool NOT NULL DEFAULT false,
	data_export_approval_existence bool NOT NULL DEFAULT false,
	date_utilization_start_date timestamp NULL,
	data_utilization_end_date timestamp NULL
);