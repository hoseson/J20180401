package dao;


public class ConDTO {
	private String regDate; 
	private String consultNo;
	private String memNo;
	private String subject;
	private String deptName;
	private int readCount;
	private String content;
	private String recontent;
		
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getConsultNo() {
		return consultNo;
	}
	public void setConsultNo(String consultNo) {
		this.consultNo = consultNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

}
