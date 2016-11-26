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
import model.Notice;

/**
 * Servlet implementation class NoticeDetailView
 */
@WebServlet("/NoticeDetailView")
public class NoticeDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=euk-kr");
		
		//id ���� �������� �ش� DB�� ��� �ҷ���. 
				String id = request.getParameter("id"); //�Խ��ǿ��� title ������ �ش� �Խñ��� id �� �Ѱ���
				
				Connection conn=null;
				try {
					conn = ConnectionProvider.getConnection();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				Notice notice = new Notice();
				NoticeDao noticeDao;
				try {
					noticeDao = new NoticeDao();
					notice = noticeDao.select(conn, id);
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JdbcUtil.close(conn);
				}
				
				request.setAttribute("notice", notice); //EL���� ����ϱ� ����
				
				// JSP�� �۾��� ��Ź�� RequestDispatcher�� �ν��Ͻ�ȭ �մϴ�.
				RequestDispatcher view = request.getRequestDispatcher("/pages/notice_detail.jsp");

				// RequestDispatcher�� �����̳ʿ��� JSP�� �غ��϶�� ��û�մϴ�. �� ���� JSP����
				// request/response ��ü�� �ѱ�ϴ�.
				view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
