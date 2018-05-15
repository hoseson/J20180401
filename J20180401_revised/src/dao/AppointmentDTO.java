package dao;

public class AppointmentDTO {
	private String memNo;
	private String docNo;
	private String appDate;
	private String appTime;
	private String appRes;
	
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public String getAppDate() {
		return appDate;
	}
	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}
	public String getAppTime() {
		return appTime;
	}
	public void setAppTime(String appTime) {
		this.appTime = appTime;
	}
	public String getAppRes() {
		return appRes;
	}
	public void setAppRes(String appRes) {
		this.appRes = appRes;
	}

	
}