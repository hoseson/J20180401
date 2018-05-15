package dao;

public class DiseaseBoardDTO {
	private String regdate;
	private String boardno;
	private String subject;
	private String content;
	private int readcount;

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getBoardno() {
		return boardno;
	}

	public void setBoardno(String boardno) {
		this.boardno = boardno;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
}
