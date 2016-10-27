<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Daum 지도 시작하기</title>
</head>
<style>
/* 커스텀 오버레이를 위한 클래스 정의 */
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=af2d0a5a5671f3603feadbf4faae4608&libraries=services,clusterer,drawing"></script>
<script>
	var map; //생성한 지도
	var markerArray = new Array(); //오버레이를 설정하고 담기 위한 메서드
	var markerSize;
	
	window.onload = function() {
		create_map();
		create_markers();
		create_customOverlay();
	}

	//다음 지도 생성하기
	function create_map() {
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(33.450701, 126.570667),
			level : 3
		};
		map = new daum.maps.Map(container, options);
	}

	//여러개의 마커 생성하기
	function create_markers() {
		var positions = [ {
			title : '카카오',
			latlng : new daum.maps.LatLng(33.450705, 126.570677)
		}, {
			title : '생태연못',
			latlng : new daum.maps.LatLng(33.450936, 126.569477)
		}, {
			title : '텃밭',
			latlng : new daum.maps.LatLng(33.450879, 126.569940)
		}, {
			title : '근린공원',
			latlng : new daum.maps.LatLng(33.451393, 126.570738)
		} ];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new daum.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});
			markerArray.push(marker);
		}
		
		//마커의 사이즈를 저장해두자
		markerSize = markerArray.length;
	}

	//커스텀 오버레이 생성하기
	function create_customOverlay() {
		var overlayArray = new Array();
		
		var content = '<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            카카오 스페이스닷원'
				+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
				+ '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>';
				
		//마커 위에 커스텀오버레이를 표시합니다
		//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		
		for(var i=0;i<markerSize;i++){
			//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			var num = i; 
			daum.maps.event.addListener(markerArray[num], 'click', function() {
				alert("클릭 될까?"+num);
				 var overlay = new daum.maps.CustomOverlay({
						content : content,
						map : map,
						position : markerArray[num].getPosition()
					});
				 
				overlayArray.push(overlay); 
				console.log(overlayArray.length);
				console.log(overlayArray[num]);
				overlayArray[num].setMap(map);
			});   
		}
		
	}

	//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
		overlay.setMap(null);
	} 
</script>
<body>
	<div id="map" style="width: 1000px; height: 700px;"></div>
</body>
</html>