<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Main Page</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
      <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
      <style>
		table {
		  font-family: arial, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		td, th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 8px;
		}
		
		tr:nth-child(even) {
		  background-color: #F0FFFF;
		}
				/* banner */
		.banner {position: relative; width: 1200px; height: 360px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
		.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
		.banner ul li {float: left; width: 1200px; height: 360px; margin:0; padding:0;}
		
		/* swiper */
		.swiper-container {
			height:420px;
			border:5px solid silver;
			border-radius:7px;
			box-shadow:0 0 20px #ccc inset;
		}
		.swiper-slide {
			text-align:center;
			display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
			align-items:center; /* 위아래 기준 중앙정렬 */
			justify-content:center; /* 좌우 기준 중앙정렬 */
		}
		.swiper-slide img {
			box-shadow:0 0 5px #555;
			max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
			/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
		}
	
		</style>
  </head>

  <body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">

                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
			<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                	<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <div class="main-body">
                                <div class="page-wrapper">

                                    <div class="page-body">
                                        <div class="row">
                                      
                                        <!-- card1 start -->
                                          <span style="text-align:left; margin-top:10px; font-size:30px; color:pink">공지 사항</span>
											<div class="contents">
												<div class="banner">
													<ul>
														<li><img src="resources/images/slide1.jpg" width="1200" height="360px"></li>
														<li><img src="resources/images/slide2.jpg" width="1200" height="360px"></li>
														<li><img src="resources/images/slide3.jpg" width="1200" height="360px"></li>
													</ul>
												</div>
											</div>
										</div>
										<br><br><br><br><br>
										<div>	
                                            
                                            <!-- card1 end -->
                                            
                                            <!-- card2 start -->
                                            <span style="text-align:left; margin-top:10px; font-size:30px; color:green">추천 여행</span>

												<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
												<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
												

												<div class="swiper-container">
													<div class="swiper-wrapper">
														<div class="swiper-slide"><img src="resources/images/그림1.jpg"></div>
														<div class="swiper-slide"><img src="resources/images/그림2.jpg"></div>
														<div class="swiper-slide"><img src="resources/images/그림3.jpg"></div>
														<div class="swiper-slide"><img src="resources/images/그림4.jpg"></div>
														<div class="swiper-slide"><img src="resources/images/그림5.jpg"></div>
														<div class="swiper-slide"><img src="resources/images/그림6.jpg"></div>
														<div class="swiper-slide"><img src="resources/images/그림7.jpg"></div>
														<div class="swiper-slide"><img src="resources/images/그림8.jpg"></div>
													</div>
												
													<!-- 네비게이션 -->
													<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
													<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
												
													<!-- 페이징 -->
													<div class="swiper-pagination"></div>
												</div>
                               
                                            <!-- card2 end -->
                                            
									                                            
									                <!-- Begin Page Content -->
									                <div class="container-fluid">
									
									                    <!-- Page Heading -->
									                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
									                        <h1 class="h3 mb-0 text-gray-800">게시판</h1>
									                    </div>
									
														<!-- DataTales Example -->
									                    <div class="card shadow mb-4">
									                        <div class="card-header py-3">
									                            <span class="m-0 font-weight-bold text-primary">글 목록</span>
									                            
									                            <div style="clear:both"></div>
									                        </div>
									                        <div class="card-body">
									                            <div class="table-responsive">
									                                <table class="table table-hover" id="dataTable">
									                                    <thead>
									                                        <tr>
									                                            <th>글번호</th>
									                                            <th>제목</th>
									                                            <th>작성자</th>
									                                            <th>작성일자</th>
									                                            <th>조회수</th>
									                                        </tr>
									                                    </thead>
									                                    <tbody>
									                                    <c:forEach var="board" items="${ boards }">
									                                        <tr>
									                                            <td>${ board.boardNo }</td>
									                                            <td>
									                                            <c:choose>
									                                            	<c:when test="${ not board.deleted }">
									                                            		<c:choose>
										                                            	<c:when test="${ loginuser == null }">
										                                            	<a href="/traveler/account/login.action">${ board.title }</a>
										                                            	</c:when>
									                                            		<c:otherwise>
									                                            		<a href="/traveler/board/detail?boardNo=${ board.boardNo }">${ board.title }</a>
									                                            		</c:otherwise>
									                                            		</c:choose>
									                                            	</c:when>
									                                            	<c:otherwise>
									                                            	<span style="color:lightgray">${ board.title } [삭제된 글]</span>
									                                            	</c:otherwise>
									                                            </c:choose>
									                                            </td>
									                                            <td>${ board.writer }</td>
									                                            <td>${ board.regDate }</td>
									                                            <td>${ board.readCount }</td>
									                                        </tr>
									                                    </c:forEach>
									                                    </tbody>
									                                </table>
									                            </div>
									                        </div>
									                    </div>
									
									                
									
									                </div>
																				                
                                            
                                            <!-- card3 end -->
                                            
                                            
                                            <!-- Statestics Start -->

                                            
                                            <!-- Email Sent End -->
                                            <!-- Data widget start -->
                                            
                                                <!-- Data widget End -->
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Warning Section Starts -->
        <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="resources/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="resources/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="resources/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="resources/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="resources/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
<!-- Warning Section Ends -->
<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<script type="text/javascript">
	
	new Swiper('.swiper-container', {
	
		slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 5, // 슬라이드간 간격
		slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	
		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,
	
		loop : true, // 무한 반복
	
		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
		
	});

	//////////////////////////
	
	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();
		var $bannerHeight = $banner.children().outerHeight();
		var $length = $banner.children().length;
		var rollingId;

	
		// rollingId = setInterval(function() { rollingStart(); }, 3000);
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);

			$banner.animate(
					{left: - $bannerWidth + "px"}, 
					5000, 
					function() {
						$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
						$(this).find("li:first").remove();		
						$(this).css("left", 0);
						
						setTimeout(function() { rollingStart(); }, 2000);
					}
			);
		}
		rollingStart(); 
	}); 
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</body>

</html>