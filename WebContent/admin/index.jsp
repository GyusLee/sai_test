<%@page import="com.sai.model.domain.Address"%>
<%@page import="com.sai.model.domain.MasterCate"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	List<MasterCate> masterCateList= (List)request.getAttribute("masterCateList");
	
	List<Address> sidoList=(List)request.getAttribute("sidoList");
	System.out.println(sidoList.size());
	for(int i=0; i<sidoList.size(); i++){
		System.out.print(sidoList.get(i).getSido());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#map{
	width : 70%;
	height : 700px;
	float : left;
}

#info{
	width : 25%;
	height: 700px;
	float : left;	
}

ul{
	width : 90%;
	hight : 60%;
}

ul li{
	list-style : none;
}

ul li img{
	width : 100%;
}

textarea{
	width : 80%;
	
}

#star img{
	width : 16%;
}
</style>

<script>

//원하는 위도 경도 및 줌을 설정하여 지도를 출력하자
//callback은 개발자가 호출하는 것이 아닌 시스템이 호출하는 것이다.
function loadMap(){
	var container = document.getElementById("map");
	 
	var option = {
			center : new google.maps.LatLng(37.497594, 127.038105),
			zoom : 30
	}
	
	var map = new google.maps.Map(container,option);
	var lati;
	var lng;
	
	
	var marker;
	map.addListener('click', function(event) {
		//관리자 페이지에서는 마커가 하나만 뜨도록 하자.
		if(marker!=null){
			marker.setMap(null);
		}
	    // 3 seconds after the center of the map has changed, pan back to the
	    // marker.
	   //alert(event.latLng.lat() + "," + event.latLng.lng());
	   lati=event.latLng.lat();
	   lng= event.latLng.lng();
	
	   form1.lati.value=lati;
	   form1.lng.value=lng;
	   
	   addMarker({lat: lati, lng: lng},map);
	 });
	
	// Adds a marker to the map.
	function addMarker(location, map) {
	  
	  var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<div id="bodyContent">'+
      '<p>여기가 진정한 맛집</p>'+
      '</div>'+
      '</div>';

	  var infowindow = new google.maps.InfoWindow({
	    content: contentString
	  });
	  
	   marker = new google.maps.Marker({
		    position: {lat: lati, lng: lng},
		    map: map,
		    title: "여기가 맛집이다.",
		    animation : google.maps.Animation.DROP,
		   // icon : "/MapApp/images/full.png"
	 	});
	   
	   marker.addListener("click", function(){
		   infowindow.open(map, marker);
	   });
	}
}
/*
 * 매개변수로 넘길 input : file 컴포넌트
 */
function preView(){
	  
      var oFReader = new FileReader();
      oFReader.readAsDataURL(document.getElementById("img").files[0]);

      oFReader.onload = function (oFREvent) {
          document.getElementById("preImg").src = oFREvent.target.result;
      };

}
  
 function Score(option){
	 
	 var star=document.getElementById("star");
	 if(option==0.5){
		 star.innerHTML="<img src=\"/images/half.png\">";
	 }else if(option==1){
		 star.innerHTML="<img src=\"/images/full.png\">";
	 }else if(option==1.5){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/half.png\">";
	 }else if(option==2){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/full.png\">";
	 }else if(option==2.5){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/half.png\">";
	 }else if(option==3){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\">";
	 }else if(option==3.5){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/half.png\">";
	 }else if(option==4){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\">";
	 }else if(option==4.5){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/half.png\">";
	 }else if(option==5){
		 star.innerHTML="<img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\"><img src=\"/images/full.png\">";
	 }
	 
 }
 
 //******************************************************************************
 //수정 등록 삭제 관련
 function regist(){
		form1.encoding="multipart/form-data";
		form1.action="/admin/regist.do";
		form1.submit();
}
 
 function update(){
	 
 }
 
 function delete1(){
	 
 }
 //*******************************************************************************
 //topcate select option 설정 관련
 
