<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Content Page</title>
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
												<h1 class="h3 mb-2 text-gray-800">게시판</h1>
												<br>
							
												<div class="card shadow mb-4">
													<div class="card-header py-3">
														<span class="m-0 font-weight-bold text-primary">글 상세 보기</span>
													</div>
													<div class="card-body">
							
														<div class="form-group">
															<label>글번호</label> 
															<input class="form-control" id='boardNo' name='boardNo' value="${ board.boardNo }">
														</div>
							
														<div class="form-group">
															<label>제목</label> 
															<input class="form-control" id='title' name='title' value="${ board.title }">
														</div>
							
														<div class="form-group">
															<label>내용</label>
															<textarea class="form-control" rows="3" 
																id='content' name='content'>${ board.content }</textarea>
														</div>
							
														<div class="form-group">
															<label>작성자</label> 
															<input class="form-control" id='writer'	name='writer' value="${ board.writer }">
														</div>
							
														<div class="form-group">
															<label>작성일자</label> 
															<fmt:formatDate var="formattedRegDate" value="${ board.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>
															<input class="form-control" id='regDate' value="${ formattedRegDate }">
														</div>
							
														<div class="form-group">
															<label>조회수</label> 
															<input class="form-control" id='readCount' value="${ board.readCount }">
														</div>
							
														<button id="edit-button" type="button" class="btn btn-success">수정</button>
														<button id="delete-button" type="button" class="btn btn-success">삭제</button>
														<button id="tolist-button" type="button" class="btn btn-success">목록</button>
							
													</div>
												</div>
							
												<br>
												<br>
												<br>
												<br>
												<br>
							
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
$(function() {
	$(".form-group input, .form-group textarea").attr('readonly', true);
	
	$('#edit-button').on('click', function(event) {
		location.href = "edit?boardNo=${ board.boardNo }";
	})
	
	$('#delete-button').on('click', function(event) {
		var yes = confirm('${ board.boardNo }번 게시글을 삭제하겠습니까?');
		if (yes) {
			location.href = "delete?boardNo=${ board.boardNo }";	//$니까 jquery가 아닐까? ㄴㄴ아님. 서버쪽에서 처리되는 언어 EL로 인식됨.
		}
	});
	
	$('#tolist-button').on('click', function(event) {
		location.href = "list";
	})
});
</script>
</body>

</html>