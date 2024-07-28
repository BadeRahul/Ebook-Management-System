package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.Dbconnection;
import Dao.UserDAOImpl;
import Models.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

//			System.out.println(name+email+phno+password+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			HttpSession session = req.getSession();
			if (check != null) {
				UserDAOImpl dao = new UserDAOImpl(Dbconnection.getConn());

				boolean f2 = dao.checkUser(email);
				if (f2) {

					boolean f = dao.userRegister(us);
					if (f) {

						session.setAttribute("succMsg", "Registration Successfully Done");
						resp.sendRedirect("register.jsp");
						// System.out.println("User Register Success....");
					} else {
						session.setAttribute("failedMsg", "Something Wrong on Server....");
						resp.sendRedirect("register.jsp");
						// System.out.println("Something Wrong on Server....");
					}

				} else {
					session.setAttribute("failedMsg", "User already exists. Try with another emailId");
					resp.sendRedirect("register.jsp");

				}
			} else {
				session.setAttribute("failedMsg", "Please accept terms & conditions");
				resp.sendRedirect("register.jsp");
				// System.out.println("Please accept terms & conditions");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
