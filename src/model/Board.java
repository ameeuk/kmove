package model;

import java.util.Date;

public class Board {

	private int id;
	private String writer;
	private String model;
	private String category;
	private String title;
	private String content;
	private Date postingDate;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int id, String writer, String model, String category, String title, String content, Date postingDate) {
		super();
		this.id = id;
		this.writer = writer;
		this.model = model;
		this.category = category;
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

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
