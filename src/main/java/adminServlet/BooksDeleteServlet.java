package adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.Dbconnection;
import Dao.BookDAOImpl;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
			 boolean f= dao.deleteBooks(id);
			 HttpSession session = req.getSession();
			 if(f) {
//					System.out.println("True");
					session.setAttribute("succMsg", "Book Deleted Successfully..");
					resp.sendRedirect("admin/all_books.jsp");
				}else {
//					System.out.println("False");
					session.setAttribute("failedMsg", "Something Wrong on server...");
					resp.sendRedirect("admin/all_books.jsp");
					
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
