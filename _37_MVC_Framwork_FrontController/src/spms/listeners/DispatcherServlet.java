package spms.listeners;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.vo.Member;

@WebServlet("*.do")
@SuppressWarnings("serial")
public class DispatcherServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		// pageController에 분기 전송을 위해 '서블릿 경로'를 얻는다
		String servletPath = request.getServletPath();
		
		try {
			String pageControllerPath = null;
			if("/member/list.do".equals(servletPath)) {
				pageControllerPath = "/member/list";
				if(request.getParameter("email") != null ) {
					request.setAttribute("member", new Member()
							.setEmail(request.getParameter("email"))
							.setPassword(request.getParameter("password"))
							.setName(request.getParameter("name")));
				}
			}else if("/member/update.do".equals(servletPath)) {
				pageControllerPath = "/member/update";
				if(request .getParameter("email") != null) {
					request.setAttribute("member", new Member()
							.setEmail(request.getParameter("email"))
							.setPassword(request.getParameter("password"))
							.setName(request.getParameter("name")));
				}
			}else if("/member/delete.do".equals(servletPath)) {
				pageControllerPath = "member/delete";
			}else if("/member/auth/login.do".equals(servletPath)) {
				pageControllerPath = "/auth/login";
			}else if("/member/auth/logout.do".equals(servletPath)) {
				pageControllerPath = "/auth/logout";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", e);
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
}
