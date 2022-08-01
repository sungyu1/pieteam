<%@page import="com.smhrd.model.Fire"%>
<%@page import="com.smhrd.model.Police"%>
<%@page import="com.smhrd.model.CCTV"%>
<%@page import="com.smhrd.model.Safe"%>
<%@page import="com.smhrd.model.GsDAO"%>
<%@page import="com.smhrd.model.NorthDAO"%>
<%@page import="com.smhrd.model.SouthDAO"%>
<%@page import="com.smhrd.model.EastDAO"%>
<%@page import="com.smhrd.model.WestDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
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
  	<button onclick="location='All.jsp'"> 전체</button>
  	<button onclick="location='AllN.jsp'"> 북구</button>
    <button onclick="location='AllE.jsp'"> 동구</button>
    <button onclick="location='AllW.jsp'"> 서구</button>
    <button onclick="location='AllS.jsp'"> 남구</button>
    <button onclick="location='AllGs.jsp'"> 광산구</button>
    <button type="button" onclick="showMarkers()">마크 보이기</button>
    <button type="button" onclick="hideMarkers()">마크 감추기</button>
</p> 

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=54fe48e5e772cf19d66aaa95bc9c7ba7&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.1415262, 126.7968691), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrcF = './images/소방차.png', // 마커이미지의 주소입니다    
imageSizeF = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var imageSrcP = './images/경찰차.png', // 마커이미지의 주소입니다    
imageSizeP = new kakao.maps.Size(30, 30); // 마커이미지의 크기입니다
var imageSrcC = './images/cctv.png', // 마커이미지의 주소입니다    
imageSizeC = new kakao.maps.Size(20, 20); // 마커이미지의 크기입니다
var imageSrcS = './images/어린이보호.png', // 마커이미지의 주소입니다    
imageSizeS = new kakao.maps.Size(20, 20); // 마커이미지의 크기입니다


//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
 
	var markerImageF = new kakao.maps.MarkerImage(imageSrcF, imageSizeF, imageOption)
	var markerImageP = new kakao.maps.MarkerImage(imageSrcP, imageSizeP, imageOption)
	var markerImageC = new kakao.maps.MarkerImage(imageSrcC, imageSizeC, imageOption)
	var markerImageS = new kakao.maps.MarkerImage(imageSrcS, imageSizeS, imageOption)

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
<%
	GsDAO fire = new GsDAO();
	List<Fire> list_F = fire.selectAllfireGs();
	GsDAO cctv = new GsDAO();
	List<CCTV> list_C = cctv.selectAllcctvGs();
	GsDAO police = new GsDAO();
	List<Police> list_P = police.selectAllpolGs();
	GsDAO safe = new GsDAO();
	List<Safe> list_S = safe.selectAllsafeGs();
	
/* 	System.out.print(list.get(0).getLat()); */
%>


var F_Name = [];
var F_Lat= [];
var F_Lon=[];
var F_tel=[];

var C_Name = [];
var C_Lat= [];
var C_Lon=[];
var C_tel=[];

var P_Name = [];
var P_Lat= [];
var P_Lon=[];
var P_tel=[];

var S_Name = [];
var S_Lat= [];
var S_Lon=[];


<% for (int i=0; i<list_F.size(); i++){%>
F_Lat.push(<%=list_F.get(i).getF_lat() %>)
F_Lon.push(<%=list_F.get(i).getF_lon() %>)
F_Name.push("<%=list_F.get(i).getF_addr()%>")
F_tel.push("<%=list_F.get(i).getF_tel()%>")
<%}%>

<% for (int i=0; i<list_C.size(); i++){%>
C_Lat.push(<%=list_C.get(i).getCctv_lat() %>)
C_Lon.push(<%=list_C.get(i).getCctv_lon() %>)
C_Name.push("<%=list_C.get(i).getCctv_addr()%>")
C_tel.push("<%=list_C.get(i).getCctv_tel()%>")
<%}%>

<% for (int i=0; i<list_P.size(); i++){%>
P_Lat.push(<%=list_P.get(i).getP_lat() %>)
P_Lon.push(<%=list_P.get(i).getP_lon() %>)
P_Name.push("<%=list_P.get(i).getP_addr()%>")
P_tel.push("<%=list_P.get(i).getP_tel()%>")
<%}%>

