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
<title>Marker animations with <code>setTimeout()</code></title>
<style>
#map{
	width : 70%;
	height : 800px;
	border : 1px solid red;
	float : left;
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
	<!-- <div id="floating-panel">
		<button id="drop" onclick="drop()">Drop Markers</button>
	</div> -->
	<div id="map"></div>

</body>

<script>
	var neighborhoods = [
	  <%for (int i = 0; i < subCateList.size(); i++) {%>
	  {lat: <%=subCateList.get(i).getLati()%>, lng: <%=subCateList.get(i).getLng()%>},
	  <%}%>
	];
	
	alert("등록된 맛집의 수는" + neighborhoods.length);
	var markers = [];
	var contentString=[];
	var infowindow=[];
	var map;
	
	function initMap() {
	  var myLatLng = {lat: 37.497594, lng: 127.038105};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: myLatLng
	  });
	  
	  <%for (int i = 0; i < subCateList.size(); i++) {%>
	  
		  contentString[<%=i%>]='<div id="content">'+
	      '<div id="siteNotice">'+
	      '</div>'+
	      '<h1 id="firstHeading" class="firstHeading"><%=subCateList.get(i).getName()%></h1>'+
	      '<div id="bodyContent">'+
	      '주소 : <%=subCateList.get(i).getSido()%> <%=subCateList.get(i).getGugun()%> <%=subCateList.get(i).getDong()%>'+
	      '<%=subCateList.get(i).getAddress_detail()%>'+'<br>'+
	      '<%=subCateList.get(i).getTel()%>'+'<br>'+
	      '<%=subCateList.get(i).getPic()%>'+'<br>'+
	      '<img src="/data/<%=subCateList.get(i).getPic()%>">'+
	      '</div>'+
	      '</div>';

		  infowindow[<%=i%>] = new google.maps.InfoWindow({
		    content: contentString[<%=i%>]
		  });
	  
		  markers[<%=i%>]=new google.maps.Marker({
		    position: {lat: <%=subCateList.get(i).getLati()%>, lng: <%=subCateList.get(i).getLng()%>},
		    map: map,
		    title: 'Hello World!'
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

</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0RriAhjUWzjJL9AIANougGoQCUXNXzPE&signed_in=true&callback=initMap"></script>

</html>
