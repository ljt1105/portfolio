<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Board Write Page</title>
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
                                            
						                <!-- Begin Page Content -->
						                <div class="container-fluid">
						
						                    <!-- Page Heading -->
						                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
						                        <h1 class="h3 mb-0 text-gray-800">게시판</h1>
						                    </div>
						
											<div class="card shadow mb-4">
						                         <div class="card-header py-3">
						                             <h6 class="m-0 font-weight-bold text-primary">글 쓰기</h6>
						                         </div>
						                         <div class="card-body">
						                             <form id="board-write-form" action="write" method="post">
						                             	<div class="form-group">
						                             		<label>제목</label>
						                             		<input type="text" class="form-control" name="title">
						                             	</div>
						                             	<div class="form-group">
															<label>작성자</label> 
															<input class="form-control" id='writer' name='writer' value="${ loginuser.memberID }">
														</div>
						                             	<div class="form-group">
						                             		<label>내용</label>
						                             		<textarea class="form-control" name="content" rows="5"></textarea>
						                             	</div>
						                             	<button id="write-button" class="btn btn-primary btn-sm">쓰기</button>
						                             	<button id="tolist-button" class="btn btn-primary btn-sm">목록</button>
						                             </form>	
						                         </div>
						                     </div>
						
						                </div>
						                <!-- /.container-fluid -->
                                                
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

<script>
var $window = $(window);
</script>

<script type="text/javascript">
$(function() {	// jQuery의 main 함수 역할 (시작점)

	$('#write-button').on('click', function(event){
		event.preventDefault();		// 이벤트를 발생시킨 객체의 기본 동작 (다른 페이지로 이동 등) 의 수행을 차단
		event.stopPropagation();	// 상위 객체로 이벤트 전달 차단
		
		// 입력 데이터의 유효성 검사 등 처리
		
		$('#board-write-form').submit();	// form을 서버로 전송
		
	});
	
	$('#tolist-button').on('click', function(event){
		event.preventDefault();	// 이벤트를 발생시킨 객체의 기본 동작 (다른 페이지로 이동 등) 의 수행을 차단
		event.stopPropagation();	// 상위 객체로 이벤트 전달 차단
		
		location.href="list";
		
	});

});
</script>
</body>

</html>