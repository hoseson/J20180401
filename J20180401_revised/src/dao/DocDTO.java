package dao;

public class DocDTO {
	private String docNo;
	private String docName;
	private String deptNo;
	private String deptName;
	private String cureName;
	
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getCureName() {
		return cureName;
	}
	public void setCureName(String cureName) {
		this.cureName = cureName;
	}
	public void accCureName(String cureName) {
		this.cureName += ", " + cureName;
	}
}
