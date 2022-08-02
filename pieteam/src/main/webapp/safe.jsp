<%@page import="com.smhrd.model.Fire"%>
<%@page import="com.smhrd.model.Police"%>
<%@page import="com.smhrd.model.CCTV"%>
<%@page import="com.smhrd.model.Safe"%>
<%@page import="com.smhrd.model.AllDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>안.길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/All.css" />
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
 <meta charset="utf-8">
  <title>안심경로</title>
  <link rel="stylesheet" href="assets/css/safepath.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<body class="is-preload">
<%
//session 값 가지고 오기
		Member loginMember = (Member)session.getAttribute("loginMember");
%>
		<!-- Wrapper -->
			 <div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<%if(loginMember!=null){ %>
								<a href="update.jsp" style="color:black"><h5>개인정보수정</h5></a>
								<a href="LogoutCon" style="color:black"><h5>Logout</h5></a>
								<%if(loginMember.getM_id().equals("admin")){ %>
									<header id="header">
										<ul class="icons">
											<li><button class="form_btn" onclick="changeIframe('selectMember.jsp')">회원정보관리</button></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectCctv.jsp')">CCTV관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectPolice.jsp')">파출소관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectFire.jsp')">소방서관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectSafe.jsp')">어린이보호관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectMember.jsp')">커뮤니티관리</button></a></li>
										</ul>
									</header>
								<%}else{ %>
									<header id="header">
									<ul class="icons">
										<li><a href="main.jsp"><button class="form_btn" ><img src="./images/map.png"></button></a></li>
										<li><a href="cctv.jsp"><button class="form_btn" ><img src="./images/cctv.png"></button></a></li>
										<li><a href="police.jsp"><button class="form_btn" ><img src="./images/경찰2.png"></button></a></li>
										<li><a href="fire.jsp"><button class="form_btn" ><img src="./images/소방서.png"></button></a></li>
										<li><a href="safe.jsp"><button class="form_btn" ><img src="./images/학교.png"></button></a></li>
										<li><a href="reviewList.jsp"><button class="form_btn" ><img src="./images/커뮤니티.png"></button></a></li>
									</ul>
									</header>
								<%} %>
							<%}else{ %>								
								<a href="login.jsp" style="color:black; text-decoration: none; text-align: right"><h5>Login</h5></a>
								<header id="header">
								<ul class="icons">
									<li><a href="main.jsp"><button class="form_btn"><img src="./images/map.png"></button></a></li>
									<li><a href="cctv.jsp"><button class="form_btn" ><img src="./images/cctv.png"></button></a></li>
									<li><a href="police.jsp"><button class="form_btn" ><img src="./images/경찰2.png"></button></a></li>
									<li><a href="fire.jsp"><button class="form_btn" ><img src="./images/소방서.png"></button></a></li>
									<li><a href="safe.jsp"><button class="form_btn" ><img src="./images/학교.png"></button></a></li>
									<li><a href="login.jsp"><button class="form_btn" ><img src="./images/커뮤니티.png"></button></a></li>
								</ul>
								</header>
								<script>
									function mouseOut(){
										$("#img").attr('src','./images/경찰서.png')
									}
								</script>
							<%} %>
							<!-- map-->
								<section id="">
								
<div id="map">
<div class="map_wrap">
</div>
								</section>
						</div>
					</div>
				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">
						
								<section id="search" class="alt">
									<div>
                <form onsubmit="searchPlaces(); return false;">
                    검색  <input type="text" value=" " id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
      출발지  <input type="text" id="start" name="keyword" size="15"> 
      도착지  <input type="text" id="end" name="keyword" size="15"> 
      <button type="button" id="reset" onclick="reset()"><img src="./images/재검색1.png"></button>
      <button type="button" id="saferoad" onclick="saferoad()"><img src="./images/moving.png"></button> 
        </div>
								</section>
			<div style="height: 600px; overflow: auto;">
			<ul id="placesList"></ul>
        	<div id="pagination"></div>
			</div>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=54fe48e5e772cf19d66aaa95bc9c7ba7&libraries=services"></script>
<script>

