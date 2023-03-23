package com.jacaranda.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.jacaranda.model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		
		if(sesion.getAttribute("login") == null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			User user = UserControl.getUser(username, password);
			
			if(user != null) {
				sesion.setAttribute("login","true");
				sesion.setAttribute("user",username);
				sesion.setAttribute("administrator", false);
				if(user.isAdministrator()) {
					sesion.setAttribute("administrator", true);
					request.getRequestDispatcher("/categories.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/categories.jsp").forward(request, response);		
				}
			}else {
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("/categories.jsp").forward(request, response);
		}

	}

}
