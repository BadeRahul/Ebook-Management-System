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
import Dao.CartDAOImpl;
import Models.BookDtls;
import Models.Cart;

@WebServlet("/cart")

public class CartServlet extends HttpServlet{
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bid = Integer.parseInt(req.getParameter("bid").trim());
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
			
			BookDtls b= dao.getBookById(bid);
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalprice(Double.parseDouble(b.getPrice()));
			CartDAOImpl dao2 = new CartDAOImpl(Dbconnection.getConn());
			boolean f =dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("addCart", "Book Added to Cart");
				resp.sendRedirect("all_new_book.jsp");
//				System.out.println("Success");
			}else {
				session.setAttribute("failed", "Something went wrong..");
				resp.sendRedirect("all_new_book.jsp");
//				System.out.println("failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
