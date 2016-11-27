package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import jdbc.connection.ConnectionProvider;
import jdbc.util.JdbcUtil;


/**
 * Servlet implementation class BoardDelete
 */
@WebServlet("/BoardDelete")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDelete() {
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

		// id ���� �������� �ش� DB�� ��� �ҷ���.
		String id = request.getParameter("id"); // �Խ��ǿ��� title ������ �ش� �Խñ��� id ��
												// �Ѱ���

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		BoardDao boardDao;
		try {
			boardDao = new BoardDao();
			boardDao.delete(conn, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		response.sendRedirect("BoardView");
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
