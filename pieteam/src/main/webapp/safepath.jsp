<%@page import="com.smhrd.model.Fire"%>
<%@page import="com.smhrd.model.Police"%>
<%@page import="com.smhrd.model.CCTV"%>
<%@page import="com.smhrd.model.Safe"%>
<%@page import="com.smhrd.model.AllDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>안심경로</title>
  <link rel="stylesheet" href="assets/css/safepath.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="map_wrap">
    <!-- <form onsubmit="searchPlaces(this.keyword.value); return false;">
      
    </form> -->
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div style="margin-top: 10px;">  
      출발지 : <input type="text" id="start" name="keyword" size="15"> 
      도착지 : <input type="text" id="end" name="keyword" size="15"> 
      <button type="button" id="reset" onclick="reset()">경로 재검색</button>
      <button type="button" id="saferoad" onclick="saferoad()">안전경로</button> 
      <button type="button" id="fastroad" onclick="fastroad()">빠른안전경로</button> 
    </div>
      <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54fe48e5e772cf19d66aaa95bc9c7ba7&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];
var markerstart = [];
var markerend = [];

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
	AllDAO fire = new AllDAO();
	List<Fire> list_F = fire.selectAllfire();
	AllDAO cctv = new AllDAO();
	List<CCTV> list_C = cctv.selectAllcctv();
	AllDAO police = new AllDAO();
	List<Police> list_P = police.selectAllpol();
	AllDAO safe = new AllDAO();
	List<Safe> list_S = safe.selectAllsafe();
	
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

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    keyword2= "광주광역시"+keyword
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword2, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    marker_list=[];
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title, placePosition) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };

            // 리스트 클릭시 이벤트 
            itemEl.onclick = function () {
              var start = document.getElementById('start');
              var end = document.getElementById('end');
              infowindow.open(map, marker);
              if(start.value==''){
                start.value = title;
                removeMarker();
                removeMarkerStart();
                marker.setMap(map);
                markerstart.push(marker);
                console.log(markerstart)
              }else if(end.value==''){
                end.value = title;
                removeMarker();0
                removeMarkerEnd();
                marker.setMap(map);
                markerend.push(marker);
              }else{
                removeMarkerAll();
              }
              // var menu = document.getElementById('menu_wrap');
              // menu.style.display = "none"

            }

       
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }


    $('#reset').on('click', function(){
        removeMarker();
        removeMarkerAll();

    });

function removeMarkerAll() { // 경로기입을 다 했을때 초기화시 지도에 있는 마커 표시 다 삭제
    for ( var i = 0; i < markerstart.length; i++ ) {
        
        markerstart[i].setMap(null);
        markerend[i].setMap(null);
        start.value='';
        end.value='';
    }
    markerstart = [];
    markerend = [];
}

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

kakao.maps.event.addListener(markers, 'click', function() {
    function clickedmarker(num) {
        clickedmarker.setMap(null);     
    }
    var index = markers.indexOf(this);
    markers[index].setMap(map); 
    clickedmarker = markers[index];
    });

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

function removeMarkerStart() {
    for ( var i = 0; i < markerstart.length; i++ ) {
        markerstart[i].setMap(null);
    }   
    markers = [];
}

function removeMarkerEnd() {
    for ( var i = 0; i < markerend.length; i++ ) {
        markerend[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    // infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

<script id="data" value="poly">

    var polylinePath1 = [
        new kakao.maps.LatLng(35.155028, 126.911664),
        new kakao.maps.LatLng(35.154765, 126.911352),
        new kakao.maps.LatLng(35.153923, 126.912533),
        new kakao.maps.LatLng(35.153406, 126.911991),
        new kakao.maps.LatLng(35.152476, 126.913375),
        new kakao.maps.LatLng(35.151870, 126.912733),
        new kakao.maps.LatLng(35.150007, 126.915355),
        new kakao.maps.LatLng(35.148834, 126.913920),
        new kakao.maps.LatLng(35.148291, 126.913486),
        new kakao.maps.LatLng(35.147227, 126.912089)
    ];   
    
    var polylinePath2 = [
        new kakao.maps.LatLng(35.155028, 126.911664),
        new kakao.maps.LatLng(35.154765, 126.911352),
        new kakao.maps.LatLng(35.153923, 126.912533),
        new kakao.maps.LatLng(35.153406, 126.911991),
        new kakao.maps.LatLng(35.152476, 126.913375),
        new kakao.maps.LatLng(35.151870, 126.912733),
        new kakao.maps.LatLng(35.151021, 126.914036),
        new kakao.maps.LatLng(35.149315, 126.912018),
        new kakao.maps.LatLng(35.148807, 126.912435),
        new kakao.maps.LatLng(35.148230, 126.911183),
        new kakao.maps.LatLng(35.147227, 126.912089)
    ];   
    

</script>

<script id="roadMap">
    function saferoad1() {
        // var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        //         mapOption = { 
            //             center: new kakao.maps.LatLng(35.155028, 126.911664), // 지도의 중심좌표
            //             level: 3 // 지도의 확대 레벨
            //         };
            // // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            // var map = new kakao.maps.Map(mapContainer, mapOption);
            
            var polyline1 = new kakao.maps.Polyline({
                map: map,
                path: polylinePath1,
                strokeWeight: 4,
                strokeColor: '#6799FF',
                strokeOpacity: 0.7,
                // strokeStyle: 'gradient'
            });
        }
        
    function fastroad() {
        var polyline2 = new kakao.maps.Polyline({
        map: map,
        path: polylinePath2,
        strokeWeight: 4,
        strokeColor: '#F15F5F',
        strokeOpacity: 0.7,
        // strokeStyle: 'gradient'
        });
        
        var line = new kakao.maps.Marker({
            position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
            map: map
        });

        // if(saferoad != null){
        //     saferoad();
        // }else{
        //     fastroad();
        // }

        // 각개 버튼이 클릭될 때 해당 버튼의 구현하고 싶은 코드 구현 방법
        // $(".click-btn").on('click', function(e){
        //     if(e.target.id === 'saferoad'){
        //         saferoad();
        //         fastroad(null);
        //     }else if(e.target.id === 'fastroad'){
        //         fastroad();
        //         saferoad(null);
        //     }
        // });
        
    }
    function saferoad(){
        saferoad1();
        fastroad();
        infowindow.open(map, marker);
        
        // if(polylinePath1.onclick)
        // $(".poly").on('click', function(e){
        //     if(e.target === 'polylinePath1'){
        //         saferoad();
        //         fastroad(null);
        //     }else if(e.target === 'polylinePath2'){
        //         fastroad();
        //         saferoad(null);
        //     }
        // });
        
        
        kakao.maps.event.addListener(polyline2, 'click', function(mouseEvent) {  
        var latlng = mouseEvent.latLng;
        console.log(latlng.toString());         
        });

    }



    // $('#saferoad').on('click = function () {
    //     saferoad();
	//     fastroad();
    //     infowindow.open(map, marker);
    // });

</script>
</body>
</html>