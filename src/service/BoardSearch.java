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
import jdbc.util.JdbcUtil;
import model.BoardListView;

/**
 * Servlet implementation class BoardSearch
 */
@WebServlet("/BoardSearch")
public class BoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardSearch() {
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
		BoardDao boardDao = null;
		BoardListView boardList = null;
		try {
			conn = ConnectionProvider.getConnection();
			boardDao = new BoardDao();
			try {
				boardList = boardDao.getSearchList(conn, pageNumber, keyword);
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

		// JSP로 작업을 부탁할 RequestDispatcher를 인스턴스화 합니다.
		RequestDispatcher view = request.getRequestDispatcher("/pages/board_view.jsp");

		// RequestDispatcher는 컨테이너에게 JSP를 준비하라고 요청합니다. 그 다음 JSP에게
		// request/response 객체를 넘깁니다.
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
