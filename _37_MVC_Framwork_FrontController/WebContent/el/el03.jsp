<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 연산자</title>
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
		<a href="el02.jsp">[이전]</a>
		<a href="el04.jsp">[다음]</a>
	</p>
	
	<h2>연산자</h2>
	<%
		pageContext.setAttribute("title", "EL 연산자!");
	%>
	
	<table>
		<tr>
			<td>분류</td>
			<td>연산자</td>
			<td>EL 코드 = 실행 결과</td>
		</tr>
		<tr>
			<td>산술</td>
			<td>+, -, *, /, %</td>
			<td>
				<pre>
\${10+20} = ${10+20}
\${10-20} = ${10-20}
\${10*20} = ${10*20}
\${10/20} = ${10/20}
\${10%20} = ${10%20}
				</pre>
			</td>
		</tr>
		<tr>
			<td>논리</td>
			<td>and(&&), or(||), not(!)</td>
			<td>
				<pre>
\${true && false} = ${true && false}  
\${true and false} = ${true and false}  
\${true || false} = ${true || false}  
\${true or false} = ${true or false}  
\${!true} = ${!true}  
\${not true} = ${not true}  
				</pre>
			</td>
		</tr>
		<tr>
			<td>관계</td>
			<td>==(eq), !=(ne), &lt;(lt), &gt;(gt),<br> 
				&lt;=(le), &gt;=(ge) 
			</td>
			<td>
				<pre>
\${10 == 11} = ${10 == 11}
\${10 eq 11} = ${10 eq 11}
\${10 != 11} = ${10 != 11}
<!-- \${10 ne 11} = ${10 ne 11} -->
\${10 < 11} = ${10 < 11}
\${10 lt 11} = ${10 lt 11}
\${10 > 11} = ${10 > 11}
\${10 gt 11} = ${10 gt 11}
\${10 <= 11} = ${10 <= 11}
\${10 le 11} = ${10 le 11}
\${10 >= 11} = ${10 >= 11}
\${10 ge 11} = ${10 ge 11}
				
				</pre>
			</td>
		</tr>
		<tr>
			<td>Empty검사</td>
			<td>empty</td>
			<td>
				<pre>
\${empty title} = ${empty title}
\${empty title2} = ${empty title2}
				</pre>
			</td>
		</tr>
		<tr>
			<td>조건 연산자</td>
			<td>조건 ? A : B</td>
			<td>
				<pre>
\${10 > 20 ? "크다" : "작다"} = ${10 > 20 ? "크다" : "작다"}
				</pre>
			</td>
		</tr>
	</table>
	
	<p>
		<a href="el02.jsp">[이전]</a>
		<a href="el04.jsp">[다음]</a>
	</p>
</body>
</html>

















