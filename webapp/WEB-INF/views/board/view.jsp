<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<!-- 본문글 엔터로 쳐서 글내리는방법: cr value" " 사이에 엔터로 친걸로 찾아서 br로 바꿈 -->
<c:set var="cr" value="
" scope="application" />
<c:set var="br" value="<br/>" scope="application" />

<fmt:setBundle basename="jo-yong-hui.jdbc" />
<fmt:message key="url" var="url" />    
<fmt:message key="drv" var="drv" />    
<fmt:message key="usr" var="usr" />    
<fmt:message key="pwd" var="pwd" />    
   
<sql:setDataSource url="${url}" driver="${drv}"
	user="${usr}" password="${pwd}" var="mariadb"/>     
  

<sql:update dataSource="${mariadb}">
	update board set views = views + 1
	where bdno = ?
	<sql:param value="${param.bdno}" />
</sql:update> 
 
<!-- 본문글 가져오기 -->  
<sql:query var="rs" dataSource="${mariadb}">
	select* from board where bdno = ?
	<sql:param value="${param.bdno}" />
</sql:query>

     <h1>게시판 - 본문보기</h1>
      <div id="view">
    	<c:forEach var="r" items="${rs.rows}">
    	<div><label>제목</label>
    		<span>${r.title}</span></div>
    	<div><label>작성글 정보</label>
    		<span>${r.userid} / ${r.regdate} / ${r.thumbup} / ${r.views}</span></div>
    	<div><label class="dragup">본문</label>
    		<span class="contents">${fn:replace(r.contents, cr, br)}</span></div>
    	</c:forEach>
    		
    	<div><label></label>
    		<button type="button" id="listbtn" >
    		목록으로</button></div>
     </div>
 
 
	<script>
	var listbtn = document.getElementById('listbtn');
	listbtn.addEventListener('click', go2list);
	
	function go2list(){
		location.href='/mvc/board/list';
	}
	</script>
