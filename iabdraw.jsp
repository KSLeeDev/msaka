<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>Happydraw!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Parallax Content Slider with CSS3 and jQuery" />
        <meta name="keywords" content="slider, animations, parallax, delayed, easing, jquery, css3, kendo UI" />
        <meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="resources/Image/face.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<link href='http://fonts.googleapis.com/css?family=Economica:700,400italic' rel='stylesheet' type='text/css'>
		<noscript>
			<link rel="stylesheet" type="text/css" href="css/nojs.css" />
		</noscript>
<script src="https://kit.fontawesome.com/e8f495f95b.js"
	crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="./resources/css/styles.css" />
</head>
<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            	<div class="navbar_logo">
                <i class="fa-solid fa-cubes-stacked"></i>
                <a class="navbar-brand" href="main.jsp">Happydraw</a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="main.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="intro.jsp">기업 소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="main.jsp">상품 목록</a></li>
                       
                        <li class="nav-item dropdown">
                        
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            	
                                <li><a class="dropdown-item" href="board.jsp">공지사항</a></li>
                                <li><a class="dropdown-item" href="./qus.jsp">문의하기</a></li>
                                
                                
                            </ul>
                        </li>
                        
                    </ul>
                    <%--장바구니 기능 --%>
                    <form class="d-flex">
                        <a href="./search.jsp" class="btn btn-outline-dark mt-auto">응모 내역</a>
                    </form>
                </div>
            </div>
        </nav>	
	
    <div class="container">
		<!-- Codrops top bar -->
		<div id="da-slider2" class="da-slider2">
			<div class="da-slide2">
				<h2>응모하기</h2>
				<div class="da-img2"><img src="./resources/Image/inin.jpg" width="1250" height="340" alt="iab.jpg" /></div>
                <br>
                <a href="./main.jsp" class="da-link2">응모 목록</a>
            </div>
		</div>
	</div>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.cslider.js"></script>
	<script type="text/javascript">
		$(function() {
		
			$('#da-slider').cslider();
			
		});
	</script>	
	
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">	
	<div class="container">
	
				
		<h1>제품 상세</h1>
		<img src="./resources/Image/ab1.jpg" width="950" height="420">
		<br>
		<br>
		<img src="./resources/Image/ab2.jpg"width="950" height="420">
		<br>
		<br>
		<hr>
		<br>
        <form action="./processAddressInput.jsp" method="get" onsubmit="ok()">
			<script>
				function ok() {
				  alert("응모 완료되었습니다. 응모해주셔서 감사합니다.");
				}
				</script>
		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-3">
				<input type="text" name="name" class="form-control" >
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-3">
				<input type="email" id="email"  name="email" class="form-control" >
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-3">
				<input type="text" id="phone"  name="phone" class="form-control" >
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">응모 상품</label>
			<div class="col-sm-3">
				<select name="table">
					<option value="iab">아이앱 하프</option>
					<option value="jordan">조던 미드 다크틸</option>
					<option value="macbook">맥북 프로</option>
					<option value="airpod">에어팟 맥스</option>
				</select>
				</div>
		</div>


				 <div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input id="member_post" type="text" placeholder="도로명주소 입력" readonly
							onclick="findAddr()"> 
						<input id="member_addr" type="text" name="address1"
							placeholder="주소" readonly class="form-control"> 
						<input type="text" name="address2" placeholder="상세 주소" class="form-control">
						<script>
							function findAddr() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
	
												console.log(data);
	
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
												// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var roadAddr = data.roadAddress; // 도로명 주소 변수
												var jibunAddr = data.jibunAddress; // 지번 주소 변수
												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('member_post').value = data.zonecode;
												if (roadAddr !== '') {
													document
															.getElementById("member_addr").value = roadAddr;
												} else if (jibunAddr !== '') {
													document
															.getElementById("member_addr").value = jibunAddr;
												}
											}
										}).open();
							}
						</script>
						<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					</div>
				</div>
				<br>


		<div class="form-group row2">
			<div class="col-sm-13">
				<input type="submit" value="응모하기" >
			</div>
		</div>

		

		
	</form>


		<br><h5>[응모 일정]
		<br>4월 17일(월) 오후 1시 ~ 5월 2일(일) 오후 1시</h5>
		<br>
		<br>
		<br>[응모 안내 사항]
		<br>이번 응모는 "HAPPYDRAW" 사이트를 통해서만 가능합니다.
		<br>응모 당일 접속 인원이 많아 오류가 발생할 수 있으니 사전 상품 옵션 확인을 권장합니다.
		<br>- 회원가입 필요없이 응모 기간 내에 응모가 가능합니다.
		<br>- 응모 당일 접속 인원이 많을 경우 응모 과정에서 오류가 발생할 수 있어 응모 후 반드시 응모 내역을 확인 부탁드립니다.
		<br>- 응모 시 지정된 옵션으로만 응모가 가능하며 응모 이후 취소 및 옵션 변경이 불가하므로 신중히 응모를 부탁드립니다.
		<br>
		<br>
		<br><h5>[당첨자 발표]
		<br>
		5월 3일(수) 오전 11시
		<br>
		<br>
		<br>[배송지 입력 기간]
		<br>5월 3일(수) 오전 11시 ~ 5월 5일(금) 오전 11시
		<br>
		<br>
		<br>[미수령 당첨자 발표]
		<br>5월 8일(월) 오전 11시 </h5>
		<br>
		<br>
		<br>[배송 안내 사항]
		<br>- HAPPYDRAW 라플 제품의 경우 출고 순서는 결제 시간과 무관한 점 참고 부탁드립니다.
		<br>- 라플 특성상 물류 출고량이 많아 배송이 지연되는 점 양해 부탁드립니다. 
		<br>
		<br>
		<br>[세탁 및 취급 시 주의사항]

		<br>- 원단 특성상 마찰에 의한 올 뜯김 또는 보풀이 일어날 수 있으므로 취급 시 주의하십시오.
		<br>- 의류에 프린트나 장식물이 있는 경우 뒤집어 세탁하시고, 비벼서 세탁하지 마십시오.
		<br>- 이염 우려가 있으니 물이나 땀에 젖은 경우 젖은 상태로 보관하지 마시고, 신속히 단독 세탁하여 주십시오.
		<br>- 온수에 세탁하지 마시고, 반드시 찬물에 세탁하여 주십시오.
		<br>- 세탁 후에는 옷걸이를 이용하여 겹쳐지지 않게 건조해 주십시오.
		<br>- 기계 건조(열건조)는 의류가 손상이 되므로 삼가 주십시오.
		<br>- 미세한 크기의 잡사가 있을 수 있습니다. 이 부분은 불량이 아닌 점 안내드립니다.
		<br>- 피그먼트 워싱 제품일 경우 물 빠짐 및 이염 현상이 발생할 수 있어 반드시 단독 세탁하여 주십시오.
		<br>- 부분 세탁을 할 경우 부분 탈색 현상이 발생될 수 있으니 단독 세탁하여 주십시오.
	</div>
	</div>
	</section>
	
	<br>
	<hr>
	<%@ page import="java.util.Date"%>


	<footer class="container">
		<p>&copy; Happydraw</p>
		<br>
		<p>대표 : 박성호, 이강인, 양진영, 이경서, 최수연</p>
	</footer>
		<hr>	
	<div class="text-center">
	<%
	
	Date day = new java.util.Date();
	String am_pm;
	int hour = day.getHours();
	int minute = day.getMinutes();
	int second = day.getSeconds();
	if (hour / 12 == 0) {
		am_pm = "AM";
	} else {
		am_pm = "PM";
		hour = hour - 12;
	}
	String CT = hour + ":" + minute + ":" + second + " " + am_pm;
	out.println("현재 접속  시각: " + CT + "\n");
	%>
</div>

	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script> 
		
</body>
</html>
