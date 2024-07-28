package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.Dbconnection;
import Dao.CartDAOImpl;

@WebServlet("/remove_book")

public class RemoveBookCartServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		CartDAOImpl dao = new CartDAOImpl(Dbconnection.getConn());
		boolean f = dao.deleteBook(cid,uid);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book is removed from the cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg", "Something went wrong...");
			resp.sendRedirect("checkout.jsp");
		}

		
	}
}
