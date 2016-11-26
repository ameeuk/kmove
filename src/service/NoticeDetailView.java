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
		
		//id 값을 기준으로 해당 DB를 모두 불러옴. 
				String id = request.getParameter("id"); //게시판에서 title 누르면 해당 게시글의 id 값 넘겨줌
				
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
				
				request.setAttribute("notice", notice); //EL식을 사용하기 위해
				
				// JSP로 작업을 부탁할 RequestDispatcher를 인스턴스화 합니다.
				RequestDispatcher view = request.getRequestDispatcher("/pages/notice_detail.jsp");

				// RequestDispatcher는 컨테이너에게 JSP를 준비하라고 요청합니다. 그 다음 JSP에게
				// request/response 객체를 넘깁니다.
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
