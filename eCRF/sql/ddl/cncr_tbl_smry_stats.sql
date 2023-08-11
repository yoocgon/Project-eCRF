-- public.cncr_tbl_smry_stats definition

-- Drop table

-- DROP TABLE public.cncr_tbl_smry_stats;

CREATE TABLE public.cncr_tbl_smry_stats (
	smry_stats_no varchar(10) NOT NULL,
	hosp_cd varchar(20) NOT NULL,
	crit_yr varchar(4) NOT NULL,
	smry_stats_nm varchar(1000) NOT NULL,
	tbl_id varchar(20) NOT NULL,
	col_id varchar(20) NOT NULL,
	pt_age numeric(4) NOT NULL,
	pt_sex_cd varchar(20) NOT NULL,
	stats_trgt_vl varchar(4000) NOT NULL,
	ncs numeric(20) NULL,
	whol_ncs numeric(20) NULL,
	pt_cnt numeric(20) NULL,
	whol_pt_cnt numeric(20) NULL,
	stats_work_ymd varchar(8) NOT NULL,
	coll_strt_ymd varchar(8) NOT NULL,
	coll_end_ymd varchar(8) NOT NULL,
	crtn_dt timestamp NOT NULL,
	CONSTRAINT cncr_tbl_smry_stats_pk PRIMARY KEY (smry_stats_no, hosp_cd, crit_yr, pt_age, pt_sex_cd, stats_trgt_vl)
);