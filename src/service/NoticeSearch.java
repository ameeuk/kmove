package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import jdbc.connection.ConnectionProvider;
import jdbc.util.JdbcUtil;
import model.NoticeListView;

/**
 * Servlet implementation class NoticeSearch
 */
@WebServlet("/NoticeSearch")
public class NoticeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=euk-kr");
		request.setCharacterEncoding("euc-kr");

		String pageNumberStr = request.getParameter("page");
		String keyword = request.getParameter("keyword");
		int pageNumber = 1;
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}

		Connection conn = null;
		NoticeDao noticeDao = null;
		NoticeListView noticeList = null;
		try {
			conn = ConnectionProvider.getConnection();
			noticeDao = new NoticeDao();
			try {
				noticeList = noticeDao.getSearchList(conn, pageNumber, keyword);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		request.setAttribute("noticeList", noticeList);
		request.setAttribute("listModel", noticeList.getMessageList());

		// JSP�� �۾��� ��Ź�� RequestDispatcher�� �ν��Ͻ�ȭ �մϴ�.
		RequestDispatcher view = request.getRequestDispatcher("/pages/notice_view.jsp");

		// RequestDispatcher�� �����̳ʿ��� JSP�� �غ��϶�� ��û�մϴ�. �� ���� JSP����
		// request/response ��ü�� �ѱ�ϴ�.
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
