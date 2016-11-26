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
import model.NoticeListView;
import jdbc.util.JdbcUtil;;

/**
 * Servlet implementation class NoticeView
 */
@WebServlet("/NoticeView")
public class NoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeView() {
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

		String pageNumberStr = request.getParameter("page");
		int pageNumber = 1;
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
	/*	
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found : " + e);
		}
*/
		Connection conn = null;
		NoticeDao noticeDao = null;
		NoticeListView noticeList = null;
		try {
			conn = ConnectionProvider.getConnection();
			noticeDao = new NoticeDao();

			try {
				noticeList = noticeDao.getNoticeList(conn, pageNumber);
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
