<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- header-section-starts -->
<div class="header">
	<div class="header-info">
		<span>Hotline: 0971.211.817 - Email: meowmeowshop@gmail.com</span>
	</div>
	<div class="header-top-strip">
		<div class="container">
			<div class="header-top-left col-xs-8">
				<div class="logo">
					<a href="<c:url value='/trang-chu'/> "><img class="logo-img"
						src="<c:url value='/template/user/images/logo1.png'/> " alt=""><img
						class="logo-text"
						src="<c:url value='/template/user/images/logo-text.png'/> " alt=""></a>

				</div>
			</div>
			<div class="header-right col-xs-4">

				<form:form action="${pageContext.request.contextPath}/search"
					method="POST">
					<div class="container-header-search-bar">
						<input class="header-search-bar" type="text" name="keyword"
							id="keyword" value="${keyword}"
							placeholder="Tìm kiếm sản phẩm..." />
						 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input class="header-search-bar-button" type="submit" value="" />
					</div>
				</form:form>

				<div class="dropdown">
					<img class="dropimg"
						src="<c:url value='/template/user/images/account.png'/>" />
					<div class="dropdown-content">
						<c:if test="${empty UserInfo}">
							
								<a href="<c:url value='/login'/> "><span
									class="glyphicon glyphicon-user"> </span>ĐĂNG NHẬP</a>
								<a href="<c:url value='/register'/> "><span
									class="glyphicon glyphicon-lock"> </span>ĐĂNG KÝ</a>

							
						</c:if>
						<c:if test="${not empty UserInfo}">
							<a href="<c:url value='/profile/${UserInfo.getLogin_name()}' />"><span
								class="glyphicon"> </span>${UserInfo.getFull_name()}</a>
							<a href="<c:url value='/logout'/>"><span
								class="glyphicon glyphicon-log-out"> </span>ĐĂNG XUẤT</a>
						</c:if>
						
					</div>
				</div>
				<div class="cart">
					<a href="<c:url value='/cart'/> " class="simpleCart_empty"><img
						src="<c:url value='/template/user/images/cart-shopping.png'/> "
						alt=""></a> <span id="" class="cart-header-quantity">
						${TotalQuantity} </span>
					<div class="clearfix"></div>
				</div>


				<%-- <a href="<c:url value='/cart'/> ">
							<h3>
								<span class="simpleCart_total"> 0 </span> (<span
									id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>)<img src="<c:url value='/template/user/images/bag.png'/> " alt="">
							</h3>
						</a> --%>

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- header-section-ends -->
<div class="banner-top">
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!--/.navbar-header-->

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value='/trang-chu'/> ">TRANG CHỦ</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">SẢN PHẨM <b class="caret"></b></a>
						<ul class="dropdown-menu multi-column columns-3">
							<div class="row">
								<div class="col-sm-4">
									<ul class="multi-column-dropdown">
										<c:forEach var="item" items="${Category}">
											<li><a href="<c:url value='/product/${item.id}'/>"><span
													class="">${ item.cate_name }</span></a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="col-sm-4">
									<ul class="multi-column-dropdown">
										<c:forEach var="item" items="${Category2}">
											<li><a href="<c:url value='/product/${item.id}'/>"><span
													class="">${ item.cate_name }</span></a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="col-sm-4">
									<ul class="multi-column-dropdown">
										<c:forEach var="item" items="${Category3}">
											<li><a href="<c:url value='/product/${item.id}'/>"><span
													class="">${ item.cate_name }</span></a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</ul></li>
					<li><a href="#">CONTACT</a></li>
				</ul>
			</div>
			<!--/.navbar-collapse-->
		</nav>
		<!--/.navbar-->
	</div>
</div>