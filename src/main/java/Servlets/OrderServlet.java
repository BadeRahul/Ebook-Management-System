package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.Dbconnection;
import Dao.BookOrderImpl;
import Dao.CartDAOImpl;
import Models.Book_Order;
import Models.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name= req.getParameter("username");
			String email= req.getParameter("email");
			String phno= req.getParameter("phno");
			String address= req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city= req.getParameter("city");
			String state= req.getParameter("state");
			String pincode= req.getParameter("pincode");
			String paymentType= req.getParameter("paymentType");
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
//			System.out.println(name+email+phno+fullAdd+paymentType);
			
			CartDAOImpl dao = new CartDAOImpl(Dbconnection.getConn());
			
			List<Cart> blist = dao.getBookByUser(id);
			
			if(blist.isEmpty()) {
				
				session.setAttribute("failedMsg","Add Some items into the Cart ot order");
				resp.sendRedirect("checkout.jsp");
				
			}else {
				BookOrderImpl dao2= new BookOrderImpl(Dbconnection.getConn());
				
//				int i = dao2.getOrderNo();
				
				Book_Order o = null;
				
				ArrayList<Book_Order> orderlist = new ArrayList<Book_Order>();
				
				Random r = new Random();
				
				for(Cart c:blist) {
					o=new Book_Order();
					o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderlist.add(o);
					
					
				}
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg","Please choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				}else {
					
					boolean f = dao2.saveOrder(orderlist);
					
					if(f) {
//						session.setAttribute("failedMsg","Please choose Payment Method");
						resp.sendRedirect("order_success.jsp");
//						System.out.println("order success");
					}else {
//						System.out.println("failed");
						session.setAttribute("failedMsg","Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
