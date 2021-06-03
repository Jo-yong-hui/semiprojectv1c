<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html lang = "ko">

<h2>회원가입</h2>
  <form name = "joinfrm" id = "joinfrm" method="post">
  <div><label for = "userid">아이디</label>
<input type = "text" name = "userid" id="userid"></div>

  <div><label for = "passwd">비밀번호</label>
<input type = "password" name = "passwd" id="passwd"></div>

  <div><label for = "chkpwd">비밀번호확인</label>
<input type = "password" name = "chkpwd" id="chkpwd"></div>

   <div><label for = "name">이 름</label>
      <input type = "text" name = "name" id="name">
      </div>

   <div><label for = "email">이메일</label>
      <input type = "text" name = "email" id="email">
      </div>


	  <div><label></label> <!-- 버튼만들기-->
<button type="button" id="okbtn">입력완료</button>
          <button type="reset">다시입력</button></div>
  </form>
  