<% for (int i=0; i<list_S.size(); i++){%>
S_Lat.push(<%=list_S.get(i).getSz_lat() %>)
S_Lon.push(<%=list_S.get(i).getSz_lon() %>)
S_Name.push("<%=list_S.get(i).getSz_addr()%>")

<%}%>
var positions_F=[]
var clickedOverlay = null;
	for(var i = 0 ; i<F_Name.length;i++) {
		positions_F.push({
	    	content:'<div class="wrap">' + 
	    	
	        '    <div class="info" >' + 
	        '        <div class="title">' +
	        '       소방서' + 
	        '            <div class="close" onclick="closeOverlayF('+i+')" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
            '                <img src="./images/소방차.png" width="73" height="70">' +
            '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="ellipsis">주소 : ' +F_Name[i]+'</div>' + '<br>' + 
	        '                <div class="jibun ellipsis">관리전화번호 : '+F_tel[i]+'</div>' + '<br>' +
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>', 
	        latlng: new kakao.maps.LatLng(F_Lat[i], F_Lon[i])
		});
	}
	var positions_C=[]
	var clickedOverlay = null;
		for(var i = 0 ; i<C_Name.length;i++) {
			positions_C.push({
		    	content:'<div class="wrap">' + 
		    	
		        '    <div class="info" >' + 
		        '        <div class="title">' +
		        '       CCTV' + 
		        '            <div class="close" onclick="closeOverlayC('+i+')" title="닫기"></div>' + 
		        '        </div>' + 
		        '        <div class="body">' + 
		        '            <div class="img">' +
	            '                <img src="./images/cctv.png" width="73" height="70">' +
	            '           </div>' + 
		        '            <div class="desc">' + 
		        '                <div class="ellipsis">주소 : ' +C_Name[i]+'</div>' + '<br>' + 
		        '                <div class="jibun ellipsis">관리전화번호 : '+C_tel[i]+'</div>' + '<br>' +
		        '            </div>' + 
		        '        </div>' + 
		        '    </div>' +    
		        '</div>', 
		        latlng: new kakao.maps.LatLng(C_Lat[i], C_Lon[i])
			});
		}
		var positions_P=[]
		var clickedOverlay = null;
			for(var i = 0 ; i<P_Name.length;i++) {
				positions_P.push({
			    	content:'<div class="wrap">' + 
			    	
			        '    <div class="info" >' + 
			        '        <div class="title">' +
			        '       경찰서' + 
			        '            <div class="close" onclick="closeOverlayP('+i+')" title="닫기"></div>' + 
			        '        </div>' + 
			        '        <div class="body">' + 
			        '            <div class="img">' +
		            '                <img src="./images/경찰차.png" width="73" height="70">' +
		            '           </div>' + 
			        '            <div class="desc">' + 
			        '                <div class="ellipsis">주소 : ' +P_Name[i]+'</div>' + '<br>' + 
			        '                <div class="jibun ellipsis">관리전화번호 : '+P_tel[i]+'</div>' + '<br>' +
			        '            </div>' + 
			        '        </div>' + 
			        '    </div>' +    
			        '</div>', 
			        latlng: new kakao.maps.LatLng(P_Lat[i], P_Lon[i])
				});
			}
			var positions_S=[]
			var clickedOverlay = null;
				for(var i = 0 ; i<S_Name.length;i++) {
					positions_S.push({
				    	content:'<div class="wrap">' + 
				    	
				        '    <div class="info" >' + 
				        '        <div class="title">' +
				        '       어린이보호구역' + 
				        '            <div class="close" onclick="closeOverlayS('+i+')" title="닫기"></div>' + 
				        '        </div>' + 
				        '        <div class="body">' + 
				        '            <div class="img">' +
			            '                <img src="./images/어린이보호.png" width="73" height="70">' +
			            '           </div>' + 
				        '            <div class="desc">' + 
				        '                <div class="ellipsis">주소 : ' +S_Name[i]+'</div>' + '<br>' + 
				        '            </div>' + 
				        '        </div>' + 
				        '    </div>' +    
				        '</div>', 
				        latlng: new kakao.maps.LatLng(S_Lat[i], S_Lon[i])
					});
				}
	
	// 오버레이를 담을 리스트 생성
	var overlay_listF=[]
	var overlay_listC=[]
	var overlay_listP=[]
	var overlay_listS=[]
	
	// 마커를 담을 리스트 생성
	var marker_listF=[]
	var marker_listC=[]
	var marker_listP=[]
	var marker_listS=[]
	
	var clickedOverlay = null;
	
	// 마커를 생성합니다
	for (var i = 0; i < positions_F.length; i ++) {
	var markerF = new kakao.maps.Marker({
	  map : map,
	  position: positions_F[i].latlng,
	  image: markerImageF // 마커이미지 설정 
	
	});
	
	markerF.setMap(map);  
	marker_listF.push(markerF)
	 var overlayF = new kakao.maps.CustomOverlay({
        content: positions_F[i].content,
        map: map,
        position: positions_F[i].latlng      
    });
	
	 overlay_listF.push(overlayF)
	  overlayF.setMap(null)
	  kakao.maps.event.addListener(markerF, 'click', function() {
	    
	  // 다른 마커를 클릭하면 기존의 커스텀 오버레이가 닫힘
	  if (clickedOverlay) {   
	        clickedOverlay.setMap(null);
	    }
	    
	    var index = marker_listF.indexOf(this);
      	overlay_listF[index].setMap(map); 
	    clickedOverlay = overlay_listF[index];});
	}
	
	
	for (var i = 0; i < positions_P.length; i ++) {
	
	var markerP = new kakao.maps.Marker({
		  map : map,
		  position: positions_P[i].latlng,
		  image: markerImageP // 마커이미지 설정 
		
		});
	
	markerP.setMap(map); 
	marker_listP.push(markerP)
		 var overlayP = new kakao.maps.CustomOverlay({
	        content: positions_P[i].content,
	        map: map,
	        position: positions_P[i].latlng      
	    });
	  overlay_listP.push(overlayP)
	  overlayP.setMap(null)
	  kakao.maps.event.addListener(markerP, 'click', function() {
	    
	  // 다른 마커를 클릭하면 기존의 커스텀 오버레이가 닫힘
	  if (clickedOverlay) {   
	        clickedOverlay.setMap(null);
	    }
	    
	    var index = marker_listP.indexOf(this);
      	overlay_listP[index].setMap(map); 
	    clickedOverlay = overlay_listP[index];});
	}
	
	for (var i = 0; i < positions_C.length; i ++) {  
		
		var markerC = new kakao.maps.Marker({
			  map : map,
			  position: positions_C[i].latlng,
			  image: markerImageC // 마커이미지 설정 
			
			});
	  
		markerC.setMap(map);  
		marker_listC.push(markerC)
		 var overlayC = new kakao.maps.CustomOverlay({
	        content: positions_C[i].content,
	        map: map,
	        position: positions_C[i].latlng      
	    });
		
		 overlay_listC.push(overlayC)
		  overlayC.setMap(null)
		  kakao.maps.event.addListener(markerC, 'click', function() {
	    
	  // 다른 마커를 클릭하면 기존의 커스텀 오버레이가 닫힘
	  if (clickedOverlay) {   
	        clickedOverlay.setMap(null);
	    }
	    
	    var index = marker_listC.indexOf(this);
      	overlay_listC[index].setMap(map); 
	    clickedOverlay = overlay_listC[index];});
	}
	
	
	for (var i = 0; i < positions_S.length; i ++) {  
		
	var markerS = new kakao.maps.Marker({
		  map : map,
		  position: positions_S[i].latlng,
		  image: markerImageS// 마커이미지 설정 
		
		});

	// 마커가 지도 위에 표시되도록 설정합니다

	 
	
	markerS.setMap(map);  
	
	
	// 마커 리스트에 마커들을 담음

	
	marker_listS.push(markerS)

	
	 // 마커에 표시할 인포윈도우를 생성합니다 



	 var overlayS = new kakao.maps.CustomOverlay({
	        content: positions_S[i].content,
	        map: map,
	        position: positions_S[i].latlng      
	    });
	 
  // 오버레이 리스트에 오버레이를 담음

 

  overlay_listS.push(overlayS)

  // 오버레이를 맵에 표시하지 않는다.



  overlayS.setMap(null)

  // 마커를 클릭했을 때 커스텀 오버레이가 열리는 함수
  /*       kakao.maps.event.addListener(marker, 'click', function() {
  		var index = marker_list.indexOf(this);
      	overlay_list[index].setMap(map); 
  	});   */
  	
 
 
  	kakao.maps.event.addListener(markerS, 'click', function() {
	    
	  // 다른 마커를 클릭하면 기존의 커스텀 오버레이가 닫힘
	  if (clickedOverlay) {   
	        clickedOverlay.setMap(null);
	    }
	    
	    var index = marker_listS.indexOf(this);
      	overlay_listS[index].setMap(map); 
	    clickedOverlay = overlay_listS[index];});
	}
	
//	=========================================================
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlayF(num) {
		overlay_listF[num].setMap(null);     
	}
	function closeOverlayC(num) {
		overlay_listC[num].setMap(null);     
	}
	function closeOverlayS(num) {
		overlay_listS[num].setMap(null);     
	}
	function closeOverlayP(num) {
		overlay_listP[num].setMap(null);     
	}
	
	function setMarkers(map) {
	    for (var i = 0; i < positions_C.length; i++) {
	        marker_listC[i].setMap(map);
	    }
	    for (var i = 0; i < positions_F.length; i++) {
	        marker_listF[i].setMap(map);
	    }
	    for (var i = 0; i < positions_P.length; i++) {
	        marker_listP[i].setMap(map);
	    }
	    for (var i = 0; i < positions_S.length; i++) {
	        marker_listS[i].setMap(map);
	    }            
	}
	

	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
		setMarkers(map);   
	  
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