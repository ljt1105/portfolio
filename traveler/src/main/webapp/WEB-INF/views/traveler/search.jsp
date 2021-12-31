<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Flight Search </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="CodedThemes">
    <meta name="keywords"
    content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
	<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
</head>

<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
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

                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                
                                    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont-file-code bg-c-blue"></i>
                                                    <div class="d-inline">
                                                        <h4>항공편 검색</h4>
                                                        <span>2021년 인천항공출발 하계 항공스케쥴만 검색됩니다.</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                        <li class="breadcrumb-item">
                                                            <a href="/traveler/">
                                                                <i class="icofont icofont-home"></i>
                                                            </a>
                                                        </li>                                                      
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Page-header end -->

                                    <!-- Page body start -->
                                    <div class="page-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <!-- Basic Form Inputs card start -->
                                                <div class="card">
                                                    <div class="card-header">                                                   
                                                        <div class="card-header-right"><i
                                                            class="icofont icofont-spinner-alt-5"></i></div>

                                                            <div class="card-header-right">
                                                                <i class="icofont icofont-spinner-alt-5"></i>
                                                            </div>

                                                        </div>
                                                        <div class="card-block">
                                                          
                                                            <form action="search" id="searchForm">
                                                                <div class="form-group row">
                                                                   <label class="col-sm-2 col-form-label">목적지</label> 
                                                                   <select id="destination" name="destination">
																	<c:forEach var="destination" items="${ destinations }">
																		<option value="${ destination }"
																			${ selectedDestination == destination ? "selected" : "" }>${ destination }</option>
																	</c:forEach>
																</select>
                                                                </div>
                                                                 <div class="form-group row">
                                                                    <label class="col-sm-2 col-form-label">항공사</label> 
                                                                    <select id="airline" name="airline">
																	<c:forEach var="airline" items="${ airlines }">
																		<option value="${ airline }"
																			${ selectedAirline == airline ? "selected" : "" }>${ airline }</option>
																	</c:forEach>
																</select>
                                                                </div>    
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">출발요일</label> 
                                                                        <select id="day" name="day">
																	<c:forEach var="day" items="${ days }">
																		<option value="${ day }"
																			${ selectedDay == day ? "selected" : "" } >${ day }</option>
																	</c:forEach>
																</select>
                                                                        </div>
                                                                    </form>
                                                                    </div>
                                                                    </div>
                                                          </div></div></div>
																																							                                                                                                                             
                                                                <!-- 검색창 -->
																<div class="card">
																	<div class="card-block">                                                                                 
																		 	
																		 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		 		<button id="search-button" class="btn btn-success btn-round" type="button" name ="click" value ="검색">&nbsp;검색&nbsp;</button>																		 		 
																		 		 &nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	
																		 		<button class="btn btn-danger btn-round" type="button" name="click" value="초기화">초기화</button>
																		 																	            
																	</div>	
																</div>	
																									
										                       <!-- 검색결과 -->
                                                                <div class="card">
                                                                	<div class="card-header">
                                                                        <h5>검색결과</h5>                                                                       
                                                                        <table border="1" width="1100px">
                                                                        	<tr>
																				<th>출발요일</th>
																				<th>항공편</th>
																				<th>출발시간</th>
																				<th>운항 시작일</th>
																				<th>운항 종료일</th>
																				<th>항공사</th>
																				<th>목적지</th>
																			</tr>
																			     <c:forEach var="flightList" items="${ flightList }">   
																			     <tr>                                                                	
																				<th>${ flightList.day }</th>
																				<th>${ flightList.flight }</th>
																				<th>${ flightList.time }</th>
																				<th>${ flightList.date_from }</th>
																				<th>${ flightList.date_to }</th>
																				<th>${ flightList.airline }</th>
																				<th>${ flightList.destination }</th>
																			</tr>
																		     </c:forEach>
																			
                                                                        </table>                                                                     
                                                                    </div>
                                                                </div>
                                                                 </div></div></div></div></div></div></div></div>  
																


<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

<script type="text/javascript">
	$(function() {
		
		//검색조건 선택
		$('#airline').on('change',function(event) {
			var destination = $('#destination').val();
			location.href = "search?destination=" + destination + "&airline="+ $(this).val();
		});
		
		// destination 선택을 변경하는 경우 서버로 요청 전송
		$('#destination').on('change',function(event) {
			location.href = "search?destination="+ $(this).val();
		});
		
		//검색버튼 
		$('#search-button').on('click', function(event) {
			var destination = $('#destination').val();
			var airline = $('#airline').val();
			var day = $('#day').val();
			if (!destination || !airline || !day) {
				alert("조회 조건을 모두 선택하세요");
				return;
			}
			location.href = "search2?destination=" + destination + "&airline="+ airline + "&day=" + day;
		});
		
	
		
	})
</script>


<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
</script>

</body>

</html>