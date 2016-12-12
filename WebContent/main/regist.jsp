<%@page import="com.sai.model.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%! Member member=new Member(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript" src="../javascript/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<script>
var naver_id_login;
var m_email;
var m_name;
var m_nickname;
var m_gender;

window.addEventListener("load",function(){
	init();
});
function init(){
	
	naver_id_login = new naver_id_login(
			"pqNlMHIsCEOCGmed5SSe", "http://70.12.112.115:9090/main/regist.jsp");
	naver_id_login.setDomain(".service.com"); //상태 토큰 비교를 위한 domain 설정
	
	m_email=document.getElementById("m_email");
	m_name=document.getElementById("m_name");
	m_nickname=document.getElementById("m_nickname");
	m_gender=document.getElementById("m_gender");
	naver_id_login.get_naver_userprofile("naverSignInCallback()");

	}
function naverSignInCallback() {
	// naver_id_login.getProfileData('프로필항목명');
	// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
	m_email.value=naver_id_login.getProfileData('email');
	m_name.value=naver_id_login.getProfileData('name');
	m_nickname.value=naver_id_login.getProfileData('nickname');
	m_gender.value=naver_id_login.getProfileData('gender');

	form1.action="/main/temp.do";
  	form1.submit();
}
</script>
<body>

<form name="form1" method="post">
<input type="hidden" id="m_email" name="m_email" value="">
<input type="hidden" id="m_name" name="m_name" value="">
<input type="hidden" id="m_nickname" name="m_nickname" value="">
<input type="hidden" id="m_gender" name="m_gender" value="">
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->

</form>
</body>
</html>