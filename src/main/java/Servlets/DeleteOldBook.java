package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.Dbconnection;
import Dao.BookDAOImpl;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String email = req.getParameter("em");
			BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
			
			boolean f = dao.oldbookdelete(id, email, "Old");
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Old Book is deleted successfully");
				resp.sendRedirect("old_book.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong...");
				resp.sendRedirect("old_book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
