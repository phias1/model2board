<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 현재 파일 위치에서 include 디렉토리의 header.jsp 파일의 코드를 가져와서 삽입 -->
<%@ include file="include/header.jsp"%>
<section class="content">
	<div class="box">

		<div class="box-header with-border" id="address"></div>


		<c:if test="${user == null}">
			<div class="box-header with-border">
				<a href="user/login"><h3 class="box-title">로그인</h3></a>
			</div>


			<div class="box-header with-border">
				<a href="user/register"><h3 class="box-title">회원가입</h3></a>
			</div>
		</c:if>


		<c:if test="${user != null}">
			<div class="box-header with-border">
				<a href="user/logout"><h3 class="box-title">로그아웃</h3></a>
			</div>
		</c:if>
	</div>
</section>

<%@ include file="include/footer.jsp"%>

<c:if test="${msg != null}">
	<!-- jquery에서 다이얼로그 다운  jquery 1.24 지우기 
먼저 다운받아놨기때문에 2개이상이면 충돌이 일어나서 실행이 안됨-->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
      $(function() {
         $("#dialog-message").dialog({
            modal : true,
            buttons : {
               Ok : function() {
                  $(this).dialog("close");
               }
            }
         });
      });
   </script>
	</head>
	<body>

		<div id="dialog-message" title="회원가입 성공!!!">
			<p>
				<span class="ui-icon ui-icon-circle-check"
					style="float: left; margin: 0 7px 50px 0;"></span> 축하합니다! 회원가입이
				성공하였습니다. 많은 이용 부탁드리겠습니다.
			</p>
		</div>
</c:if>

<script>
   //10초마다 한번씩 동작하는 타이머
   setInterval(function() {
      //현재 접속한 브라우저의 위도와 경도 출력하기
      navigator.geolocation.getCurrentPosition(function(position) {
         //위도와 경도를 묶어서 하나의 문자열로 만들기
         loc = position.coords.latitude + "-" + position.coords.longitude;
         //address라는 URL에 loc를 파라미터로 넘겨서
         //json 타입으로 데이터를 받아오는 ajax 요청
         $.ajax({
            url : "address",
            data : {"loc" : loc},
            dataType : "json",
            success : function(data) {
               document.getElementById("address").innerHTML = 
                  "<h3>" + data.address + "</h3>";
                  
            }
         });

      });
   }, 10000);
</script>














