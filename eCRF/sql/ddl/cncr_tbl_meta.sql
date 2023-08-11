-- public.cncr_tbl_meta definition

-- Drop table

-- DROP TABLE public.cncr_tbl_meta;

CREATE TABLE public.cncr_tbl_meta (
	tbl_id varchar(20) NOT NULL,
	tbl_lcls_cd varchar(20) NULL,
	tbl_mcls_cd varchar(20) NULL,
	eng_tbl_nm varchar(200) NULL,
	kor_tbl_nm varchar(1000) NULL,
	tbl_expl_cont varchar(4000) NULL,
	yr_crit_eng_col_nm varchar(200) NULL,
	crtn_dt date NOT NULL,
	CONSTRAINT cncr_tbl_meta_pk PRIMARY KEY (tbl_id)
);