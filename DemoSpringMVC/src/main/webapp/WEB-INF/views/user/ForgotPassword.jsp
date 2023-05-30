<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- content-section-starts -->
<div class="content">
	<div class="container">
		<div class="login-page">
			<div class="dreamcrub">
				<ul class="breadcrumbs">
					<li class="home"><a href="<c:url value='/trang-chu'/> "
						title="Go to Home Page">Trang chủ</a>&nbsp; <span>&gt;</span></li>
					<li>Đăng nhập</li>
				</ul>
				<ul class="previous">
					<!-- 	<li><a href="index.html">Back to Previous Page</a></li> -->
					<li><button onclick="backButton()">Trở về trang
							trước</button></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="account_grid">
				<div class="login-right wow fadeInRight" data-wow-delay="0.4s">
					<h3 class="head text-center">TÌM TÀI KHOẢN</h3>


					<form action="Verifyforgotpassword" method="POST" >
						<div>
							<span>Email<label>*</label></span>
							<input type="text" name="email" />
						</div>
						<c:if test="${error != null}">
						<p class="login-failed">${error}</p>
						</c:if>
						<input type="submit" value="Tìm kiếm">
						
					</form>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<script>
			function backButton() {
				window.history.back();
			}
		</script>
	</div>

</div>