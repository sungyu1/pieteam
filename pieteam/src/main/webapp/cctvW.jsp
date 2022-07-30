
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.WestDAO"%>
<%@page import="com.smhrd.model.CCTV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://kit.fontawesome.com/b163195086.js" crossorigin="anonymous"></script>
    <style>
 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis { display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
    /* 여러 줄 자르기 추가 스타일 */
    white-space: normal; }
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
 
</style>
  


</head>
<body>

	<div id="wrapper">
		<h2 class="major" style="color: #FFB432">안심경로</h2>
		
<div id="map" style="width:1000px;height:600px;"></div>
<p>
    <button onclick="hideMarkers()">마커 감추기</button>
    <button onclick="showMarkers()">마커 보이기</button>
</p> 

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=54fe48e5e772cf19d66aaa95bc9c7ba7&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.15550765, 126.8989809), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = './images/cctv.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(20, 20), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
 
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
<%
	WestDAO dao = new WestDAO();
	List<CCTV> list = dao.selectAllcctvW();
	System.out.println(list.size());
/* 	System.out.print(list.get(0).getLat()); */
%>

var Name = [];
var Lat= [];
var Lon=[];
var admin=[];
var tel=[];
<% for (int i=0; i<list.size(); i++){%>
Lat.push(<%=list.get(i).getCctv_lat() %>)
Lon.push(<%=list.get(i).getCctv_lon() %>)
Name.push("<%=list.get(i).getCctv_addr()%>")
tel.push("<%=list.get(i).getCctv_tel()%>")
admin.push("<%=list.get(i).getAdmin_id()%>")


<%}%>
var positions=[]
var clickedOverlay = null;
	for(var i = 0 ; i<Name.length;i++) {
		positions.push({
	    	content:'<div class="wrap">' + 
	    	
	        '    <div class="info" >' + 
	        '        <div class="title">' +
	        '       CCTV' + 
	        '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
            '                <img src="./images/cctv.png" width="73" height="70">' +
            '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="ellipsis">주소 : ' +Name[i]+'</div>' + '<br>' + 
	        '                <div class="jibun ellipsis">관리전화번호 : '+tel[i]+'</div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>', 
	        latlng: new kakao.maps.LatLng(Lat[i], Lon[i])
		});
	}
	
	// 오버레이를 담을 리스트 생성
	var overlay_list=[]
	var marker_list=[]
	var clickedOverlay = null;
	// 마커를 생성합니다
	for (var i = 0; i < positions.length; i ++) {
	var marker = new kakao.maps.Marker({
	  map : map,
	  position: positions[i].latlng,
	  image: markerImage // 마커이미지 설정 
	
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
	
	// 마커 리스트에 마커들을 담음
	marker_list.push(marker)
	
	 // 마커에 표시할 인포윈도우를 생성합니다 
  var overlay = new kakao.maps.CustomOverlay({
        content: positions[i].content,
        map: map,
        position: positions[i].latlng      
    });
	 
  // 오버레이 리스트에 오버레이를 담음
  overlay_list.push(overlay)

  // 오버레이를 맵에 표시하지 않는다.
  overlay.setMap(null)

  // 마커를 클릭했을 때 커스텀 오버레이가 열리는 함수
  /*       kakao.maps.event.addListener(marker, 'click', function() {
  		var index = marker_list.indexOf(this);
      	overlay_list[index].setMap(map); 
  	});   */
  	
  kakao.maps.event.addListener(marker, 'click', function() {
	    
	  // 다른 마커를 클릭하면 기존의 커스텀 오버레이가 닫힘
	  if (clickedOverlay) {   
	        clickedOverlay.setMap(null);
	    }
	    
	    var index = marker_list.indexOf(this);
      	overlay_list[index].setMap(map); 
	    clickedOverlay = overlay_list[index];
	  });

	}
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay(num) {
		overlay_list[num].setMap(null);     
	}
	
	function setMarkers(map) {
	    for (var i = 0; i < positions.length; i++) {
	        marker_list[i].setMap(map);
	    }            
	}

	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)    
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}

</script>
</div>
	<!-- BG -->
	<div id="bg"></div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>