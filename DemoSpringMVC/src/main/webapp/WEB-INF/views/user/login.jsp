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
					<h3 class="head text-center">ĐĂNG NHẬP</h3>
					<p class="text-center">Nếu đã có tài khoản, hãy đăng nhập theo
						form dưới đây</p>

					<form:form action="login" method="POST" modelAttribute="user">
						<div>
							<span>Tài khoản<label>*</label></span>
							<form:input type="text" path="login_name" />
						</div>
						<div>
							<span>Mật khẩu<label>*</label></span>
							<form:input path="hashed_passwd" type="password" />
						</div>
						<p class="login-failed">${message}</p>
						<input type="submit" value="Đăng nhập">
						<div style="width: 96%; text-align: center; margin: 20px 0">
							<a class="forgot" href="<c:url value='/forgotpassword'/>">Quên mật khẩu?</a>
						</div>
						<button class="login-with-email-button">
							<a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/DemoSpringMVC/login-google&response_type=code
   			 	&client_id=675097819608-da01rljvknqvu5otqqb1co7lfc75r3v6.apps.googleusercontent.com&approval_prompt=force">Đăng
								nhập với tài khoản Google</a>
						</button>
						
					</form:form>

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
