package spms.listeners;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;

import spms.dao.MemberDao;
/* JNDI
 * WAS(Web Application Server)의 리소스(자원)에 대한 고유 이름 정의
 * 어플리케이션에서 서버의 리소스를 접근할 때 사용하는 명명 규칙
 * 1) java:comp/env				- 응용 프로그램 환경 항목
 * 2) java:comp/env/jdbc		- JDBC 데이터 소스
 * 3) java:comp/ejb				- EJB 컴포넌트
 * 4) java:comp/UserTransaction - UserTransaction 객체
 * 5) java:comp/env/mail		- JavaMail 연결 객체
 * 6) java:comp/env/url			- URL 정보
 * 7) java:comp/env/jms			- JMS 연결 객체
 * */

public class ContextLoaderListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			System.out.println("contextDestroyed");
			//우리가 DataSource객체를 해지하지 않아도 tomcat서버가 알아서 해제한다.
		}catch(Exception e) {
			e.printStackTrace();
		}		

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			System.out.println("contextInitialized");
			ServletContext sc = sce.getServletContext();

			//tomcat서버가 자동으로 생성하고 해제하는 DataSource객체를 찾아서 가져온다.
			InitialContext initialContext = new InitialContext();
			DataSource ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/studydb");
			
			MemberDao memberDao = new MemberDao();
			memberDao.setDataSource(ds);	
			
			// conn객체 대신 memberDao객체를 공유
			sc.setAttribute("memberDao", memberDao);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}








