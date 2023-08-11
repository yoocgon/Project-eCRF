-- DROP SCHEMA cancle_stomach;

CREATE SCHEMA cancle_stomach AUTHORIZATION gony;

-- cancle_stomach.gscn_diag_afoc definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_diag_afoc;

CREATE TABLE cancle_stomach.gscn_diag_afoc (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	comp_ocrn_oprt_ymd varchar(8) NOT NULL,
	comp_ocrn_oprt_seq numeric(3) NOT NULL,
	afoc_clcd varchar(20) NULL,
	afoc_clnm varchar(200) NULL,
	afoc_cd varchar(20) NULL,
	afoc_nm varchar(200) NULL,
	afop_etc_comp_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_diag_aninf definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_diag_aninf;

CREATE TABLE cancle_stomach.gscn_diag_aninf (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	anth_rcrd_ymd varchar(8) NOT NULL,
	anth_rcrd_seq numeric(3) NOT NULL,
	ht_msrm_vl numeric(10, 3) NULL,
	wt_msrm_vl numeric(10, 3) NULL,
	bmi_vl numeric(10, 3) NULL,
	rlxt_blpr_vl varchar(200) NULL,
	ctrt_blpr_vl varchar(200) NULL,
	ecog_cd varchar(20) NULL,
	ecog_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_diag_inf definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_diag_inf;

CREATE TABLE cancle_stomach.gscn_diag_inf (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	diag_rgst_ymd varchar(8) NOT NULL,
	diag_rgst_seq numeric(3) NOT NULL,
	gscn_diag_kncd varchar(20) NULL,
	gscn_diag_knnm varchar(200) NULL,
	diag_cd varchar(20) NULL,
	diag_nm varchar(300) NULL,
	diag_kcd_cd varchar(20) NULL,
	diag_kcd_nm varchar(200) NULL,
	diag_smct_cd varchar(200) NULL,
	diag_smct_nm varchar(1000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_diag_mtst definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_diag_mtst;

CREATE TABLE cancle_stomach.gscn_diag_mtst (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	mtdg_ymd varchar(8) NOT NULL,
	mtdg_seq numeric(3) NOT NULL,
	mtdg_mtcd varchar(20) NULL,
	mtdg_mtnm varchar(200) NULL,
	mtst_site_cd varchar(20) NULL,
	mtst_site_nm varchar(200) NULL,
	mtst_aspt_cd varchar(20) NULL,
	mtst_aspt_nm varchar(200) NULL,
	mtst_trtm_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_diag_stag definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_diag_stag;

CREATE TABLE cancle_stomach.gscn_diag_stag (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	diag_stag_rcrd_ymd varchar(8) NOT NULL,
	diag_stag_rcrd_seq numeric(3) NOT NULL,
	clnc_tumr_prty_cd varchar(20) NULL,
	clnc_tumr_prty_nm varchar(200) NULL,
	ajcc_yr varchar(4) NULL,
	clnc_tnm_stag_vl varchar(200) NULL,
	clnc_t_stag_vl varchar(200) NULL,
	clnc_n_stag_vl varchar(200) NULL,
	clnc_m_stag_vl varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_byps definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_byps;

CREATE TABLE cancle_stomach.gscn_exam_byps (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	bpsy_ymd varchar(8) NOT NULL,
	bpsy_seq numeric(3) NOT NULL,
	bpsy_read_ymd varchar(8) NULL,
	bpsy_site_cd varchar(20) NULL,
	bpsy_site_nm varchar(200) NULL,
	bpsy_mtcd varchar(20) NULL,
	bpsy_mtnm varchar(200) NULL,
	bpsy_mthd_kncd varchar(20) NULL,
	bpsy_mthd_knnm varchar(200) NULL,
	bpsy_rslt_cont varchar(4000) NULL,
	htlg_diag_cd varchar(20) NULL,
	htlg_diag_nm varchar(200) NULL,
	htlg_dfgd_cd varchar(20) NULL,
	htlg_dfgd_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_diag definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_diag;

CREATE TABLE cancle_stomach.gscn_exam_diag (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	cexm_ymd varchar(8) NOT NULL,
	cexm_seq numeric(3) NOT NULL,
	cexm_kncd varchar(20) NULL,
	cexm_knnm varchar(200) NULL,
	cexm_cd varchar(20) NULL,
	cexm_nm varchar(200) NULL,
	cexm_edi_cd varchar(20) NULL,
	cexm_edi_nm varchar(200) NULL,
	cexm_smct_cd varchar(200) NULL,
	cexm_smct_nm varchar(1000) NULL,
	cexm_loinc_cd varchar(20) NULL,
	cexm_loinc_nm varchar(1000) NULL,
	cexm_rslt_cont varchar(4000) NULL,
	cexm_rslt_unit_cont varchar(4000) NULL,
	cexm_nlrg_ref_vl varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_eus definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_eus;

CREATE TABLE cancle_stomach.gscn_exam_eus (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	eus_exam_ymd varchar(8) NOT NULL,
	eus_exam_seq numeric(3) NOT NULL,
	eus_t_stag_cd varchar(20) NULL,
	eus_t_stag_nm varchar(200) NULL,
	eus_n_stag_cd varchar(20) NULL,
	eus_n_stag_nm varchar(200) NULL,
	eus_m_stag_cd varchar(20) NULL,
	eus_m_stag_nm varchar(200) NULL,
	eus_exam_opn_cont varchar(4000) NULL,
	eus_exam_rslt_cont varchar(4000) NULL,
	eus_comp_cd varchar(20) NULL,
	eus_comp_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_gtsp definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_gtsp;

CREATE TABLE cancle_stomach.gscn_exam_gtsp (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	stmc_edex_ymd varchar(8) NOT NULL,
	stmc_edex_seq numeric(3) NOT NULL,
	stmc_edex_prps_cd varchar(20) NULL,
	stmc_edex_prps_nm varchar(200) NULL,
	gtsp_tspc_cnt varchar(100) NULL,
	stmc_edex_opn_cont varchar(4000) NULL,
	stmc_edex_rslt_cont varchar(4000) NULL,
	stmc_edex_rslt_tpcd varchar(20) NULL,
	stmc_edex_rslt_tpnm varchar(200) NULL,
	gtsp_comp_grcd varchar(20) NULL,
	gtsp_comp_grnm varchar(200) NULL,
	gtsp_comp_cd varchar(20) NULL,
	gtsp_comp_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_hpli definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_hpli;

CREATE TABLE cancle_stomach.gscn_exam_hpli (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	hpli_exam_ymd varchar(8) NOT NULL,
	hpli_exam_seq numeric(3) NOT NULL,
	hpli_exam_mtcd varchar(20) NULL,
	hpli_exam_mtnm varchar(200) NULL,
	hpli_exam_rslt_cd varchar(20) NULL,
	hpli_exam_rslt_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_imag definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_imag;

CREATE TABLE cancle_stomach.gscn_exam_imag (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	imex_ymd varchar(8) NOT NULL,
	imex_seq numeric(3) NOT NULL,
	imex_kncd varchar(20) NULL,
	imex_knnm varchar(200) NULL,
	imex_cd varchar(20) NULL,
	imex_nm varchar(200) NULL,
	imex_edi_cd varchar(20) NULL,
	imex_edi_nm varchar(300) NULL,
	imex_smct_cd varchar(200) NULL,
	imex_smct_nm varchar(1000) NULL,
	imex_rslt_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_impt definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_impt;

CREATE TABLE cancle_stomach.gscn_exam_impt (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	imem_ymd varchar(8) NOT NULL,
	imem_seq numeric(3) NOT NULL,
	impt_read_ymd varchar(8) NULL,
	imem_cd varchar(20) NULL,
	imem_nm varchar(200) NULL,
	imem_kncd varchar(20) NULL,
	imem_knnm varchar(200) NULL,
	imem_mthd_cont varchar(4000) NULL,
	imem_opn_cd varchar(20) NULL,
	imem_opn_nm varchar(200) NULL,
	imem_rslt_vl varchar(200) NULL,
	imem_rslt_unit_cd varchar(20) NULL,
	imem_rslt_unit_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_mlpt definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_mlpt;

CREATE TABLE cancle_stomach.gscn_exam_mlpt (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	mlem_ymd varchar(8) NOT NULL,
	mlem_seq numeric(3) NOT NULL,
	mlpt_read_ymd varchar(8) NULL,
	mlem_cd varchar(20) NULL,
	mlem_nm varchar(200) NULL,
	mlem_kncd varchar(20) NULL,
	mlem_knnm varchar(200) NULL,
	mlem_mthd_cont varchar(4000) NULL,
	mlem_rslt_bas_cont varchar(4000) NULL,
	mlem_opn_cd varchar(20) NULL,
	mlem_opn_nm varchar(200) NULL,
	mlem_rslt_cont varchar(4000) NULL,
	mlem_rslt_unit_cont varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_exam_sgpt definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_exam_sgpt;

CREATE TABLE cancle_stomach.gscn_exam_sgpt (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	srgc_ptem_ymd varchar(8) NOT NULL,
	srgc_ptem_seq numeric(3) NOT NULL,
	sgpt_read_ymd varchar(8) NULL,
	sgpt_hvst_site_cd varchar(20) NULL,
	sgpt_hvst_site_nm varchar(200) NULL,
	srgc_ptem_rslt_tumr_cnt numeric(3) NULL,
	htlg_diag_cd varchar(20) NULL,
	htlg_diag_nm varchar(200) NULL,
	htlg_dfgd_cd varchar(20) NULL,
	htlg_dfgd_nm varchar(200) NULL,
	afop_crmr_tumr_loca_cd varchar(20) NULL,
	afop_crmr_tumr_loca_nm varchar(200) NULL,
	afop_lngt_1_tumr_loca_cd varchar(20) NULL,
	afop_lngt_1_tumr_loca_nm varchar(200) NULL,
	afop_lngt_2_tumr_loca_cd varchar(20) NULL,
	afop_lngt_2_tumr_loca_nm varchar(200) NULL,
	gros_tpcd varchar(20) NULL,
	gros_tpnm varchar(200) NULL,
	gros_type_cont varchar(4000) NULL,
	tumr_wdth_lnth_vl numeric(10, 3) NULL,
	tumr_lgtd_lnth_vl numeric(10, 3) NULL,
	tumr_hght_vl numeric(10, 3) NULL,
	tumr_max_diam_vl numeric(10, 3) NULL,
	iflt_orgn_cd varchar(20) NULL,
	iflt_orgn_nm varchar(200) NULL,
	inva_dgre_cd varchar(20) NULL,
	inva_dgre_nm varchar(200) NULL,
	inva_dpth_vl numeric(10, 3) NULL,
	lymp_inva_ex_yn_spcd varchar(20) NULL,
	lymp_inva_ex_yn_spnm varchar(50) NULL,
	vasc_inva_ex_yn_spcd varchar(20) NULL,
	vasc_inva_ex_yn_spnm varchar(50) NULL,
	nerv_prex_ex_yn_spcd varchar(20) NULL,
	nerv_prex_ex_yn_spnm varchar(50) NULL,
	oprt_pmrg_rlcr_invl_yn_spcd varchar(20) NULL,
	oprt_pmrg_rlcr_invl_yn_spnm varchar(50) NULL,
	oprt_pmrg_size_vl numeric(10, 3) NULL,
	oprt_dmrg_rlcr_invl_yn_spcd varchar(20) NULL,
	oprt_dmrg_rlcr_invl_yn_spnm varchar(50) NULL,
	oprt_dmrg_size_vl numeric(10, 3) NULL,
	stes_bnst_cncr_clcd varchar(20) NULL,
	stes_bnst_cncr_clnm varchar(200) NULL,
	totl_ln_cnt numeric(3) NULL,
	pstv_ln_cnt varchar(100) NULL,
	ln_bylc_mtst_cont varchar(4000) NULL,
	ajcc_yr varchar(4) NULL,
	afop_path_tnm_stag_vl varchar(200) NULL,
	afop_path_t_stag_vl varchar(200) NULL,
	afop_path_n_stag_vl varchar(200) NULL,
	afop_path_m_stag_vl varchar(200) NULL,
	esd_vmrg_rlcr_pstv_yn_spcd varchar(20) NULL,
	esd_vmrg_rlcr_pstv_yn_spnm varchar(50) NULL,
	esd_vmrg_vl numeric(10, 3) NULL,
	esd_hmrg_rlcr_pstv_yn_spcd varchar(20) NULL,
	esd_hmrg_rlcr_pstv_yn_spnm varchar(50) NULL,
	esd_hmrg_vl numeric(10, 3) NULL,
	esd_hmrg_rlcr_lnth_vl numeric(10, 3) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_fuor_rlps definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_fuor_rlps;

CREATE TABLE cancle_stomach.gscn_fuor_rlps (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	rldg_ymd varchar(8) NOT NULL,
	rldg_seq numeric(3) NOT NULL,
	rldg_mtcd varchar(20) NULL,
	rldg_mtnm varchar(200) NULL,
	rlps_site_cd varchar(20) NULL,
	rlps_site_nm varchar(200) NULL,
	rlps_kncd varchar(20) NULL,
	rlps_knnm varchar(200) NULL,
	rlps_trtm_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_pt_fmht definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_pt_fmht;

CREATE TABLE cancle_stomach.gscn_pt_fmht (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	fmht_rcrd_ymd varchar(8) NOT NULL,
	fmht_rcrd_seq numeric(3) NOT NULL,
	fmht_yn_noans_spcd varchar(20) NULL,
	fmht_yn_noans_spnm varchar(50) NULL,
	pt_fm_rlcd varchar(20) NULL,
	pt_fm_rlnm varchar(200) NULL,
	pt_fmrl_etc_cont varchar(4000) NULL,
	fmhs_htn_yn_noans_spcd varchar(20) NULL,
	fmhs_htn_yn_noans_spnm varchar(50) NULL,
	fmhs_dbt_yn_noans_spcd varchar(20) NULL,
	fmhs_dbt_yn_noans_spnm varchar(50) NULL,
	fmht_tb_yn_noans_spcd varchar(20) NULL,
	fmht_tb_yn_noans_spnm varchar(50) NULL,
	fmhs_lvds_yn_noans_spcd varchar(20) NULL,
	fmhs_lvds_yn_noans_spnm varchar(50) NULL,
	fmhs_cncr_yn_noans_spcd varchar(20) NULL,
	fmhs_cncr_yn_noans_spnm varchar(50) NULL,
	fmht_cncr_kncd varchar(20) NULL,
	fmht_cncr_knnm varchar(200) NULL,
	fmht_cncr_kind_etc_cont varchar(4000) NULL,
	fmhs_etc_yn_noans_spcd varchar(20) NULL,
	fmhs_etc_yn_noans_spnm varchar(50) NULL,
	fmhs_etc_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_pt_hlinf definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_pt_hlinf;

CREATE TABLE cancle_stomach.gscn_pt_hlinf (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	adm_ymd varchar(8) NOT NULL,
	hlinf_seq numeric(3) NOT NULL,
	dsch_ymd varchar(8) NULL,
	cur_drnk_yn_noans_spcd varchar(20) NULL,
	cur_drnk_yn_noans_spnm varchar(50) NULL,
	dhis_yn_noans_spcd varchar(20) NULL,
	dhis_yn_noans_spnm varchar(50) NULL,
	drnk_strt_age_vl varchar(100) NULL,
	drnk_kncd varchar(20) NULL,
	drnk_knnm varchar(200) NULL,
	drnk_qty varchar(100) NULL,
	drnk_nt varchar(100) NULL,
	drnk_dtrn_ycnt varchar(100) NULL,
	ndrk_strt_yr varchar(4) NULL,
	cur_smok_yn_noans_spcd varchar(100) NULL,
	cur_smok_yn_noans_spnm varchar(50) NULL,
	shis_yn_noans_spcd varchar(20) NULL,
	shis_yn_noans_spnm varchar(50) NULL,
	smok_strt_age_vl varchar(100) NULL,
	smok_dtrn_ycnt varchar(100) NULL,
	smok_qty varchar(200) NULL,
	nsmk_strt_yr varchar(4) NULL,
	mhis_yn_noans_spcd varchar(20) NULL,
	mhis_yn_noans_spnm varchar(50) NULL,
	mhis_hl_yn_noans_spcd varchar(20) NULL,
	mhis_hl_yn_noans_spnm varchar(50) NULL,
	mhis_htn_yn_noans_spcd varchar(20) NULL,
	mhis_htn_yn_noans_spnm varchar(50) NULL,
	mhis_dbt_yn_noans_spcd varchar(20) NULL,
	mhis_dbt_yn_noans_spnm varchar(50) NULL,
	mhis_tb_yn_noans_spcd varchar(20) NULL,
	mhis_tb_yn_noans_spnm varchar(50) NULL,
	mhis_lvds_yn_noans_spcd varchar(20) NULL,
	mhis_lvds_yn_noans_spnm varchar(50) NULL,
	mhis_cncr_yn_noans_spcd varchar(20) NULL,
	mhis_cncr_yn_noans_spnm varchar(50) NULL,
	mhis_cncr_kncd varchar(20) NULL,
	mhis_cncr_knnm varchar(200) NULL,
	mhis_depr_yn_noans_spcd varchar(20) NULL,
	mhis_depr_yn_noans_spnm varchar(50) NULL,
	mhis_insm_yn_noans_spcd varchar(20) NULL,
	mhis_insm_yn_noans_spnm varchar(50) NULL,
	mhis_cads_yn_noans_spcd varchar(20) NULL,
	mhis_cads_yn_noans_spnm varchar(50) NULL,
	etc_mhis_yn_noans_spcd varchar(20) NULL,
	etc_mhis_yn_noans_spnm varchar(50) NULL,
	etc_mhis_diss_cont varchar(4000) NULL,
	main_sym_cont varchar(4000) NULL,
	main_sym_yn_noans_spcd varchar(20) NULL,
	main_sym_yn_noans_spnm varchar(50) NULL,
	ohad_hstr_yn_noans_spcd varchar(20) NULL,
	ohad_hstr_yn_noans_spnm varchar(50) NULL,
	dsch_stcd varchar(20) NULL,
	dsch_stnm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_trtm_antp definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_trtm_antp;

CREATE TABLE cancle_stomach.gscn_trtm_antp (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	antp_strt_ymd varchar(8) NOT NULL,
	antp_seq numeric(3) NOT NULL,
	antp_end_ymd varchar(8) NULL,
	antp_line_cnt numeric(3) NULL,
	antp_totl_cycl_cnt numeric(3) NULL,
	antp_trtm_prps_cd varchar(20) NULL,
	antp_trtm_prps_nm varchar(200) NULL,
	antp_nm varchar(200) NULL,
	antp_temp_stop_yn_unid_spcd varchar(20) NULL,
	antp_temp_stop_yn_unid_spnm varchar(50) NULL,
	antp_end_resn_cd varchar(20) NULL,
	antp_end_resn_nm varchar(200) NULL,
	antp_asmt_ymd varchar(8) NULL,
	antp_asmt_item_cd varchar(20) NULL,
	antp_asmt_item_nm varchar(200) NULL,
	antp_seff_cd varchar(20) NULL,
	antp_seff_nm varchar(200) NULL,
	antp_seff_grcd varchar(20) NULL,
	antp_seff_grnm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_trtm_bltr definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_trtm_bltr;

CREATE TABLE cancle_stomach.gscn_trtm_bltr (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	bltr_prsc_ymd varchar(8) NOT NULL,
	bltr_prsc_seq numeric(3) NOT NULL,
	blpt_kncd varchar(20) NULL,
	blpt_knnm varchar(200) NULL,
	blpt_cd varchar(20) NULL,
	blpt_nm varchar(200) NULL,
	bltr_pack_cnt numeric(3) NULL,
	bltr_totl_qty numeric(8) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_trtm_drin definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_trtm_drin;

CREATE TABLE cancle_stomach.gscn_trtm_drin (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	drug_prsc_ymd varchar(8) NOT NULL,
	drug_prsc_seq numeric(3) NOT NULL,
	drug_clcd varchar(20) NULL,
	drug_clnm varchar(200) NULL,
	drug_spcd varchar(20) NULL,
	drug_spnm varchar(200) NULL,
	drin_kncd varchar(20) NULL,
	drin_knnm varchar(200) NULL,
	drin_cd varchar(20) NULL,
	drin_nm varchar(200) NULL,
	drin_smct_cd varchar(200) NULL,
	drin_smct_nm varchar(1000) NULL,
	drug_cd varchar(20) NULL,
	drug_nm varchar(200) NULL,
	drug_edi_cd varchar(20) NULL,
	drug_edi_nm varchar(200) NULL,
	drug_atc_cd varchar(20) NULL,
	drug_atc_nm varchar(200) NULL,
	drug_rxnm_cd varchar(20) NULL,
	drug_rxnm_nm varchar(200) NULL,
	drug_prsc_capa varchar(50) NULL,
	drug_prsc_dcnt numeric(6) NULL,
	drug_injc_pth_cd varchar(20) NULL,
	drug_injc_pth_nm varchar(200) NULL,
	drug_prsc_capa_unit_cd varchar(20) NULL,
	drug_prsc_capa_unit_nm varchar(200) NULL,
	drug_mdct_dtrn_mcnt numeric(10, 3) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_trtm_oprt definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_trtm_oprt;

CREATE TABLE cancle_stomach.gscn_trtm_oprt (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	oprt_ymd varchar(8) NOT NULL,
	oprt_seq numeric(3) NOT NULL,
	oprt_kncd varchar(20) NULL,
	oprt_knnm varchar(200) NULL,
	oprt_cd varchar(20) NULL,
	oprt_nm varchar(500) NULL,
	oprt_edi_cd varchar(20) NULL,
	oprt_edi_nm varchar(200) NULL,
	oprt_smct_cd varchar(200) NULL,
	oprt_smct_nm varchar(1000) NULL,
	oprt_icd9cm_cd varchar(20) NULL,
	oprt_icd9cm_nm varchar(1000) NULL,
	oprt_ldtm varchar(20) NULL,
	oprt_prps_cd varchar(20) NULL,
	oprt_prps_nm varchar(200) NULL,
	oprt_mtcd varchar(20) NULL,
	oprt_mtnm varchar(200) NULL,
	oprt_anst_site_cd varchar(20) NULL,
	oprt_anst_site_nm varchar(200) NULL,
	asa_scor_cd varchar(20) NULL,
	asa_scor_nm varchar(200) NULL,
	oprt_incs_mtcd varchar(20) NULL,
	oprt_incs_mtnm varchar(200) NULL,
	oprt_crmr_tumr_loca_cd varchar(20) NULL,
	oprt_crmr_tumr_loca_nm varchar(200) NULL,
	oprt_lngt_1_tumr_loca_cd varchar(20) NULL,
	oprt_lngt_1_tumr_loca_nm varchar(200) NULL,
	oprt_lngt_2_tumr_loca_cd varchar(20) NULL,
	oprt_lngt_2_tumr_loca_nm varchar(200) NULL,
	diag_lpex_yn_unid_spcd varchar(20) NULL,
	diag_lpex_yn_unid_spnm varchar(50) NULL,
	oprm_ensp_use_yn_unid_spcd varchar(20) NULL,
	oprm_ensp_use_yn_unid_spnm varchar(50) NULL,
	flrn_imag_use_yn_unid_spcd varchar(20) NULL,
	flrn_imag_use_yn_unid_spnm varchar(50) NULL,
	inop_antp_cd varchar(20) NULL,
	inop_antp_nm varchar(200) NULL,
	adh_ibtr_use_yn_unid_spcd varchar(20) NULL,
	adh_ibtr_use_yn_unid_spnm varchar(50) NULL,
	adh_ibtr_gods_nm varchar(200) NULL,
	omnl_srmv_rang_cd varchar(20) NULL,
	omnl_srmv_rang_nm varchar(200) NULL,
	curdg_cd varchar(20) NULL,
	curdg_nm varchar(200) NULL,
	ln_srmv_dgre_cd varchar(20) NULL,
	ln_srmv_dgre_nm varchar(200) NULL,
	ln_srmv_dgre_detl_cont varchar(4000) NULL,
	mrge_srmv_site_cd varchar(20) NULL,
	mrge_srmv_site_nm varchar(200) NULL,
	repr_kncd varchar(20) NULL,
	repr_knnm varchar(200) NULL,
	repr_use_dvce_nm varchar(200) NULL,
	repr_mtcd varchar(20) NULL,
	repr_mtnm varchar(200) NULL,
	repr_aprmthd_cd varchar(20) NULL,
	repr_aprmthd_nm varchar(200) NULL,
	oprt_ebl_qty numeric(5) NULL,
	asct_yn_unid_spcd varchar(20) NULL,
	asct_yn_unid_spnm varchar(50) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_trtm_rd definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_trtm_rd;

CREATE TABLE cancle_stomach.gscn_trtm_rd (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	rdt_prsc_ymd varchar(8) NOT NULL,
	rdt_prsc_seq numeric(3) NOT NULL,
	rdt_kncd varchar(20) NULL,
	rdt_knnm varchar(200) NULL,
	rdt_cd varchar(20) NULL,
	rdt_nm varchar(200) NULL,
	rdt_edi_cd varchar(20) NULL,
	rdt_edi_nm varchar(200) NULL,
	rdt_smct_cd varchar(200) NULL,
	rdt_smct_nm varchar(1000) NULL,
	rdt_prps_cd varchar(20) NULL,
	rdt_prps_nm varchar(200) NULL,
	rdt_site_cd varchar(20) NULL,
	rdt_site_nm varchar(200) NULL,
	byst_rd_impl_nt numeric(3) NULL,
	rd_gy numeric(10, 3) NULL,
	byst_rd_totl_gy numeric(10, 3) NULL,
	rdt_asmt_ymd varchar(8) NULL,
	rdt_asmt_item_cd varchar(20) NULL,
	rdt_asmt_item_nm varchar(200) NULL,
	rdt_seff_perd_spcd varchar(20) NULL,
	rdt_seff_perd_spnm varchar(200) NULL,
	rdt_seff_kncd varchar(20) NULL,
	rdt_seff_knnm varchar(200) NULL,
	rdt_seff_grcd varchar(20) NULL,
	rdt_seff_grnm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_stomach.gscn_trtm_srpr definition

-- Drop table

-- DROP TABLE cancle_stomach.gscn_trtm_srpr;

CREATE TABLE cancle_stomach.gscn_trtm_srpr (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	esd_srpr_ymd varchar(8) NOT NULL,
	esd_srpr_seq numeric(3) NOT NULL,
	esd_srpr_strt_dt timestamp NOT NULL,
	esd_srpr_end_dt timestamp NOT NULL,
	esd_lesn_size_vl numeric(10, 3) NULL,
	esd_lesn_shap_cd varchar(20) NULL,
	esd_lesn_shap_nm varchar(200) NULL,
	esd_lesn_loca_wdth_cd varchar(20) NULL,
	esd_lesn_loca_wdth_nm varchar(200) NULL,
	esd_lesn_loca_lgtd_cd varchar(20) NULL,
	esd_lesn_loca_lgtd_nm varchar(200) NULL,
	esd_ulcr_yn_unid_spcd varchar(20) NULL,
	esd_ulcr_yn_unid_spnm varchar(50) NULL,
	esd_perf_yn_unid_spcd varchar(20) NULL,
	esd_perf_yn_unid_spnm varchar(50) NULL,
	esd_perf_msre_cd varchar(20) NULL,
	esd_perf_msre_nm varchar(200) NULL,
	esd_rslt_cd varchar(20) NULL,
	esd_rslt_nm varchar(200) NULL,
	esd_opn_cont varchar(4000) NULL,
	esd_rslt_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);