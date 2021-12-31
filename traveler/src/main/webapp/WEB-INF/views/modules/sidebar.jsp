<%@ page import="com.traveler.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<ul class="pcoded-item pcoded-left-item">
			<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Board</div>
			<li>
			<c:choose>
			<c:when test="${ loginuser == null }">
				<a href="/traveler/account/login.action">
			</c:when>
			<c:otherwise>
				<a href="/traveler/board/list">
			</c:otherwise>
			</c:choose>
					<span class="pcoded-micon"><i class="ti-view-list-alt"></i><b>D</b></span>
					<span class="pcoded-mtext" data-i18n="nav.dash.main">게시판</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
		</ul>
		<ul class="pcoded-item pcoded-left-item">
			<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Search Flight</div>
			<li>
			<c:choose>
			<c:when test="${ loginuser == null }">
				<a href="/traveler/account/login.action">
			</c:when>
			<c:otherwise>
				<a href="/traveler/traveler/search">
			</c:otherwise>
			</c:choose>
				<span class="pcoded-micon"><i class="ti-ticket"></i><b>FC</b></span>
				<span class="pcoded-mtext" data-i18n="nav.form-components.main">항공기 조회</span>
				<span class="pcoded-mcaret"></span>
			</a></li>
		</ul>
		<ul class="pcoded-item pcoded-left-item">
			<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">View Charts</div>
			<li class="pcoded-hasmenu">
			<a href="javascript:void(0)">
				<span class="pcoded-micon"><i class="ti-pie-chart"></i><b>FC</b></span>
				<span class="pcoded-mtext" data-i18n="nav.form-components.main">항공기 운항 차트</span>
				<span class="pcoded-mcaret"></span>
			</a>
			<ul class="pcoded-submenu">
                <li class=" ">
                  <a href="/traveler/traveler/graph">
                     <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                      <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">월별 항공기 요일 운항 횟수</span>
                      <span class="pcoded-mcaret"></span>
                    </a>
                   </li>
               </ul>
			</li>
		</ul>
		<ul class="pcoded-item pcoded-left-item">
			<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">My Account</div>
			<li class="pcoded-hasmenu">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-user"></i></span>
                    <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">계정관리</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">
                <c:choose>
                <c:when test="${ loginuser == null}">
                    <li class=" ">
                        <a href="/traveler/account/login.action">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">로그인</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="/traveler/account/register.action">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">회원가입</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                    </c:when>
                    <c:otherwise>
                    <li class=" ">
                       <a href="/traveler/account/logout.action">
                           <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                           <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">로그아웃</span>
                           <span class="pcoded-mcaret"></span>
                       </a>
                   </li>
                   <li class=" ">
                       <a href="/traveler/account/mypage.action">
                           <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                           <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">마이페이지</span>
                           <span class="pcoded-mcaret"></span>
                       </a>
                   </li>
                   </c:otherwise>
                   </c:choose>
                </ul>
            </li>
		</ul>
		
		<c:choose>
		<c:when test="${ loginuser.usertype == 'admin'}">
		<ul class="pcoded-item pcoded-left-item">
			<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Admin</div>
			<li class="pcoded-hasmenu">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-settings"></i></span>
                    <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">관리자 페이지</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">
                    <li class=" ">
                        <a href="/traveler/account/list.action">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">멤버 리스트</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="/traveler/schedules/init-data.action">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">데이터 초기화</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
		</c:choose>
		

</nav>