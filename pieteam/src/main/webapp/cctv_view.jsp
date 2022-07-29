<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>

      a{
      text-decoration:none;
      color:white;
      }
      img {
      	position: absolute;
      }
    
      img#north {
      	top: 50px;
      	left : 400px;
      }
      img#west {
      	top: 205px;
      	left : 350px;
      }
        img#east{
      	top: 223px;
      	left : 509px;
      }
         img#south {
   
      	top: 238px;
      	left : 284px;
      }
        img#gs {

      	top: 52px;
      	left : 125px;
      }
  
	
    </style>
  </head>
  <body>

  
 <a href="#" target="_blank">
<img src="./images/북구.png" id="north" name="북구" >
</a>
 <a href="cctv.jsp" target="_blank">
<img src="./images/동구.png" id="east" name="동구">
</a>
 <a href="#" target="_blank">
<img src="./images/남구.png" id="south" name="남구">
</a>
 <a href="#" target="_blank">
<img src="./images/서구.png" id="west" name="서구">
</a>
 <a href="#" target="_blank">
<img src="./images/광산구.png" id="gs" name="광산구">
</a>


  </body>
</html>