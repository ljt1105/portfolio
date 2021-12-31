<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Manage My Account Page</title>
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
		  width: 50%;
		}
		
		td, th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 8px;
		}
		
		tr:nth-child(even) {
		  background-color: #f8f8f8;
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
                                            
               <!-- Begin Page Content -->
               <div class="container-fluid">
                   <!-- Page Heading -->
                   <div class="d-sm-flex align-items-center justify-content-between mb-4">
                       <h1 class="h3 mb-0 text-gray-800">개인정보수정</h1>
                   </div>
                   <!-- DataTales -->
                   <div class="card shadow mb-4">
                   <form id="account-update-form" role="form" action="update" method="post">
                   <!-- 이메일 정보 뿐만 아니라 프라임키인 memberID도 넘겨야 테이블 안에서 멤버를 특정해서 이메일 정보를 넣게 할 수 있다. -->
                   	<input type="hidden" name="memberID" value="${ loginuser.memberID }" >
					 <div class="card-header py-3">
					     <a id="account-update-button" class="btn btn-primary btn-sm" style="float:right; color:white">수정완료</a>
					     <div style="clear:both"></div>
					 </div>
					 <div class="card-body">
					     <div class="table-responsive">
							<table class="table table-hover" id="dataTable">
                                <tr>
			                   		<th>ID</th>
			                   		<td>${ loginuser.memberID }</td>
			                   	</tr>
                                <tr>
			                   		<th>이메일</th>
			                   		<td><input class="form-control" id='email' name='email' value='${ loginuser.email }'></td>
			                   	</tr>
                                <tr>
			                   		<th>가입일자</th>
			                   		<td>${ loginuser.regDate }</td>
			                   	</tr>
							</table>
						</div>
					</div>
					</form>
					</div>
           		</div>
                <!-- /.container-fluid -->
                                            
                                            
                                        </div>
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
$(function() {
	$('#account-update-button').on('click', function(event) {
		$('#account-update-form').submit();
	});
});
</script>
</body>

</html>