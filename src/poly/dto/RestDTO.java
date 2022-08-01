package poly.dto;

public class RestDTO {

	private String seq;
	private String bizplc_nm;
	private String refine_roadnm_addr;
	private String refine_lotno_addr; 
	private String refine_wgs84_lat;
	private String refine_wgs84_logt;
	public String safety_restrnt_no;
	private String signgu_nm;
	private String detail_addr;
	private String sido_nm;
	private String indutype_nm;
	private String indutype_detail_nm;
	private String telno;
	private String exists_yn;

	
	public String getExists_yn() {
		return exists_yn;
	}

	public void setExists_yn(String exists_yn) {
		this.exists_yn = exists_yn;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getIndutype_nm() {
		return indutype_nm;
	}

	public void setIndutype_nm(String indutype_nm) {
		this.indutype_nm = indutype_nm;
	}

	public String getIndutype_detail_nm() {
		return indutype_detail_nm;
	}

	public void setIndutype_detail_nm(String indutype_detail_nm) {
		this.indutype_detail_nm = indutype_detail_nm;
	}

	public String getSigngu_nm() {
		return signgu_nm;
	}

	public void setSigngu_nm(String signgu_nm) {
		this.signgu_nm = signgu_nm;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public String getSido_nm() {
		return sido_nm;
	}

	public void setSido_nm(String sido_nm) {
		this.sido_nm = sido_nm;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getRefine_lotno_addr() {
		return refine_lotno_addr;
	}

	public void setRefine_lotno_addr(String refine_lotno_addr) {
		this.refine_lotno_addr = refine_lotno_addr;
	}
	
	public String getSafety_restrnt_no() {
		return safety_restrnt_no;
	}
	public void setSafety_restrnt_no(String safety_restrnt_no) {
		this.safety_restrnt_no = safety_restrnt_no;
	}
	
	public String getBizplc_nm()
	{
		return bizplc_nm;
	}
	public void setBizplc_nm(String bizplc_nm) {
		this.bizplc_nm = bizplc_nm;
	}
	public String getRefine_roadnm_addr() {
		return refine_roadnm_addr;
	}
	public void setRefine_roadnm_addr(String refine_roadnm_addr) {
		this.refine_roadnm_addr = refine_roadnm_addr;
	}
	public String getRefine_wgs84_lat() {
		return refine_wgs84_lat;
	}
	public void setRefine_wgs84_lat(String refine_wgs84_lat) {
		this.refine_wgs84_lat = refine_wgs84_lat;
	}
	public String getRefine_wgs84_logt() {
		return refine_wgs84_logt;
	}
	public void setRefine_wgs84_logt(String refine_wgs84_logt) {
		this.refine_wgs84_logt = refine_wgs84_logt;
	}

}
