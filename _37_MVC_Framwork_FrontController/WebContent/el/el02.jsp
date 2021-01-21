<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spms.vo.Member" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 객체 꺼내기</title>
<style>
	body{ font-size:small;}
	table{
		border:thin solid gray;
		border-collapse: collapse;
	}
	td, th{
		border:thin dotted gray;
		padding: 2px;
	}
	th{ background-color: lightgray}
	pre{ font-size: 90%;}
</style>
</head>
<body>
	<p>
		<a href="el01.jsp">[이전]</a>
		<a href="el03.jsp">[다음]</a>
	</p>
	
	<h2>EL - 값 꺼내기</h2>
	<%
		// java 객체를 공유공간에 저장하자
		/*
		applicationScope -> ServletContext
		sessionScope	 -> HttpSession
		requestScope	 -> ServletRequest
		pageScope 		 -> JspContext
		
		1) EL 표현
		${member.no} or ${member["no"]}
		2) EL을 java로 변환
		Member member = 
			(Member)pageContext.findAttribute("member");
		int value = member.getNo();
		3) EL이 공유 공간을 탐색하는 순서
		JspContext -> ServletRequest -> HttpSession
		-> ServletContext -> null
		*/
		
		// 테스트를 위한 데이터 객체를 공유공간에 저장하자
		session.setAttribute("scores",
						new int[]{90,80,70,100});
		
		List<String> nameList = new LinkedList<String>();
		nameList.add("홍길동");
		nameList.add("임꺽정");
		nameList.add("장길산");
		session.setAttribute("nameList", nameList);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("s01", "홍길동");
		map.put("s02", "임꺽정");
		map.put("s03", "장길산");
		session.setAttribute("map", map);
		
		session.setAttribute("member", 
				new Member()
					.setNo(100)
					.setName("홍길동")
					.setEmail("hong@test.com"));
	%>
	
	<table>
		<tr>
			<th>대상</th>
			<th>EL 코드</th>
			<th>설명</th>
		</tr>
		<tr>
			<td>배열</td>
			<td>\${myArray[1]}</td>
			<td>배열에서 해당 인덱스 값을 꺼낸다.<br>
				<pre>
[자바 코드]
pageContext.setAttribute("scores", new int[]{90,80,70,100});
	
[실행 결과]
\${scores[2]} = ${scores[2]}
				</pre>			
			</td>
		</tr>
		<tr>
			<td>리스트</td>
			<td>\${myList[2]}</td>
			<td>List 객체에서 인덱스로 지정된 항목 값을 꺼낸다
				<pre>
[자바 코드]
List<String> nameList = new LinkedList<String>();
nameList.add("홍길동");
nameList.add("임꺽정");
nameList.add("장길산");
pageContext.setAttribute("nameList", nameList);

[실행 결과]
\${nameList[1]} = ${nameList[1]}
				</pre>			
			</td>
		</tr>
		<tr>
			<td>맵</td>
			<td>\${myMap.keyName}</td>
			<td>Map 객체에서 키에 해당하는 값을 꺼낸다.
				<pre>
[자바 코드]
Map<String,String> map = new HashMap<String,String>();
map.put("s01", "홍길동");
map.put("s02", "임꺽정");
map.put("s03", "장길산");
pageContext.setAttribute("map", map);

[실행 결과]
\${map.s02} = ${map.s02}
				</pre>			
			</td>
		</tr>
		<tr>
			<td>자바Bean</td>
			<td>\${myObj.propName}</td>
			<td>자바 객체에서 프로퍼티의 값을 꺼낸다.
				<pre>
[자바 코드]
pageContext.setAttribute("member", 
		new Member()
			.setNo(100)
			.setName("홍길동")
			.setEmail("hong@test.com"));

[실행 결과]
\${member.email} = ${member.email}
				
				</pre>			
			</td>
		</tr>
	</table>
	
	<p>
		<a href="el01.jsp">[이전]</a>
		<a href="el03.jsp">[다음]</a>
	</p>
</body>
</html>









