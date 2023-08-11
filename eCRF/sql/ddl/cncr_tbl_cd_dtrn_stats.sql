-- public.cncr_tbl_cd_dtrn_stats definition

-- Drop table

-- DROP TABLE public.cncr_tbl_cd_dtrn_stats;

CREATE TABLE public.cncr_tbl_cd_dtrn_stats (
	hosp_cd varchar(20) NOT NULL,
	tbl_id varchar(20) NOT NULL,
	col_id varchar(20) NOT NULL,
	cd_vl varchar(200) NOT NULL,
	col_seq numeric(3) NULL,
	row_cnt numeric(20) NULL,
	pt_cnt numeric(20) NULL,
	stats_work_ymd varchar(8) NOT NULL,
	coll_strt_ymd varchar(8) NOT NULL,
	coll_end_ymd varchar(8) NOT NULL,
	crtn_dt date NOT NULL,
	CONSTRAINT cncr_tbl_cd_dtrn_stats_pk PRIMARY KEY (hosp_cd, tbl_id, col_id, cd_vl)
);