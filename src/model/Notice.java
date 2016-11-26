package model;

import java.util.Date;

public class Notice {

	private int id;
	private String writer;
	private String title;
	private String content;
	private Date postingDate;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int id, String writer, String title, String content, Date postingDate) {
		super();
		this.id = id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.postingDate = postingDate;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostingDate() {
		return postingDate;
	}
	public void setPostingDate(Date postingDate) {
		this.postingDate = postingDate;
	}
			
}
