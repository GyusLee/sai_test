<%@page import="com.sai.model.domain.SubCate"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<SubCate> subCateList = (List)request.getAttribute("subCateList");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Marker animations with <code>setTimeout()</code></title>
<style>
#map{
	width : 100%;
	height : 600px;
	border : 1px solid red;
}

#courseArea{
	width : 100%;
	top : 700px;
} 

#floating-panel {
	position: absolute;
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#floating-panel {
	margin-left: -52px;
}
</style>

</head>

<body>

	<div id="map">
	</div>
	<div class="container" id="courseArea">
			 <h2>★내가 만든 데이트 코스★</h2>
			 <div id="showDateCourse"></div>
	</div>
</body>


<script>
	
	var map;
	
	var neighborhoods = [
	  <%for (int i = 0; i < subCateList.size(); i++) {%>
	  {lat: <%=subCateList.get(i).getLati()%>, lng: <%=subCateList.get(i).getLng()%>},
	  <%}%>
	];
	
	alert("등록된 맛집의 수는" + neighborhoods.length);
	
	var markers = [];
	var contentString=[];
	var infowindow=[];
	
	var images=[];
	var makeDateCourseFirst=true;
	
  <%for (int i = 0; i < subCateList.size(); i++) {%>
	  
		if((1<=<%=subCateList.get(i).getT_id()%>)&&(<%=subCateList.get(i).getT_id()%><=3)){
			images[<%=i%>]="/images/food.png";
		}else if((4<=<%=subCateList.get(i).getT_id()%>)&&(<%=subCateList.get(i).getT_id()%><=5)){				
			images[<%=i%>]="/images/cafe.png";
		}else if((6<=<%=subCateList.get(i).getT_id()%>)&&(<%=subCateList.get(i).getT_id()%><=9)){
			images[<%=i%>]="/images/play.png";
		}
	
		  contentString[<%=i%>]='<div id="content">'+
	    '<div id="siteNotice">'+
	    '</div>'+
	    '<h1 id="firstHeading" class="firstHeading"><%=subCateList.get(i).getName()%></h1>'+
	    '<div id="bodyContent">'+
	    '주소 : <%=subCateList.get(i).getSido()%> <%=subCateList.get(i).getGugun()%> <%=subCateList.get(i).getDong()%>'+
	    '<%=subCateList.get(i).getAddress_detail()%>'+'<br>'+
	    '<%=subCateList.get(i).getTel()%>'+'<br>'+
	    '<%=subCateList.get(i).getPic()%>'+'<br>'+
	    '<img src="/data/<%=subCateList.get(i).getPic()%>">'+'<br>'+
	    '<button id="makeCourse" onclick=\'makeCourse(<%=i%>,<%=subCateList.get(i).getS_id()%>,<%String s_name='"'+subCateList.get(i).getName()+'"';%><%=s_name%>)\'>데이트 코스로 지정하기</button>'+
	    '</div>'+
	    '</div>';
 	<%}%>  
	
	function initMap() {
		
	
	  var myLatLng = {lat: 37.497594, lng: 127.038105};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: myLatLng
	  });
	  
	  <%for (int i = 0; i < subCateList.size(); i++) {%>
		  infowindow[<%=i%>] = new google.maps.InfoWindow({
		    content: contentString[<%=i%>]
		  });
	  		
		  markers[<%=i%>]=new google.maps.Marker({
		    position: {lat: <%=subCateList.get(i).getLati()%>, lng: <%=subCateList.get(i).getLng()%>},
		    map: map,
		    title: 'Hello World!',
		    icon: images[<%=i%>]
		  });
		  
		  markers[<%=i%>].addListener('click', function() {
			    infowindow[<%=i%>].open(map, markers[<%=i%>]);
		  });
		  
	  <%}%>
	}
	
	
	
	//화면에 보여지는 모든 마커 지우기
	function clearMarkers() {
	  for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(null);//마커도 초기화
	  }
	  markers = [];//배열정보도 초기화
	}

	function makeCourse(i,placeId,subCateName){
		var courseName;
		if(makeDateCourseFirst==true){
			alert("데이트 코스를 만드시겠습니까?");
			
			images[i]="/images/select.png"; //데이트 코스로 지정되어 이미지를 바꿔줌.
			
			//데이트 코스의 이름을 만들어 보자.
			courseName=prompt("데이트 코스의 이름을 정해주세요","예) 100일 기념 데이트 코스");
			
			//이 이름 값을 넘겨 데이트 코스를 하나 만들자.
			createDateCourse(courseName,placeId,subCateName);
			initMap();
		}else{
			alert("데이트 코스를 추가하시겠습니까?");
			images[i]="/images/select.png"; //데이트 코스로 지정되어 이미지를 바꿔줌.
			
			//이 이름 값을 넘겨 데이트 코스를 하나 만들자.
			createDateCourse(courseName,placeId,subCateName);
			initMap();
		}
	}
	
	var showDateCourse=document.getElementById("showDateCourse");
	//데이트 코스 만들기 함수
	function createDateCourse(courseName,placeId,subCateName){
		//아작스 방식으로 데이터를 요청하자.
		var xhttp=getHttp();
		
		 xhttp.onreadystatechange=function(){
			 if(xhttp.readyState==4&&xhttp.status==200){
				var data=xhttp.responseText;
				alert(data);
				alert(showDateCourse.innerHTML)
				showDateCourse.innerHTML+=data;
				alert(showDateCourse.innerHTML);
			 }
		 }

		 
		 xhttp.open("post","/admin/insertLeftCart.do","true");
		 xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		 xhttp.send("course_id="+course_id+"&couple_id="+couple_id);
		 
		 makeDateCourseFirst=false;
	}
	
	function addCart(){
		alert("장바구니가 등록되었습니다.");
	}
	
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
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0RriAhjUWzjJL9AIANougGoQCUXNXzPE&signed_in=true&callback=initMap"></script>


</html>
