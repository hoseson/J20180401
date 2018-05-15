package dao;

import java.util.Date;

public class MemberDTO {
	private String memno;
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String addr;
	private String email;
	private String manage;
	private String memdel;
	private Date regdate;

	@Override
	public String toString() {
		return "MemberDTO [memno=" + memno + ", id=" + id + ", pw=" + pw
				+ ", name=" + name + ", tel=" + tel + ", addr=" + addr
				+ ", email=" + email + ", manage=" + manage + ", regdate="
				+ regdate + "]";
	}

	public String getMemdel() {
		return memdel;
	}

	public void setMemdel(String memdel) {
		this.memdel = memdel;
	}

	public String getMemno() {
		return memno;
	}

	public void setMemno(String memno) {
		this.memno = memno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getManage() {
		return manage;
	}

	public void setManage(String manage) {
		this.manage = manage;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