//마커를 담을 배열입니다
var markers = [];
var markerstart = [];
var markerend = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.1600521, 126.8514371), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = './images/어린이보호.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
 
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
<%
	AllDAO dao = new AllDAO();
	List<Safe> list = dao.selectAllsafe();
	System.out.println(list.size());
/* 	System.out.print(list.get(0).getLat()); */
%>

var Name = [];
var Lat= [];
var Lon=[];
var admin=[];
var tel=[];

<% for (int i=0; i<list.size(); i++){%>
Lat.push(<%=list.get(i).getSz_lat() %>)
Lon.push(<%=list.get(i).getSz_lon() %>)
Name.push("<%=list.get(i).getSz_addr()%>")
admin.push("<%=list.get(i).getAdmin_id()%>")


<%}%>
var positions=[]
var clickedOverlay = null;
	for(var i = 0 ; i<Name.length;i++) {
		positions.push({
	    	content:'<div class="wrap">' + 
	    	
	        '    <div class="info" >' + 
	        '        <div class="title">' +
	        '       어린이보호구역' + 
	        '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
            '                <img src="./images/어린이보호.png" width="73" height="70">' +
            '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="ellipsis">주소 : ' +Name[i]+'</div>' + '<br>' + 
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
    var polyline1, polyline2;
    function saferoad1() {
        // var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        //         mapOption = {
            //             center: new kakao.maps.LatLng(35.155028, 126.911664), // 지도의 중심좌표
            //             level: 3 // 지도의 확대 레벨
            //         };
            // // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            // var map = new kakao.maps.Map(mapContainer, mapOption);
        polyline1 = new kakao.maps.Polyline({
            map: map,
            path: polylinePath1,
            strokeWeight: 4,
            strokeColor: '#6799FF',
            strokeOpacity: 0.7,
            // strokeStyle: 'gradient'
        });
        kakao.maps.event.addListener(polyline1, 'click', function(){
            removePoly2();
        })
    }
    function fastroad() {
        polyline2 = new kakao.maps.Polyline({
        map: map,
        path: polylinePath2,
        strokeWeight: 4,
        strokeColor: '#F15F5F',
        strokeOpacity: 0.7,
        // strokeStyle: 'gradient'
        });
        // var line = new kakao.maps.Marker({
        //     position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
        //     map: map
        // });
        kakao.maps.event.addListener(polyline2, 'click', function(){
            removePoly1();
        })
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
        if(polyline1 != undefined) {
            removePoly1();
            removePoly2();
        }
        saferoad1();
        fastroad();
        // infowindow.open(map, marker);
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
    }
    // kakao.maps.event.addListener(polylinePath2, 'click', function(mouseEvent) { 
    //     removePoly1();
    // });
    // kakao.maps.event.addListener(polylinePath1, 'click', function(mouseEvent) { 
    //     removePoly2();
    // });
    function removePoly1() {
        // for ( var i = 0; i < polylinePath1.length; i++ ) {
        //     polylinePath1[i].setMap(null);
        //     // polylinePath1.setMap(map);
        // }  
        polyline1.setMap(null);
    }
    function removePoly2() {
        // for ( var i = 0; i < polylinePath2.length; i++ ) {
        //     polylinePath2[i].setMap(null);
        // }  
        // polylinePath1 = [];
        polyline2.setMap(null);
    }


    // $('#saferoad').on('click = function () {
    //     saferoad();
	//     fastroad();
    //     infowindow.open(map, marker);
    // });

</script>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script>
			function onClickSelect(e) {
				  const isActive = e.currentTarget.className.indexOf("active") !== -1;
				  if (isActive) {
				    e.currentTarget.className = "select";
				  } else {
				    e.currentTarget.className = "select active";
				  }
				}

				document.querySelector("#theme .select").addEventListener("click", onClickSelect);

				function onClickOption(e) {
				  const selectedValue = e.currentTarget.innerHTML;
				  document.querySelector("#theme .text").innerHTML = selectedValue;
				}

				var optionList = document.querySelectorAll("#theme .option");
				for (var i = 0; i < optionList.length; i++) {
				  var option = optionList[i];
				  option.addEventListener("click", onClickOption);
				}
			</script>

	</body>
</html>