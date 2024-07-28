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
import Models.BookDtls;

@WebServlet("/editbooks")
public class EditBookServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id").trim());
			String bookName = req.getParameter("bname").trim();
			String author = req.getParameter("author").trim();
			String price = req.getParameter("price").trim();
			String status = req.getParameter("status").trim();
			
			
			BookDtls b= new BookDtls();
			b.setBookId(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			
			BookDAOImpl dao =new BookDAOImpl(Dbconnection.getConn());
			
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			
			if(f) {
//				System.out.println("True");
				session.setAttribute("succMsg", "Book Update Successfully..");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
//				System.out.println("False");
				session.setAttribute("failedMsg", "Something Wrong on server...");
				resp.sendRedirect("admin/all_books.jsp");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