function Mtype(option){
	 var Mid;
	 <%for(int i=0;i<masterCateList.size();i++){%>
	 	if(option=="<%=masterCateList.get(i).getM_type()%>"){
	 		Mid=<%=masterCateList.get(i).getM_id()%>;
	 	}
	 <%}%>
	 
	 //ajax방식으로 topCategoryd의 값들을 받아오자!!
	 var xhttp=getHttp();
	 
	 xhttp.onreadystatechange=function(){
		 if(xhttp.readyState==4&&xhttp.status==200){
			 alert("서버에 요청 전달 완료");
			 var data = xhttp.responseText;
			 alert(data);
			 var Ttype = document.getElementById("t_type");
			 Ttype.innerHTML=data;
		 }
	 }
	 
	 xhttp.open("post","/admin/selectTopCate.do","true");
	 xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	 xhttp.send("Mid="+Mid);
 }
 
 //sido select option관련
 function Sido(option){
	//ajax방식으로 topCategoryd의 값들을 받아오자!!
	 var xhttp=getHttp();
	 
	 xhttp.onreadystatechange=function(){
		 if(xhttp.readyState==4&&xhttp.status==200){
			 alert("서버에 요청 전달 완료");
			 var data = xhttp.responseText;
			 alert(data);
			 var gugun=document.getElementById("gugun");
			 gugun.innerHTML=data;
		 }
	 }
	
	 xhttp.open("post","/admin/selectGugun.do","true");
	 xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	 xhttp.send("sido="+option);
 }
 
 //gugun select option관련
 function Gugun(option){
	//ajax방식으로 topCategoryd의 값들을 받아오자!!
	 var xhttp=getHttp();
	 
	 xhttp.onreadystatechange=function(){
		 if(xhttp.readyState==4&&xhttp.status==200){
			 alert("서버에 요청 전달 완료");
			 var data = xhttp.responseText;
			 alert(data);
			 var dong=document.getElementById("dong");
			 dong.innerHTML=data;
		 }
	 }
	
	 xhttp.open("post","/admin/selectDong.do","true");
	 xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	 xhttp.send("gugun="+option);
 }
 //**************************************************
 //Ttype 선택시 그 아이디 값 받아오자
 function Ttype(option){
	 var t_id=document.getElementById("t_id");
	 t_id.value=option;
	 alert(t_id.value);
 }
 
 // *************************************************
 // 비동기 방식으로 가져오자
function getHttp() {
	var xhttp; //비동기 요청을 처리하는 핵심 객체!!
	if (xhttp == undefined) {
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();//모든 브라우저 공통 방법
		} else {
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xhttp;
}
function back(){
	form1.action="../main/list.do"
	form1.submit();
}
 
</script>
</head>
<body>
	<div id="map">여기에 지도 나올 예정</div>
	<div id="info">
	<form name="form1" method="post">
		<ul>
		<input type="button" class="btn btn-primary btn-block" onClick="back()" value="뒤로가기"><br>
			<li><input type="text" class="form-control input-sm"placeholder="위도" name="lati"></li>
			<li><input type="text" class="form-control input-sm"placeholder="경도" name="lng"></li>
			<li>
				
				<select name="m_type" class="form-control input-sm"onChange ="Mtype(this.value)">
					<option> 범주 1 ▼</option>
					<%for(int i=0;i<masterCateList.size();i++){ %>
					<option><%=masterCateList.get(i).getM_type() %></option>
					<%} %>
				</select>
			</li>
			<li>
				<select id="t_type"class="form-control input-sm" onChange="Ttype(this.value)">
					<option> 범주 2 ▼</option>
				</select>
				<input type="hidden" name="t_id" id="t_id">
			</li>
			<li><input type="text" class="form-control input-sm"placeholder="상호명"  name="name"></li>
			<li>주소 
			<br> 
			<select name="sido" class="form-control input-sm"onChange="Sido(this.value)">
				<%for(int i=0;i<sidoList.size();i++){ %>
				<option> 시 ▼</option>
				<option><%=sidoList.get(i).getSido() %></option>
				<%} %>	
			</select> 	
			
			<select name="gugun"class="form-control input-sm" id="gugun" onChange="Gugun(this.value)">
			<option> 구 ▼<option>
			</select> 
			
			<select name="dong" class="form-control input-sm" id="dong">
			<option> 동 ▼<option>
			</select>
			</li>
			<li><input type="text" class="form-control input-sm" placeholder="업체 상세 주소"  name="address_detail"></li>
			<li><input type="text" class="form-control input-sm" placeholder="전화번호" name="tel"></li>
			<li><input type="file" class="form-control input-sm" id="img" name="myFile" onChange="preView()"></li>
			<li><img id="preImg" src="http://www.iyimi.com/wp-content/themes/qaengine/img/default-thumbnail.jpg"></li>
			<li><textarea name="content" class="form-control input-sm"  placeholder="업체 상세 정보"  ></textarea></li>
			<li>
				<select onChange="Score(this.value)">
					<%for(int i=1;i<=10;i++){ %>
					<option><%=i*0.5 %></option>
					<%}%>
				</select>
			</li>
			<li>
				<span id="star">
					<img src="/images/half.png">
				</span>
			</li>
			<li>
			<input type="button" class="btn btn-default btn-sm" value="등록" onClick="regist()">
			<input type="button" class="btn btn-default btn-sm" value="수정" onClick="update()">
			<input type="button" class="btn btn-danger btn-sm"value="삭제" onClick="delete1()">
			
			</li>
		</ul>
	</form>
	</div>
</body>
</html>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0RriAhjUWzjJL9AIANougGoQCUXNXzPE&callback=loadMap"></script>