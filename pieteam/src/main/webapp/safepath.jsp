<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

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