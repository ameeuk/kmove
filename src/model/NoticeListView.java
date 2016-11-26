package model;

import java.util.List;

public class NoticeListView {
	private int messageTotalCount; 
	private int currentPageNumber; 
	private List<Notice> messageList; 
	private int pageTotalCount; 
	private int messageCountPerPage;
	private int first;
	private int last;
	
	

	public NoticeListView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeListView(int messageTotalCount, int currentPageNumber, List<Notice> messageList, int messageCountPerPage, int first, int last) {
		super();
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerPage = messageCountPerPage;
		this.first = first;
		this.last = last;

		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = (messageTotalCount / messageCountPerPage)+1;
			if (messageTotalCount % messageCountPerPage > 0)
				pageTotalCount++;
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public void setMessageTotalCount(int messageTotalCount) {
		this.messageTotalCount = messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Notice> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Notice> messageList) {
		this.messageList = messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public void setMessageCountPerPage(int messageCountPerPage) {
		this.messageCountPerPage = messageCountPerPage;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	
	

}
