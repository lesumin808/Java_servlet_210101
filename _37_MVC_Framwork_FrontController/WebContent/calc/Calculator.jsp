<!-- 
.metadata\.plugins\org.eclipse.wst.server.core\tmp1\work\Catalina\localhost\_20_MVC_Calculator_jsp\org\apache\jsp\calc
 -->

<!-- 페이지 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 자바코드 사용가능(스크립트릿) 
	_jspService내부에서 html보다 먼저 처리됨
	스크립트릿 : _jspService에서 응답을 처리하기 위한 java 코드
-->
<%
	String v1="";
	String v2="";
	String result="";
	String[] selected = {"","","",""};
	
	if(request.getParameter("v1")!=null){
		v1 = request.getParameter("v1");
		v2 = request.getParameter("v2");
		String op = request.getParameter("op");
		
		result = calculate(Integer.parseInt(v1),
						   Integer.parseInt(v2),
						   op);
		switch(op){
		case "+": selected[0] = "selected"; break;
		case "-": selected[1] = "selected"; break;
		case "*": selected[2] = "selected"; break;
		case "/": selected[3] = "selected"; break;
		}
	}
%>
    
<!-- 서블릿의 브라우저에 전송할 문자열로 변환 
	_jspService 내부에서 마지막에 브라우저에 전송됨
	
	표현식 : 선언문/스크립트릿에 저장된 변수값을 브라우저상에 전달하기 위한 문법
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
	<h2>jsp 계산기</h2>
	<form action="Calculator.jsp" method="get">
		<input type="text" name="v1" size="4" value="<%=v1%>">
		<select name="op">
			<option value="+" <%=selected[0] %>>+</option>
			<option value="-" <%=selected[1] %>>-</option>
			<option value="*" <%=selected[2] %>>*</option>
			<option value="/" <%=selected[3] %>>/</option>
		</select>
		<input type="text" name="v2" size="4" value="<%=v2%>">
		<input type="submit" value="=">
		<input type="text" size="8" value="<%=result%>">
	</form>
</body>
</html>

<!-- 선언문, _jspService 바깥에 메서드, 필드를 선언하는 곳 (가장 먼저 처리되는 곳)
	선언문 : _jspService외부에 필드/메서드를 등록하기 위한 java 코드
-->
<%!
	private String calculate(int v1, int v2, String op){
		int result = 0;
		switch(op){
		case "+": result = v1+v2; break;
		case "-": result = v1-v2; break;
		case "*": result = v1*v2; break;
		case "/": result = v1/v2; break;
		}
		return Integer.toString(result);
	}
%>










