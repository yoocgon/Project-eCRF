-- DROP SCHEMA cancle_breast;

CREATE SCHEMA cancle_breast AUTHORIZATION gony;

-- cancle_breast.brcn_diag_afoc definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_diag_afoc;

CREATE TABLE cancle_breast.brcn_diag_afoc (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	comp_ocrn_oprt_ymd varchar(8) NOT NULL,
	comp_ocrn_oprt_seq numeric(3) NOT NULL,
	comp_ocrn_ymd varchar(8) NULL,
	afoc_cont varchar(4000) NULL,
	comp_grcd varchar(20) NULL,
	comp_grnm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_diag_aninf definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_diag_aninf;

CREATE TABLE cancle_breast.brcn_diag_aninf (
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


-- cancle_breast.brcn_diag_inf definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_diag_inf;

CREATE TABLE cancle_breast.brcn_diag_inf (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	diag_rgst_ymd varchar(8) NOT NULL,
	diag_rgst_seq numeric(3) NOT NULL,
	brcn_diag_kncd varchar(20) NULL,
	brcn_diag_knnm varchar(200) NULL,
	diag_cd varchar(20) NULL,
	diag_nm varchar(300) NULL,
	diag_kcd_cd varchar(20) NULL,
	diag_kcd_nm varchar(200) NULL,
	diag_smct_cd varchar(200) NULL,
	diag_smct_nm varchar(1000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_diag_mtst definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_diag_mtst;

CREATE TABLE cancle_breast.brcn_diag_mtst (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	mtdg_ymd varchar(8) NOT NULL,
	mtdg_seq numeric(3) NOT NULL,
	mtst_site_cd varchar(20) NULL,
	mtst_site_nm varchar(200) NULL,
	mtst_aspt_cd varchar(20) NULL,
	mtst_aspt_nm varchar(200) NULL,
	mtdg_mtcd varchar(20) NULL,
	mtdg_mtnm varchar(200) NULL,
	mtst_trtm_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_diag_stag definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_diag_stag;

CREATE TABLE cancle_breast.brcn_diag_stag (
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


-- cancle_breast.brcn_exam_byps definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_byps;

CREATE TABLE cancle_breast.brcn_exam_byps (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	bpsy_ymd varchar(8) NOT NULL,
	bpsy_seq numeric(3) NOT NULL,
	bpsy_read_ymd varchar(8) NULL,
	bpsy_site_cd varchar(20) NULL,
	bpsy_site_nm varchar(200) NULL,
	bpsy_site_latr_cd varchar(20) NULL,
	bpsy_site_latr_nm varchar(200) NULL,
	bpsy_mtcd varchar(20) NULL,
	bpsy_mtnm varchar(200) NULL,
	bpsy_mthd_kncd varchar(20) NULL,
	bpsy_mthd_knnm varchar(200) NULL,
	bpsy_rslt_cont varchar(4000) NULL,
	htlg_diag_cd varchar(20) NULL,
	htlg_diag_nm varchar(200) NULL,
	htlg_grcd varchar(20) NULL,
	htlg_grnm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_exam_diag definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_diag;

CREATE TABLE cancle_breast.brcn_exam_diag (
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


-- cancle_breast.brcn_exam_gmvx definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_gmvx;

CREATE TABLE cancle_breast.brcn_exam_gmvx (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	gmvx_ymd varchar(8) NOT NULL,
	gmvx_seq numeric(3) NOT NULL,
	gmvx_cd varchar(20) NULL,
	gmvx_nm varchar(200) NULL,
	gmvx_mtcd varchar(20) NULL,
	gmvx_mtnm varchar(200) NULL,
	gmvx_gene_kncd varchar(20) NULL,
	gmvx_gene_knnm varchar(200) NULL,
	gmte_mtst_exam_rslt_cont varchar(4000) NULL,
	pavr_detect_yn_spcd varchar(20) NULL,
	pavr_detect_yn_spnm varchar(50) NULL,
	uncl_varnt_detect_yn_spcd varchar(20) NULL,
	uncl_varnt_detect_yn_spnm varchar(50) NULL,
	dna_vainf_a_vl varchar(200) NULL,
	dna_vainf_b_cd varchar(20) NULL,
	dna_vainf_b_nm varchar(200) NULL,
	dna_vainf_c_cd varchar(20) NULL,
	dna_vainf_c_nm varchar(200) NULL,
	amsn_vainf_a_cd varchar(20) NULL,
	amsn_vainf_a_nm varchar(200) NULL,
	amsn_vainf_b_vl numeric(10, 3) NULL,
	amsn_vainf_c_cd varchar(20) NULL,
	amsn_vainf_c_nm varchar(200) NULL,
	ref_seq varchar(20) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_exam_gnrx definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_gnrx;

CREATE TABLE cancle_breast.brcn_exam_gnrx (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	gnrx_ymd varchar(8) NOT NULL,
	gnrx_seq numeric(3) NOT NULL,
	gnrx_kncd varchar(20) NULL,
	gnrx_knnm varchar(200) NULL,
	gnrx_rslt_kncd varchar(20) NULL,
	gnrx_rslt_knnm varchar(200) NULL,
	gnrx_rslt_cont varchar(4000) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_exam_imag definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_imag;

CREATE TABLE cancle_breast.brcn_exam_imag (
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
	brst_dens_clcd varchar(20) NULL,
	brst_dens_clnm varchar(200) NULL,
	imex_rslt_diag_clcd varchar(20) NULL,
	imex_rslt_diag_clnm varchar(200) NULL,
	micf_yn_unid_spcd varchar(20) NULL,
	micf_yn_unid_spnm varchar(50) NULL,
	asyt_yn_unid_spcd varchar(20) NULL,
	asyt_yn_unid_spnm varchar(50) NULL,
	boms_yn_unid_spcd varchar(20) NULL,
	boms_yn_unid_spnm varchar(50) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_exam_impt definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_impt;

CREATE TABLE cancle_breast.brcn_exam_impt (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	imem_ymd varchar(8) NOT NULL,
	imem_seq numeric(3) NOT NULL,
	impt_read_ymd varchar(8) NULL,
	imem_kncd varchar(20) NULL,
	imem_knnm varchar(200) NULL,
	imem_nm varchar(200) NULL,
	imem_cd varchar(20) NULL,
	imem_opn_clcd varchar(20) NULL,
	imem_opn_clnm varchar(200) NULL,
	imem_rslt_vl varchar(200) NULL,
	imem_rslt_unit_cd varchar(20) NULL,
	imem_rslt_unit_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_exam_mlpt definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_mlpt;

CREATE TABLE cancle_breast.brcn_exam_mlpt (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	mlem_ymd varchar(8) NOT NULL,
	mlem_seq numeric(3) NOT NULL,
	mlpt_read_ymd varchar(8) NULL,
	mlem_cd varchar(20) NULL,
	mlem_nm varchar(200) NULL,
	mlem_kncd varchar(20) NULL,
	mlem_knnm varchar(200) NULL,
	mlem_mtcd varchar(20) NULL,
	mlem_mtnm varchar(200) NULL,
	mlem_rslt_cd varchar(20) NULL,
	mlem_rslt_nm varchar(200) NULL,
	mlem_rslt_kncd varchar(20) NULL,
	mlem_rslt_knnm varchar(200) NULL,
	mlem_rslt_vl varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_exam_sgpt definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_exam_sgpt;

CREATE TABLE cancle_breast.brcn_exam_sgpt (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	srgc_ptem_ymd varchar(8) NOT NULL,
	srgc_ptem_seq numeric(3) NOT NULL,
	sgpt_read_ymd varchar(8) NULL,
	sgpt_hvst_site_cd varchar(20) NULL,
	sgpt_hvst_site_nm varchar(200) NULL,
	sgpt_exam_site_latr_cd varchar(20) NULL,
	sgpt_exam_site_latr_nm varchar(200) NULL,
	srgc_ptem_rslt_tumr_cnt numeric(3) NULL,
	tumr_wdth_lnth_vl numeric(10, 3) NULL,
	tumr_lgtd_lnth_vl numeric(10, 3) NULL,
	tumr_hght_vl numeric(10, 3) NULL,
	tumr_max_diam_vl numeric(10, 3) NULL,
	htlg_diag_cd varchar(20) NULL,
	htlg_diag_nm varchar(200) NULL,
	htlg_grcd varchar(20) NULL,
	htlg_grnm varchar(200) NULL,
	lvin_ex_yn_spcd varchar(20) NULL,
	lvin_ex_yn_spnm varchar(50) NULL,
	lpin_ex_yn_spcd varchar(20) NULL,
	lpin_ex_yn_spnm varchar(50) NULL,
	niin_ex_yn_spcd varchar(20) NULL,
	niin_ex_yn_spnm varchar(50) NULL,
	sgpt_micf_ex_yn_spcd varchar(20) NULL,
	sgpt_micf_ex_yn_spnm varchar(50) NULL,
	incn_necr_ex_yn_spcd varchar(20) NULL,
	incn_necr_ex_yn_spnm varchar(50) NULL,
	incn_asso_ex_yn_spcd varchar(20) NULL,
	incn_asso_ex_yn_spnm varchar(50) NULL,
	incn_core_grcd varchar(20) NULL,
	incn_core_grnm varchar(200) NULL,
	srmg_sfmg_lnth_vl numeric(10, 3) NULL,
	srmg_detl_cont varchar(4000) NULL,
	srmg_rlct_cd varchar(20) NULL,
	srmg_rlct_nm varchar(200) NULL,
	mtcr_size_vl numeric(10, 3) NULL,
	asso_lesn_cd varchar(20) NULL,
	asso_lesn_nm varchar(200) NULL,
	resi_tumr_cd varchar(20) NULL,
	resi_tumr_nm varchar(200) NULL,
	ln_totl_cnt numeric(3) NULL,
	pstv_ln_cnt varchar(100) NULL,
	slnd_totl_cnt numeric(3) NULL,
	pstv_slnd_cnt numeric(3) NULL,
	nsnd_totl_cnt numeric(3) NULL,
	pstv_nsnd_cnt numeric(3) NULL,
	ajcc_yr varchar(4) NULL,
	afop_path_tnm_stag_vl varchar(200) NULL,
	afop_path_t_stag_vl varchar(200) NULL,
	afop_path_n_stag_vl varchar(200) NULL,
	afop_path_m_stag_vl varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_fuor_rlps definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_fuor_rlps;

CREATE TABLE cancle_breast.brcn_fuor_rlps (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	rldg_ymd varchar(8) NOT NULL,
	rldg_seq numeric(3) NOT NULL,
	rlps_site_cd varchar(20) NULL,
	rlps_site_nm varchar(200) NULL,
	rlps_trtm_cont varchar(4000) NULL,
	rldg_mtcd varchar(20) NULL,
	rldg_mtnm varchar(200) NULL,
	rlps_kncd varchar(20) NULL,
	rlps_knnm varchar(200) NULL,
	rlps_sym_cd varchar(20) NULL,
	rlps_sym_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_pt_fmht definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_pt_fmht;

CREATE TABLE cancle_breast.brcn_pt_fmht (
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


-- cancle_breast.brcn_pt_hlinf definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_pt_hlinf;

CREATE TABLE cancle_breast.brcn_pt_hlinf (
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
	cur_smok_yn_noans_spcd varchar(20) NULL,
	cur_smok_yn_noans_spnm varchar(50) NULL,
	shis_yn_noans_spcd varchar(20) NULL,
	shis_yn_noans_spnm varchar(50) NULL,
	smok_strt_age_vl varchar(100) NULL,
	smok_qty varchar(200) NULL,
	smok_dtrn_ycnt varchar(100) NULL,
	nsmk_strt_yr varchar(4) NULL,
	mhis_yn_noans_spcd varchar(20) NULL,
	mhis_yn_noans_spnm varchar(50) NULL,
	mhis_htn_yn_noans_spcd varchar(20) NULL,
	mhis_htn_yn_noans_spnm varchar(50) NULL,
	mhis_dbt_yn_noans_spcd varchar(20) NULL,
	mhis_dbt_yn_noans_spnm varchar(50) NULL,
	mhis_tb_yn_noans_spcd varchar(20) NULL,
	mhis_tb_yn_noans_spnm varchar(50) NULL,
	mhis_lvds_yn_noans_spcd varchar(20) NULL,
	mhis_lvds_yn_noans_spnm varchar(50) NULL,
	mhis_hl_yn_noans_spcd varchar(20) NULL,
	mhis_hl_yn_noans_spnm varchar(50) NULL,
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
	main_sym_yn_noans_spcd varchar(20) NULL,
	main_sym_yn_noans_spnm varchar(50) NULL,
	main_sym_cont varchar(4000) NULL,
	ohad_hstr_yn_noans_spcd varchar(20) NULL,
	ohad_hstr_yn_noans_spnm varchar(50) NULL,
	dsch_stcd varchar(20) NULL,
	dsch_stnm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_pt_obinf definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_pt_obinf;

CREATE TABLE cancle_breast.brcn_pt_obinf (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	obtr_rcrd_ymd varchar(8) NOT NULL,
	obtr_rcrd_seq numeric(3) NOT NULL,
	marg_yn_noans_spcd varchar(20) NULL,
	marg_yn_noans_spnm varchar(50) NULL,
	marg_detl_cd varchar(20) NULL,
	marg_detl_nm varchar(200) NULL,
	hrpr_yn_noans_spcd varchar(20) NULL,
	hrpr_yn_noans_spnm varchar(50) NULL,
	hrt_impl_mcnt numeric(3) NULL,
	mena_age_vl numeric(4) NULL,
	delv_age_vl numeric(4) NULL,
	delv_chld_cnt numeric(3) NULL,
	bfpr_yn_noans_spcd varchar(20) NULL,
	bfpr_yn_noans_spnm varchar(50) NULL,
	brfd_mcnt numeric(3) NULL,
	oc_use_yn_noans_spcd varchar(20) NULL,
	oc_use_yn_noans_spnm varchar(50) NULL,
	oc_use_mcnt numeric(3) NULL,
	meno_yn_noans_spcd varchar(20) NULL,
	meno_yn_noans_spnm varchar(50) NULL,
	meno_age_vl numeric(4) NULL,
	utec_yn_noans_spcd varchar(20) NULL,
	utec_yn_noans_spnm varchar(50) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_trtm_antp definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_trtm_antp;

CREATE TABLE cancle_breast.brcn_trtm_antp (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	antp_strt_ymd varchar(8) NOT NULL,
	antp_seq numeric(3) NOT NULL,
	antp_end_ymd varchar(8) NULL,
	antp_nm varchar(200) NULL,
	antp_cycl_cnt numeric(3) NULL,
	antp_line_cnt numeric(3) NULL,
	antp_temp_stop_yn_unid_spcd varchar(20) NULL,
	antp_temp_stop_yn_unid_spnm varchar(50) NULL,
	antp_end_resn_cd varchar(20) NULL,
	antp_end_resn_nm varchar(200) NULL,
	antp_asmt_ymd varchar(8) NULL,
	antp_asmt_item_cd varchar(20) NULL,
	antp_asmt_item_nm varchar(200) NULL,
	antp_seff_item_cd varchar(20) NULL,
	antp_seff_item_nm varchar(200) NULL,
	antp_seff_grcd varchar(20) NULL,
	antp_seff_grnm varchar(200) NULL,
	antp_trtm_prps_cd varchar(20) NULL,
	antp_trtm_prps_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_trtm_bltr definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_trtm_bltr;

CREATE TABLE cancle_breast.brcn_trtm_bltr (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	bltr_prsc_ymd varchar(8) NOT NULL,
	bltr_prsc_seq numeric(3) NOT NULL,
	blpt_kncd varchar(20) NULL,
	blpt_knnm varchar(200) NULL,
	blpt_cd varchar(20) NULL,
	blpt_nm varchar(200) NULL,
	blpt_capa numeric(5) NULL,
	bltr_pack_cnt numeric(3) NULL,
	bltr_totl_qty numeric(8) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_trtm_drin definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_trtm_drin;

CREATE TABLE cancle_breast.brcn_trtm_drin (
	hosp_cd varchar(20) NOT NULL,
	pt_sbst_no varchar(10) NOT NULL,
	drug_prsc_ymd varchar(8) NOT NULL,
	drug_prsc_seq numeric(3) NOT NULL,
	drug_clcd varchar(20) NULL,
	drug_clnm varchar(200) NULL,
	andr_spcd varchar(20) NULL,
	andr_spnm varchar(200) NULL,
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
	drug_prsc_capa_unit_cd varchar(20) NULL,
	drug_prsc_capa_unit_nm varchar(200) NULL,
	drug_prsc_dcnt numeric(6) NULL,
	drug_injc_pth_cd varchar(20) NULL,
	drug_injc_pth_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_trtm_oprt definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_trtm_oprt;

CREATE TABLE cancle_breast.brcn_trtm_oprt (
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
	oprt_anst_site_cd varchar(20) NULL,
	oprt_anst_site_nm varchar(200) NULL,
	ebl_qty numeric(5) NULL,
	oprt_ldtm varchar(20) NULL,
	oprt_prps_cd varchar(20) NULL,
	oprt_prps_nm varchar(200) NULL,
	oprt_site_cd varchar(20) NULL,
	oprt_site_nm varchar(200) NULL,
	brcn_oprt_mtcd varchar(20) NULL,
	brcn_oprt_mtnm varchar(200) NULL,
	asa_scor_cd varchar(20) NULL,
	asa_scor_nm varchar(200) NULL,
	oprt_incs_mthd_cont varchar(4000) NULL,
	oprt_icln_tpcd varchar(20) NULL,
	oprt_icln_tpnm varchar(200) NULL,
	oprt_tumr_loca_cd varchar(20) NULL,
	oprt_tumr_loca_nm varchar(200) NULL,
	oprt_tumr_detl_loca_cd varchar(20) NULL,
	oprt_tumr_detl_loca_nm varchar(200) NULL,
	repr_clcd varchar(20) NULL,
	repr_clnm varchar(200) NULL,
	repr_mtcd varchar(20) NULL,
	repr_mtnm varchar(200) NULL,
	slnd_dtct_mtcd varchar(20) NULL,
	slnd_dtct_mtnm varchar(200) NULL,
	afop_asmt_item_cd varchar(20) NULL,
	afop_asmt_item_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);


-- cancle_breast.brcn_trtm_rd definition

-- Drop table

-- DROP TABLE cancle_breast.brcn_trtm_rd;

CREATE TABLE cancle_breast.brcn_trtm_rd (
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
	rd_gy numeric(10, 3) NULL,
	rd_impl_nt numeric(5) NULL,
	rd_totl_gy numeric(10, 3) NULL,
	rdt_asmt_ymd varchar(8) NULL,
	rdt_seff_perd_spcd varchar(20) NULL,
	rdt_seff_perd_spnm varchar(200) NULL,
	rdt_seff_kncd varchar(20) NULL,
	rdt_seff_knnm varchar(200) NULL,
	rdt_seff_grcd varchar(20) NULL,
	rdt_seff_grnm varchar(200) NULL,
	rdt_asmt_item_cd varchar(20) NULL,
	rdt_asmt_item_nm varchar(200) NULL,
	crtn_dt timestamp NOT NULL
);