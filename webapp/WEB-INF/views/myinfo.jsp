<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<!-- helloworld myinfo를 줄여쓴 방법 -->
<c:if test="${empty sessionScope.userid }">
<script>alert('로그인하세요!');
		location.href='/mvc/login';</script>
</c:if>

<fmt:setBundle basename="jo-yong-hui.jdbc" />
<fmt:message key="url" var="url" />    
<fmt:message key="drv" var="drv" />    
<fmt:message key="usr" var="usr" />    
<fmt:message key="pwd" var="pwd" />  

<sql:setDataSource url="${url}" driver="${drv}"
user="${usr}" password="${pwd}" var="mariadb"/>


<sql:query var="rs" dataSource="${mariadb}">
	select name, email, joindate from member
	where userid = ?
	<sql:param value="${sessionScope.userid}"/>
</sql:query>

<c:forEach var="row" items="${rs.rows}">
	<c:set var="name" value="${row.name}" />
	<c:set var="email" value="${row.email}" />
	<c:set var="joindate" value="${row.joindate}" />
</c:forEach>



        <h2>회원정보</h2>
        <div id = "myinfo">
            <div><span class = "label">아이디</span>
                <span>${sessionScope.userid}</span></div>
          <div><span class = "label">이름</span>
                <span>${name}</span></div>
             <div><span class = "label">이메일</span>
                <span>${email}</span></div>
             <div><span class = "label">가입일</span>
                <span>${joindate}</span></div>
 		</div>
   
   
</body>
</html>