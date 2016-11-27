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

import dao.BoardDao;
import jdbc.connection.ConnectionProvider;
import model.BoardListView;
import jdbc.util.JdbcUtil;;

/**
 * Servlet implementation clboards BoardView
 */
@WebServlet("/BoardView")
public class BoardView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardView() {
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
			Clboards.forName("com.mysql.jdbc.Driver");
		} catch (ClboardsNotFoundException e) {
			System.out.println("Clboards not found : " + e);
		}
*/
		Connection conn = null;
		BoardDao boardDao = null;
		BoardListView boardList = null;
		try {
			conn = ConnectionProvider.getConnection();
			boardDao = new BoardDao();

			try {
				boardList = boardDao.getBoardList(conn, pageNumber);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		request.setAttribute("boardList", boardList);
		request.setAttribute("listModel", boardList.getMessageList());

		// JSP�� �۾��� ��Ź�� RequestDispatcher�� �ν��Ͻ�ȭ �մϴ�.
		RequestDispatcher view = request.getRequestDispatcher("/pages/board_view.jsp");

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
